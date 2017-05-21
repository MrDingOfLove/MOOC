//
//  MC_CourseRecommendHeader.h
//  MOOC
//
//  Created by YunDongLi on 2017/4/26.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MC_SectionHeader : UIView
-(instancetype)initWithFrame:(CGRect)frame data:(NSObject*)data;
-(void)configWithBackgroundColor:(UIColor *)backgroundColor imageName:(NSString *)imageName title:(NSString*)title changeTitle:(NSString*)changeTitle;
@end
