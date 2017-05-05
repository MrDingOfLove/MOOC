//
//  MC_MineViewController.m
//  MOOC
//
//  Created by YunDongLi on 2017/4/17.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (UIColor)

/**
 根据传进来的颜色(默认白色)和透明度，生成一个颜色图片
 */
+ (UIImage *)imageWithAlpha: (CGFloat)alpha;
// 根据传进来的颜色和透明度，生成一个颜色图片
+ (UIImage *)imageWithColor: (UIColor *)aimColor WithAlpha: (CGFloat)alpha;
@end
