//
//  MC_BaseCell.h
//  MOOC
//
//  Created by YunDongLi on 2017/4/30.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MC_PushToViewControllerProtocol.h"
#import "MC_MineViewController.h"

@interface MC_BaseCell : UITableViewCell
@property (nonatomic,strong) NSObject * model;
@property (nonatomic,weak) id<MC_PushToViewControllerProtocol,MC_LoginDelegate> pushDeleagte;
-(instancetype)initWithTableView:(UITableView*)tableView;
@end
