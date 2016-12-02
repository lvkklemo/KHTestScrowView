//
//  ViewController.m
//  KHTestScrowView
//
//  Created by 宇航 on 16/11/25.
//  Copyright © 2016年 KH. All rights reserved.
//


#import "ViewController.h"
#import "ContentBaseView.h"
#import "UIViewExt.h"

@interface ViewController ()<UIScrollViewDelegate>
@property(nonatomic,weak)ContentBaseView * baseView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    ContentBaseView * baseView = [[ContentBaseView alloc]initWithFrame:self.view.frame];
    baseView.baseScrollView.delegate = self;
    baseView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:baseView];
    _baseView = baseView;
    
    [baseView.medicine_btn addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [baseView.health_btn addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [baseView.pre_btn addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [baseView.longTerm_btn addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [baseView.doctotTeam_btn addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonDidClick:(UIButton*)button{
    NSLog(@"%s",__func__);
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
    float btnHeight = 46;
    switch (button.tag) {
        case 1001:
            _baseView.lineView.frame = CGRectMake(0, btnHeight-1, KSWIDTH*0.2, 1.5);
            _baseView.baseScrollView.contentOffset = CGPointMake(0, 0);
            _baseView.medicine_btn.selected = YES;
            _baseView.health_btn.selected = NO;
            _baseView.pre_btn.selected = NO;
            _baseView.longTerm_btn.selected = NO;
            _baseView.doctotTeam_btn.selected = NO;
            break;
        case 1002:
            _baseView.lineView.frame = CGRectMake(KSWIDTH*0.2, btnHeight-1, KSWIDTH*0.2, 1.5);
            _baseView.baseScrollView.contentOffset = CGPointMake(KSWIDTH, 0);
            _baseView.medicine_btn.selected = NO;
            _baseView.health_btn.selected = YES;
            _baseView.pre_btn.selected = NO;
            _baseView.longTerm_btn.selected = NO;
            _baseView.doctotTeam_btn.selected = NO;
            break;
        case 1003:
            _baseView.lineView.frame = CGRectMake(KSWIDTH*0.4, btnHeight-1, KSWIDTH*0.2, 1.5);
            _baseView.baseScrollView.contentOffset = CGPointMake(2*KSWIDTH, 0);
            _baseView.medicine_btn.selected = NO;
            _baseView.health_btn.selected = NO;
            _baseView.pre_btn.selected = YES;
            _baseView.longTerm_btn.selected = NO;
            _baseView.doctotTeam_btn.selected = NO;
            break;
        case 1004:
            _baseView.lineView.frame = CGRectMake(KSWIDTH*0.6, btnHeight-1, KSWIDTH*0.2, 1.5);
            _baseView.baseScrollView.contentOffset = CGPointMake(3*KSWIDTH, 0);
            _baseView.medicine_btn.selected = NO;
            _baseView.health_btn.selected = NO;
            _baseView.pre_btn.selected = NO;
            _baseView.longTerm_btn.selected = YES;
            _baseView.doctotTeam_btn.selected = NO;
            break;
        case 1005:
            _baseView.lineView.frame = CGRectMake(KSWIDTH*0.8, btnHeight-1, KSWIDTH*0.2, 1.5);
            _baseView.baseScrollView.contentOffset = CGPointMake(4*KSWIDTH, 0);
            _baseView.medicine_btn.selected = NO;
            _baseView.health_btn.selected = NO;
            _baseView.pre_btn.selected = NO;
            _baseView.longTerm_btn.selected = NO;
            _baseView.doctotTeam_btn.selected = YES;
            break;
        default:
            break;
    }
    
    [UIView commitAnimations];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%f",scrollView.contentOffset.x*0.2);
    if (scrollView == _baseView.baseScrollView) {
        float btnHeight = 46;
        _baseView.lineView.frame = CGRectMake(scrollView.contentOffset.x*0.2, btnHeight-1.5, KSWIDTH*0.2, 1.5);
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    CGFloat newX = _baseView.baseScrollView.contentOffset.x + KSWIDTH *0.5;
    if (newX < KSWIDTH) {
        _baseView.medicine_btn.selected = YES;
        _baseView.health_btn.selected = NO;
        _baseView.pre_btn.selected = NO;
        _baseView.longTerm_btn.selected=NO;
        _baseView.doctotTeam_btn.selected=NO;
    }else if (newX > KSWIDTH && newX < KSWIDTH *2){
        _baseView.medicine_btn.selected = NO;
        _baseView.health_btn.selected = YES;
        _baseView.pre_btn.selected = NO;
        _baseView.longTerm_btn.selected=NO;
        _baseView.doctotTeam_btn.selected=NO;
    }else if (newX > 2*KSWIDTH && newX < KSWIDTH *3){
        _baseView.medicine_btn.selected = NO;
        _baseView.health_btn.selected = NO;
        _baseView.pre_btn.selected = YES;
        _baseView.longTerm_btn.selected=NO;
        _baseView.doctotTeam_btn.selected=NO;
    }else if (newX > 3*KSWIDTH && newX < KSWIDTH *4){
        _baseView.medicine_btn.selected = NO;
        _baseView.health_btn.selected = NO;
        _baseView.pre_btn.selected = NO;
        _baseView.longTerm_btn.selected=YES;
        _baseView.doctotTeam_btn.selected=NO;
    }else if (newX > 4*KSWIDTH && newX < KSWIDTH *5){
        _baseView.medicine_btn.selected = NO;
        _baseView.health_btn.selected = NO;
        _baseView.pre_btn.selected = NO;
        _baseView.longTerm_btn.selected=NO;
        _baseView.doctotTeam_btn.selected=YES;
    }
}


@end
