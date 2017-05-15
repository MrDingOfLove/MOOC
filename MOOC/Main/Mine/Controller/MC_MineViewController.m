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
#import "StartUp.h"


@interface MC_MineViewController ()<UITableViewDelegate,UITableViewDataSource,MC_PushToViewControllerProtocol,MC_LoginDelegate>
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) UIImageView * header;
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
            if (indexPath.row == 0){
                cell.title.text = @"历史记录";
            }else if (indexPath.row == 1){
                cell.title.text = @"我的路径";
            }else if (indexPath.row == 2){
                cell.title.text = @"我的课表";
            }else if (indexPath.row == 3){
                cell.title.text = @"我的订单";
            }else if (indexPath.row == 4){
                cell.title.text = @"优惠券";
            }
            cell.pushDeleagte = self;
            return cell;
        }
            break;
        case 2:{
            MC_MineCell * cell = [[MC_MineCell alloc]initWithTableView:tableView];
            cell.pushDeleagte = self;
            if (indexPath.row == 0){
                cell.title.text = @"设置";
            }else if (indexPath.row == 1){
                cell.title.text = @"退出登录";
            }
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
        [self header];
        self.header.image = [UIImage imageNamed:@"login_out.jpg"];
        return self.header;
    }else{
        return [[UIView alloc]init];
    }
}
-(void)login:(UIButton *)btn{
    StartUp * loginView = [[StartUp alloc]init];
    loginView.delegate = self;
    [self presentViewController:loginView animated:YES completion:nil];
}
-(void)changeHeader{
    self.header.image =[UIImage imageNamed:@"mine_header.jpg"];
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
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2 && indexPath.row == 1) {
        self.header.image = [UIImage imageNamed:@"login_out.jpg"];
    }else{
        [self createAlert:@"暂未完善！" message:nil];
    }
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
-(UIImageView *)header{
    if (!_header){
        _header = [[UIImageView alloc]init];
        _header.userInteractionEnabled = YES;
        UIButton * login = [[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-RESIZE_UI(80))/2, RESIZE_UI(25), RESIZE_UI(80), RESIZE_UI(100))];
        [login addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
        [_header addSubview:login];
    }
    return _header;
}
-(void)createAlert:(NSString *)string message:(NSString *)message{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:string message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
