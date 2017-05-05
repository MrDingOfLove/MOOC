//
//  MC_MineViewController.m
//  MOOC
//
//  Created by YunDongLi on 2017/4/17.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_MineViewController.h"
#import "UIImage+UIColor.h"
#import "MC_MineHeaderCell.h"
#import "MC_MineCell.h"
#import "MC_PushToViewControllerProtocol.h"
@interface MC_MineViewController ()<UITableViewDelegate,UITableViewDataSource,MC_PushToViewControllerProtocol>
@property (nonatomic,strong) UITableView * tableView;
@end

@implementation MC_MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithAlpha:0] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage imageWithAlpha:0];
    [self initForTableView];
}
-(void)initForTableView{
    [self.view addSubview:self.tableView];
}
#pragma mark UITableViewDataSource
//numberOfSections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0){
        return 1;
    }else if (section == 1){
        return 5;
    }else{
        return 2;
    }
   
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:{
            MC_MineHeaderCell * cell = [[MC_MineHeaderCell alloc]initWithTableView:tableView];
            cell.pushDeleagte = self;
            return cell;
        }
            break;
        case 1:{
            MC_MineCell * cell = [[MC_MineCell alloc]initWithTableView:tableView];
            cell.pushDeleagte = self;
            return cell;
        }
            break;
        case 2:{
            MC_MineCell * cell = [[MC_MineCell alloc]initWithTableView:tableView];
            cell.pushDeleagte = self;
            return cell;
        }
            break;

            
        default:
            return [[UITableViewCell alloc]init];
            break;
    }
}
#pragma mark UITableViewDelegate

//heightForHeader
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return RESIZE_UI(150);
    }else{
        return RESIZE_UI(10);
    }
}
//viewForHeader
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return [[UIView alloc]init];
    }else{
        return [[UIView alloc]init];
    }
}
//heightForFooter
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return RESIZE_UI(0.1);
}
//HeightForRowAtIndexPath
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)   indexPath{
    if (indexPath.section == 0) {
        return RESIZE_UI(100);
    }
    return RESIZE_UI(50);
}
#pragma mark MC_PushToViewControllerProtocol
-(void)pushToViewController:(UIViewController *)viewController{
    [self.navigationController pushViewController:viewController animated:YES];
}
#pragma mark setter&getter
-(UITableView *)tableView{
    if (!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-RESIZE_UI(44)) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor  colorWithHexString:@"f0f2f5"];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
@end
