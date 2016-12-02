//
//  ContentBaseView.h
//  KHTestScrowView
//
//  Created by 宇航 on 16/12/2.
//  Copyright © 2016年 KH. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "UIViewExt.h"
#define KSWIDTH ([UIScreen mainScreen].bounds.size.width)
#define KSHEIGHT ([UIScreen mainScreen].bounds.size.height)
#define KCOLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]

@interface ContentBaseView : UIView

@property(nonatomic,weak) UIButton * medicine_btn;
@property(nonatomic,weak) UIButton * health_btn;
@property(nonatomic,weak) UIButton * pre_btn;
@property(nonatomic,weak) UIButton * longTerm_btn;
@property(nonatomic,weak) UIButton * doctotTeam_btn;
@property(nonatomic,weak) UIScrollView * baseScrollView;

//@property(nonatomic,weak) UITableView * medicine_tab;
//@property(nonatomic,weak) UITableView * health_tab;

@property(nonatomic,weak) UIView * viewOne;
@property(nonatomic,weak) UIView * viewTwo;
@property(nonatomic,weak) UIView * viewThree;
@property(nonatomic,weak) UIView * viewFour;
@property(nonatomic,weak) UIView * viewFive;

@property (nonatomic ,weak) UIView *lineView;

@end
