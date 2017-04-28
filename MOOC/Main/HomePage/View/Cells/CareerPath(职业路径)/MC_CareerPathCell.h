//
//  MC_CareerPathCell.h
//  MOOC
//
//  Created by YunDongLi on 2017/4/28.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MC_PushToViewControllerProtocol.h"

@interface MC_CareerPathCell : UITableViewCell
@property (nonatomic,strong) NSObject * model;
@property (nonatomic,weak) id<MC_PushToViewControllerProtocol> pushDeleagte;
-(instancetype)initWithTableView:(UITableView*)tableView;
@end
