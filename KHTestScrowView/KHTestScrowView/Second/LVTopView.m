//
//  LVTopView.m
//  KHTestScrowView
//
//  Created by 宇航 on 16/12/2.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "LVTopView.h"
#import "ContentBaseView.h"
#import "LVTool.h"

@interface LVTopView ()
@property (strong,nonatomic)UIButton *leftBtn;
@property (strong,nonatomic)UIButton *rightBtn;
@property(strong,nonatomic)UIImageView *leftBottomImg;
@property(strong,nonatomic)UIImageView *rightBottomImg;
@end
@implementation LVTopView

//懒加载顶部（最新主题）按钮
-(UIButton *)leftBtn{
    if (_leftBtn==nil) {
        UIButton *leftBtn = [[UIButton alloc]init];
        _leftBtn=leftBtn;
        _leftBtn.tag = 100;
        _leftBtn.frame = CGRectMake(0, 0, self.frame.size.width*0.5, 32);
        _leftBtn.selected = YES;
    }
    return _leftBtn;
}
//懒加载顶部（小组）按钮
-(UIButton *)rightBtn{
    if (_rightBtn==nil) {
        UIButton *rightBtn = [[UIButton alloc]init];
        _rightBtn=rightBtn;
        _rightBtn.tag = 101;
        _rightBtn.frame = CGRectMake(self.frame.size.width*0.5, 0, self.frame.size.width*0.5, 32);
    }
    return _rightBtn;
}

-(UIImageView *)leftBottomImg{
    if (_leftBottomImg==nil) {
        UIImageView *leftBottomImg=[[UIImageView alloc]initWithFrame:CGRectMake(20, 32, self.frame.size.width*0.5-40, 2)];
        _leftBottomImg=leftBottomImg;
    }
    return  _leftBottomImg;
}
-(UIImageView *)rightBottomImg{
    if (_rightBottomImg==nil) {
        UIImageView *rightBottomImg=[[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width*0.5+20, 32, self.frame.size.width*0.5-40, 2)];
        _rightBottomImg=rightBottomImg;
    }
    return _rightBottomImg;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
          [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeBtnSelected:) name:@"changeBtnSelected" object:nil];
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    LVTool *toll=[LVTool sharedViewTool];
    [self setBtnTitleWithLeftBtnTitle:toll.leftBtnTitle andRightBtnTitle:toll.rightBtnTitle];
}

-(void)setBtnTitleWithLeftBtnTitle:(NSString *)leftBtnTitle andRightBtnTitle:(NSString *)rightBtnTitle{
    //添加中间按钮
    UIImageView *titleView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 34)];
//     [titleView setBackgroundColor:[UIColor redColor]];
    titleView.contentMode = UIViewContentModeScaleAspectFit;
    titleView.userInteractionEnabled = YES;
    //主题
    [self setButton:self.leftBtn WithTitle:leftBtnTitle];
    [self.leftBottomImg setImage:[UIImage imageNamed:@"bottomimage"]];
    [titleView addSubview:self.leftBtn];
    [titleView addSubview:self.leftBottomImg];
    //小组
    [self.rightBottomImg setImage:[UIImage imageNamed:@"bottomimage"]];
    [self setButton:self.rightBtn WithTitle:rightBtnTitle ];
    self.rightBottomImg.hidden=YES;
    [titleView addSubview:self.rightBtn];
    [titleView addSubview:self.rightBottomImg];
    
    [self addSubview:titleView];
}
//顶部按钮初始化公用方法(代码重构)
-(void)setButton:(UIButton *) btn WithTitle:(NSString *) title{
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btn setTitleColor:KCOLOR(1, 157, 216) forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(navigationBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)navigationBarButtonAction:(UIButton *)btn
{
    NSLog(@"%ld",(long)btn.tag);
    if (!btn.selected) {
        btn.selected=YES;
    }
    if (btn.tag==100) {
        
        self.rightBtn.selected=NO;
        self.leftBottomImg.hidden=NO;
        self.rightBottomImg.hidden=YES;
        
    }else{
        self.leftBtn.selected=NO;
        self.leftBottomImg.hidden=YES;
        self.rightBottomImg.hidden=NO;
    }
    // 切换控制器
    if ([_delegate respondsToSelector:@selector(didSelectedIndex:)]) {
        [_delegate didSelectedIndex:(NSInteger)btn.tag];
    }
}

-(void)changeBtnSelected:(NSNotification *)text{
    if ([text.userInfo[@"index"] intValue]==100) {
        self.rightBtn.selected=NO;
        self.leftBtn.selected=YES;
        self.leftBottomImg.hidden=NO;
        self.rightBottomImg.hidden=YES;
    }else{
        self.leftBtn.selected=NO;
        self.rightBtn.selected=YES;
        self.leftBottomImg.hidden=YES;
        self.rightBottomImg.hidden=NO;
    }
    
}

@end
