//
//  MC_TeacherDetial.h
//  MOOC
//
//  Created by YunDongLi on 2017/5/3.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MC_TeacherDetial : UIView
-(instancetype)initWithFrame:(CGRect)frame data:(NSObject*)data;
-(void)setInformationwithHeaderImageName:(NSString*)imageName name:(NSString*)name position:(NSString*)position;
@end
