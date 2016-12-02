//
//  ContentBaseView.m
//  KHTestScrowView
//
//  Created by 宇航 on 16/12/2.
//  Copyright © 2016年 KH. All rights reserved.
//

float const navBarHight =  64.0 ;
float const btnHight    =  46.0 ;
float const labHight    =  35.0 ;
float const tableViewW  =  10;
float const totalHight  =  navBarHight + btnHight + labHight;
float const scrollHight =  btnHight + navBarHight;

#import "ContentBaseView.h"


@interface ContentBaseView ()

@end
@implementation ContentBaseView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    UIView * btnView = [[UIView alloc]initWithFrame:CGRectMake(0, navBarHight, KSWIDTH, btnHight)];
    btnView.backgroundColor = [UIColor whiteColor];
    [self addSubview:btnView];
    
    UIView * line00 = [[UIView alloc]initWithFrame:CGRectMake(0,btnView.height-1, KSWIDTH-1, 1)];
    line00.backgroundColor =[UIColor colorWithWhite:0.92 alpha:1];
    [btnView addSubview:line00];
    
    UIView *line01 = [[UIView alloc]initWithFrame:CGRectMake(KSWIDTH*0.2, 0, 1, CGRectGetHeight(btnView.frame))];
    line01.backgroundColor = [UIColor colorWithWhite:0.92 alpha:1];
    [btnView addSubview:line01];
    UIView *line02 = [[UIView alloc]initWithFrame:CGRectMake(KSWIDTH*0.4, 0, 1, CGRectGetHeight(btnView.frame))];
    line02.backgroundColor = [UIColor colorWithWhite:0.92 alpha:1];
    [btnView addSubview:line02];
    UIView *line03 = [[UIView alloc]initWithFrame:CGRectMake(KSWIDTH*0.6, 0, 1, CGRectGetHeight(btnView.frame))];
    line03.backgroundColor = [UIColor colorWithWhite:0.92 alpha:1];
    [btnView addSubview:line03];
    UIView *line04 = [[UIView alloc]initWithFrame:CGRectMake(KSWIDTH*0.8, 0, 1, CGRectGetHeight(btnView.frame))];
    line04.backgroundColor = [UIColor colorWithWhite:0.92 alpha:1];
    [btnView addSubview:line04];
    
    UIView *tempLineView = [[UIView alloc]initWithFrame:CGRectMake(0, btnView.height - 1.5, KSWIDTH *0.2, 1.5)];
    tempLineView.backgroundColor = KCOLOR(79, 210, 194);
    [btnView addSubview:tempLineView];
    _lineView = tempLineView;
    
    UIButton *medicialBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, KSWIDTH/5, btnHight)];
    medicialBtn.tag = 1001;
    medicialBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    medicialBtn.backgroundColor = [UIColor clearColor];
    [medicialBtn setTitle:@"医疗记录" forState:UIControlStateNormal];
    [medicialBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [medicialBtn setTitleColor:KCOLOR(79, 210, 194) forState:UIControlStateSelected];
    medicialBtn.selected = YES;
    [btnView addSubview:medicialBtn];
    _medicine_btn = medicialBtn;
    
    UIButton *healthbtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(medicialBtn.frame), 0, KSWIDTH/5, btnHight)];
    healthbtn.tag = 1002;
    healthbtn.titleLabel.font = [UIFont systemFontOfSize:13];
    healthbtn.backgroundColor = [UIColor clearColor];
    [healthbtn setTitle:@"健康记录" forState:UIControlStateNormal];
    [healthbtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [healthbtn setTitleColor:KCOLOR(79, 210, 194) forState:UIControlStateSelected];
    [btnView addSubview:healthbtn];
    _health_btn = healthbtn;
    
    UIButton *preBtn = [[UIButton alloc]initWithFrame:CGRectMake(healthbtn.right, 0, KSWIDTH/5, btnHight)];
    preBtn.tag = 1003;
    preBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    preBtn.backgroundColor = [UIColor clearColor];
    [preBtn setTitle:@"处方" forState:UIControlStateNormal];
    [preBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [preBtn setTitleColor:KCOLOR(79, 210, 194) forState:UIControlStateSelected];
    _pre_btn = preBtn;
    [btnView addSubview:preBtn];
    
    UIButton *longtermBtn = [[UIButton alloc]initWithFrame:CGRectMake(preBtn.right, 0, KSWIDTH/5, btnHight)];
    longtermBtn.tag=1004;
    longtermBtn.titleLabel.font = [UIFont systemFontOfSize:11];
    longtermBtn.backgroundColor = [UIColor clearColor];
    [longtermBtn setTitle:@"长期监测指标" forState:UIControlStateNormal];
    [longtermBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [longtermBtn setTitleColor:KCOLOR(79, 210, 194) forState:UIControlStateSelected];
    [btnView addSubview:longtermBtn];
    _longTerm_btn = longtermBtn;
    
    UIButton *doctorTeamBtn = [[UIButton alloc]initWithFrame:CGRectMake(longtermBtn.right, 0, KSWIDTH/5, btnHight)];
    doctorTeamBtn.tag = 1005;
    doctorTeamBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    doctorTeamBtn.backgroundColor = [UIColor clearColor];
    [doctorTeamBtn setTitle:@"医生团队" forState:UIControlStateNormal];
    [doctorTeamBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [doctorTeamBtn setTitleColor:KCOLOR(79, 210, 194) forState:UIControlStateSelected];
    [btnView addSubview:doctorTeamBtn];
    _doctotTeam_btn = doctorTeamBtn;

    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, btnView.bottom+2, KSWIDTH, KSHEIGHT - navBarHight - btnView.height-4)];
    scrollView.contentSize = CGSizeMake(KSWIDTH*5, scrollView.height);
    scrollView.bounces = YES;
    scrollView.pagingEnabled = YES;
    [self addSubview:scrollView];
    scrollView.backgroundColor = [UIColor lightGrayColor];
    _baseScrollView =scrollView;
    
    UIView* viewone = [[UIView alloc]initWithFrame:CGRectMake(0, 0, scrollView.width, scrollView.height)];
    viewone.backgroundColor = [UIColor purpleColor];
    [scrollView addSubview:viewone];
    _viewOne = viewone;
    
    UIView* viewtwo = [[UIView alloc]initWithFrame:CGRectMake(viewone.right,0, scrollView.width, scrollView.height)];
    viewtwo.backgroundColor = [UIColor lightGrayColor];
    [scrollView addSubview:viewtwo];
    _viewTwo = viewtwo;
    UIView* viewthree = [[UIView alloc]initWithFrame:CGRectMake(viewtwo.right,0,scrollView.width, scrollView.height)];
    viewthree.backgroundColor = [UIColor redColor];
    [scrollView addSubview:viewthree];
    _viewThree = viewthree;
    UIView* viewFour = [[UIView alloc]initWithFrame:CGRectMake(viewthree.right,0, scrollView.width, scrollView.height)];
    viewFour.backgroundColor = [UIColor purpleColor];
    [scrollView addSubview:viewFour];
    _viewFour = viewFour;
    UIView* viewfive = [[UIView alloc]initWithFrame:CGRectMake(viewFour.right,0, scrollView.width, scrollView.height)];
    viewfive.backgroundColor = [UIColor orangeColor];
    [scrollView addSubview:viewfive];
    _viewFive = viewfive;
    
    
}

@end
