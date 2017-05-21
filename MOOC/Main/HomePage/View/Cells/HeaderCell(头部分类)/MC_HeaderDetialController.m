//
//  MC_HeaderDetialController.m
//  MOOC
//
//  Created by YunDongLi on 2017/5/8.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_HeaderDetialController.h"
#import "MC_CourseDetialCell.h"
#import "MC_BuyMenuController.h"

@interface MC_HeaderDetialController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) UIButton * currentBtn;
@property (nonatomic,strong) UIView * headerView;
@end

@implementation MC_HeaderDetialController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}
#pragma mark UITableViewDataSource
//numberOfSections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;{
    return 1;
}
//numberOfRowsInSection
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [[MC_CourseDetialCell alloc]initWithTableView:tableView];
}
#pragma mark UITableViewDelegate

//heightForHeader
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return RESIZE_UI(80);
}
//viewForHeader
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.headerView;
}

-(void)change:(UIButton*)btn{
    //修改上一个点击按钮的属性
    [self.currentBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.currentBtn.backgroundColor = [UIColor clearColor];
    //更改为当前点击的按钮
    self.currentBtn = btn;
    //修改当前点击的按钮的属性
    [self.currentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.currentBtn.backgroundColor = [UIColor redColor];
    //刷新tableView的数据源
    [self.tableView reloadData];
}

////heightForFooter
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return RESIZE_UI(0.1);
}
//HeightForRowAtIndexPath
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)   indexPath{
    return RESIZE_UI(100);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MC_BuyMenuController * buyMenuController = [[MC_BuyMenuController alloc]initWithData:nil];
    [self.navigationController pushViewController:buyMenuController animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
-(UIView *)headerView{
    if (!_headerView){
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, RESIZE_UI(80))];
        _headerView.backgroundColor = [UIColor whiteColor];
        NSArray * title = @[@"全部",@"前端开发",@"后端开发",@"移动开发",@"数据库",@"运维&测试"];
        for (int i = 0; i < 6; i++) {
            UIView * btnView = [[UIView alloc]initWithFrame:CGRectMake((i%3)*SCREEN_WIDTH/3, i/3*RESIZE_UI(40), SCREEN_WIDTH/3, RESIZE_UI(40))];
            UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(5,10, btnView.width - 10, btnView.height - 15)];
            if (i == 0) {
                self.currentBtn = btn;
                [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                btn.backgroundColor =[UIColor redColor];
            }else{
                [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            }
            btn.titleLabel.font = [UIFont systemFontOfSize:RESIZE_UI(15)];
            [btn setTitle:title[i] forState:UIControlStateNormal];
            btn.layer.borderWidth = RESIZE_UI(1);
            btn.layer.borderColor = [[UIColor lightGrayColor] CGColor];
            btn.layer.cornerRadius = RESIZE_UI(12.5);
            [btnView addSubview:btn];
            [btn addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
            [_headerView addSubview:btnView];
        }
    }
    return _headerView;
}
@end
