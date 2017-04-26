//
//  UIView+MC_UIViewSize.m
//  MOOC
//
//  Created by YunDongLi on 2017/4/22.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)
-(void)setWidth:(CGFloat)width{
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}
-(CGFloat)width{
    return self.frame.size.width;
}
-(void)setHeight:(CGFloat)height{
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}
-(CGFloat)height{
    return self.frame.size.height;
}
-(void)setX:(CGFloat)x{
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}
-(CGFloat)x{
    return self.frame.origin.x;
}
-(void)setY:(CGFloat)y{
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}
-(CGFloat)y{
    return self.frame.origin.y;
}

@end
