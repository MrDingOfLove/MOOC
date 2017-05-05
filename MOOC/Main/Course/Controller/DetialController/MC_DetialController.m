//
//  MC_DetialController.m
//  MOOC
//
//  Created by YunDongLi on 2017/5/4.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_DetialController.h"
#import "MC_CourseDetialCell.h"

@interface MC_DetialController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSObject * data;
@property (nonatomic,strong) UITableView * tableView;
@end

@implementation MC_DetialController
- (instancetype)initWithData:(NSObject *)data
{
    self = [super init];
    if (self) {
        self.data = data;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initForTableView];
}
-(void)initForTableView{
    [self.view addSubview:self.tableView];
}
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MC_CourseDetialCell * cell = [[MC_CourseDetialCell alloc]initWithTableView:tableView];
    return cell;
}
#pragma mark UITableViewDelegate

//heightForHeader
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
////heightForFooter
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return RESIZE_UI(0.1);
}
//HeightForRowAtIndexPath
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)   indexPath{
    return RESIZE_UI(100);
}

#pragma mark getter&setter
-(UITableView *)tableView{
    if (!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-RESIZE_UI(40)-RESIZE_UI(44)-RESIZE_UI(64)) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor  whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
@end
