//
//  CKCylinderReversibleFooter.h
//  BatourTool
//
//  Created by mac on 17/3/17.
//  Copyright © 2017年 GRSource. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJRefresh/MJRefresh.h>

static NSString * FooterThemeChangedNotification = @"BackgroundColorUpdateNotification";

@interface CKCylinderReversibleFooter : MJRefreshAutoStateFooter

+ (instancetype)footerWithPad:(CGFloat) pad RefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock;

@property(nonatomic, strong) UIColor * cylinderColor;

-(void) startAnimation;

-(void)stopAnimation;

@end
