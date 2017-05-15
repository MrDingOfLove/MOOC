//
//  MC_HomePageViewController.m
//  MOOC
//
//  Created by YunDongLi on 2017/4/17.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_HomePageViewController.h"
#import "MC_ServiceForHeaderViewAndCell.h"
@interface MC_HomePageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * mainContent_TableView;
/**
 *  HeaderView
 */
@property (nonatomic,strong) MC_ServiceForHeaderViewAndCell * serviceForHeaderViewAndCell;
@end

@implementation MC_HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = NSLocalizedStringFromTable(@"HomePageTitle", @"internationalization", nil);
    [self initForTableView];
}
-(void)initForTableView{
    [self.view addSubview:self.mainContent_TableView];
}
#pragma mark UITableViewDataSource
//numberOfSections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;{
    return 8;
}
//numberOfRowsInSection
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.serviceForHeaderViewAndCell numberOfRowsInSection:section];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.serviceForHeaderViewAndCell cellForTableView:tableView sectionAtIndexPath:indexPath];
}
#pragma mark UITableViewDelegate

//heightForHeader
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return [self.serviceForHeaderViewAndCell heightOfSection:section];
}
//viewForHeader
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [self.serviceForHeaderViewAndCell viewOfSection:section];
}

////heightForFooter
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return RESIZE_UI(0.1);
}
//viewForFooter
/*
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_HEIGHT, RESIZE_UI(20))];
    footerView.backgroundColor = [UIColor redColor];
    return footerView;
}*/
//HeightForRowAtIndexPath
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)   indexPath{
    return [self.serviceForHeaderViewAndCell heightForRowAtIndexPath:indexPath];
}
#pragma mark setter&getter
-(UITableView *)mainContent_TableView{
    if (!_mainContent_TableView) {
        _mainContent_TableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _mainContent_TableView.backgroundColor = [UIColor whiteColor];
        _mainContent_TableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainContent_TableView.delegate = self;
        _mainContent_TableView.dataSource = self;
    }
    return _mainContent_TableView;
}
-(MC_ServiceForHeaderViewAndCell *)serviceForHeaderViewAndCell{
    if (!_serviceForHeaderViewAndCell){
        _serviceForHeaderViewAndCell = [[MC_ServiceForHeaderViewAndCell alloc]initWithData:nil];
        __weak typeof(self) weakSelf = self;
        _serviceForHeaderViewAndCell.pushBlock = ^(UIViewController * viewController){
            [weakSelf.navigationController pushViewController:viewController animated:YES];
        };
    }
    return _serviceForHeaderViewAndCell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
