//
//  SecondController.m
//  KHTestScrowView
//
//  Created by 宇航 on 16/12/2.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "SecondController.h"
#import "LVTool.h"
#import "LVTopView.h"
#import "ContentBaseView.h"

@interface SecondController ()<ZQNBTopViewDelegate,UIScrollViewDelegate>
@property(nonatomic,weak) UIScrollView * scrollView;
@end

@implementation SecondController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI{
    
    self.view.backgroundColor = [UIColor whiteColor];
    LVTool * toll = [LVTool sharedViewTool];
    toll.leftBtnTitle = @"天下无双";
    toll.rightBtnTitle=@"倾国倾城";
    LVTopView * topView = [[LVTopView alloc]initWithFrame:CGRectMake(0, 64, KSWIDTH, 34)];
    topView.delegate = self;
    [self.view addSubview:topView];
    
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, topView.bottom, KSWIDTH, KSHEIGHT-64-34-49-4)];
    _scrollView = scrollView;
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = YES;
    scrollView.backgroundColor = [UIColor redColor];
    scrollView.contentSize = CGSizeMake(KSWIDTH*2, 0);
    [self.view addSubview:scrollView];
    
    UIView * firstView = [[UIView alloc]init];
    firstView.backgroundColor = [UIColor orangeColor];
    firstView.frame = CGRectMake(0, 0, scrollView.width, scrollView.height);
    [scrollView addSubview:firstView];
    
    UIView * secondView = [[UIView alloc]init];
    secondView.backgroundColor = [UIColor yellowColor];
    secondView.frame = CGRectMake(KSWIDTH, 0, scrollView.width, scrollView.height);
    [scrollView addSubview:secondView];
}
//实现代理方法
-(void)didSelectedIndex:(NSInteger)tag{
    if (tag==100) {
        _scrollView.contentOffset = CGPointMake(0, 0);
    }else{
        _scrollView.contentOffset = CGPointMake(KSWIDTH, 0);
    }
}

#pragma mark -UIScrollViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat newX = scrollView.contentOffset.x + KSWIDTH *0.5;
    NSInteger index ;
    if (newX < KSWIDTH) {
        index = 100;
    }else if (newX > KSWIDTH && newX < KSWIDTH *2){
        index = 101;
    }
    NSString * str=[NSString stringWithFormat: @"%ld", (long)index];
//    CGFloat subX = scrollView.contentOffset.x;
//    //    NSLog(@"subX is %.2f", subX);
//    NSInteger index = subX / KSWIDTH + 100;
//    NSString * str=[NSString stringWithFormat: @"%ld", (long)index];
    
    NSDictionary *dict =[[NSDictionary alloc]initWithObjectsAndKeys:str,@"index" ,nil];
    //创建通知
    NSNotification *notification =[NSNotification notificationWithName:@"changeBtnSelected" object:nil userInfo:dict];
    //通过通知中心发送通知
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

@end
