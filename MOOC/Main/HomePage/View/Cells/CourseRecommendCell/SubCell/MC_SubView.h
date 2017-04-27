//
//  MC_SubView.h
//  MOOC
//
//  Created by YunDongLi on 2017/4/27.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MC_SubView : UIView
@property (nonatomic,strong) NSString * name;
@property (nonatomic,strong) void (^pushBlock) ();
-(void)setInformationWithCategoryimageName:(NSString *)imageName category:(NSString*)category title:(NSString *)title synopsis:(NSString *)synopsis studyNum:(NSString *)studyNum;
@end
