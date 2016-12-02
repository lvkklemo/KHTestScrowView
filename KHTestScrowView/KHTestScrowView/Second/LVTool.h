//
//  LVTool.h
//  KHTestScrowView
//
//  Created by 宇航 on 16/12/2.
//  Copyright © 2016年 KH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LVTool : NSObject

@property(strong,nonatomic)NSString *leftBtnTitle;
@property(strong,nonatomic)NSString *rightBtnTitle;
@property(assign,nonatomic)int flag;
@property(copy,nonatomic)NSArray *roles;
@property(nonatomic,strong)NSMutableArray *quintitleArray;
@property(nonatomic,strong)NSMutableArray *subjectArray;
@property(nonatomic,strong)NSMutableArray *gradeArray;
+(instancetype)sharedViewTool;
@end
