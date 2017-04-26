//
//  MC_ServiceForHeaderView.m
//  MOOC
//
//  Created by YunDongLi on 2017/4/22.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_ServiceForHeaderViewAndCell.h"
#import "MC_Header_Header.h"
#import "MC_HeaderTableViewCell.h"
#import "MC_PushToViewControllerProtocol.h"
@interface MC_ServiceForHeaderViewAndCell()<MC_PushToViewControllerProtocol>
//填充的数据
@property (nonatomic,strong) NSObject * data;
//Header
@property (nonatomic,assign) CGFloat headerView_height;
@property (nonatomic,strong) MC_Header_Header * header_HeaderView;
@property (nonatomic,strong) MC_HeaderTableViewCell * headerTableViewCell;

@property (nonatomic,strong) UITableView * tableView;
@end
@implementation MC_ServiceForHeaderViewAndCell
- (instancetype)initWithData:(NSObject *)data
{
    self = [super init];
    if (self) {
        self.data = data;
    }
    return self;
}
/**
 *  HeightForHeaderView
 */
-(CGFloat)heightOfSection:(NSInteger)section{
    switch (section) {
        case 0:
            self.headerView_height = RESIZE_UI(160);
            break;
            
        default:
            return self.headerView_height = 0;
            break;
    }
    return self.headerView_height;
}
/**
 *  ViewForHeader
 */
-(UIView *)viewOfSection:(NSInteger)section{
    switch (section) {
        case 0:
            return self.header_HeaderView;
            break;
            
        default:
            return nil;
            break;
    }
}
/**
 *  numberOfRowsForSection
 */
-(NSInteger)numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 2;
            break;
        default:
            return 0;
            break;
    }
}
/**
 *  ForCell
 */
-(UITableViewCell *)cellForTableView:(UITableView *)tableView sectionAtIndexPath:(NSIndexPath *)indexPath{
    self.tableView = tableView;
    switch (indexPath.section) {
        case 0:
            return self.headerTableViewCell;
            break;
        case 1:
            return [[UITableViewCell alloc]init];
            break;
            
        default:
            return [[UITableViewCell alloc]init];
            break;
    }
}
/**
 *  ForCellHeight
 */
-(CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return RESIZE_UI(93);
            break;
            
        default:
            return RESIZE_UI(50);
            break;
    }
}
#pragma mark MC_PushToViewControllerProtocol
-(void)pushToViewController:(UIViewController *)viewController{
    self.pushBlock(viewController);
}
#pragma mark getter
-(MC_Header_Header *)header_HeaderView{
    if (!_header_HeaderView){
        _header_HeaderView = [[MC_Header_Header alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.headerView_height) data:self.data];
    }
    return _header_HeaderView;
}
-(MC_HeaderTableViewCell *)headerTableViewCell{
    _headerTableViewCell = [[MC_HeaderTableViewCell alloc]initWithTableView:self.tableView];
    _headerTableViewCell.pushDeleagte = self;
    return _headerTableViewCell;
}
@end
