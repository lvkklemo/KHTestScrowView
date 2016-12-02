//
//  LVTopView.h
//  KHTestScrowView
//
//  Created by 宇航 on 16/12/2.
//  Copyright © 2016年 KH. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZQNBTopViewDelegate <NSObject>
@optional
- (void) didSelectedIndex:(NSInteger)tag;
@end

@interface LVTopView : UIView
@property (nonatomic, weak) id<ZQNBTopViewDelegate> delegate;
@end
