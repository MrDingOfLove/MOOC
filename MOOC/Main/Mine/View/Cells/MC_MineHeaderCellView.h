//
//  MC_MineHeaderCellView.h
//  MOOC
//
//  Created by YunDongLi on 2017/5/4.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MC_MineHeaderCellView : UIView
@property (nonatomic,strong) void (^pushBlock) ();
-(void)setInformationWithImageName:(NSString *)imageName title:(NSString *)title;
@end
