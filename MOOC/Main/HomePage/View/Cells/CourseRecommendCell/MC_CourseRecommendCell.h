//
//  MC_CourseRecommendCell.h
//  MOOC
//
//  Created by YunDongLi on 2017/4/26.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MC_PushToViewControllerProtocol.h"

@interface MC_CourseRecommendCell : UITableViewCell
@property (nonatomic,weak) id<MC_PushToViewControllerProtocol> pushDeleagte;
-(instancetype)initWithTableView:(UITableView*)tableView;
@end