//
//  MC_HeaderTableViewCell.h
//  MOOC
//
//  Created by 志强 on 17/4/23.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MC_PushToViewControllerProtocol.h"
@interface MC_HeaderTableViewCell : UITableViewCell
@property (nonatomic,weak) id<MC_PushToViewControllerProtocol> pushDeleagte;
-(instancetype)initWithTableView:(UITableView*)tableView;
@end
