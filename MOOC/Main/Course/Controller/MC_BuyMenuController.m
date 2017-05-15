//
//  MC_BuyMenuController.m
//  MOOC
//
//  Created by YunDongLi on 2017/5/8.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_BuyMenuController.h"
#import "MC_VideoplayController.h"
@interface MC_BuyMenuController ()
@property (nonatomic,strong) NSObject * data;
// 标题数组
@property (nonatomic,strong) NSArray<NSString *> * titleArray;
//控制器数组
@property (nonatomic,strong) NSArray<UIViewController *> * viewControllerArray;
@end

@implementation MC_BuyMenuController
- (instancetype)initWithData:(NSObject *)data
{
    self = [super init];
    if (self) {
        self.data = data;
        self.pageAnimatable = YES;
        //设置WMPageController每个标题的宽度
        self.menuItemWidth = SCREEN_WIDTH/self.titleArray.count;
        //设置WMPageController标题栏的高度
        self.menuHeight = RESIZE_UI(40);
        //设置WMPageController选中的标题的颜色
        self.titleColorSelected = [UIColor whiteColor];
        self.menuBGColor = [UIColor colorWithHexString:@"ffa9b9"];
        [self addView];
    }
    return self;
}
-(void)addView{
    UIView * buyView = [[UIView alloc]initWithFrame:CGRectMake(0,SCREEN_HEIGHT-RESIZE_UI(49) , SCREEN_WIDTH, RESIZE_UI(49))];
    buyView.backgroundColor = [UIColor whiteColor];
    UILabel * priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, buyView.width*2/3, buyView.height)];
    priceLabel.textColor =[UIColor redColor];
    priceLabel.font = [UIFont systemFontOfSize:RESIZE_UI(18)];
    priceLabel.text = @"¥88.00";
    priceLabel.textAlignment = NSTextAlignmentCenter;
    UIButton * buyBtn = [[UIButton alloc]initWithFrame:CGRectMake(buyView.width*2/3, 0, buyView.width/3, buyView.height)];
    buyBtn.backgroundColor = [UIColor redColor];
    [buyBtn setTitle:@"立即购买" forState:UIControlStateNormal];
    [buyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    buyBtn.titleLabel.font = [UIFont systemFontOfSize:RESIZE_UI(18)];
    [buyBtn addTarget:self action:@selector(goDetialStudy:) forControlEvents:UIControlEventTouchUpInside];
    [buyView addSubview:priceLabel];
    [buyView addSubview:buyBtn];
    
    UIButton *study = [[UIButton alloc]initWithFrame:CGRectMake(0,SCREEN_HEIGHT-RESIZE_UI(49) , SCREEN_WIDTH, RESIZE_UI(49))];
    study.backgroundColor = [UIColor redColor];
    [study setTitle:@"开始学习" forState:UIWindowLevelNormal];
    [study addTarget:self action:@selector(goDetialStudy:) forControlEvents:UIControlEventTouchUpInside];
    study.titleLabel.font = [UIFont systemFontOfSize:RESIZE_UI(18)];
    if (arc4random()%2) {
       [self.view addSubview:buyView];
    }else{
       [self.view addSubview:study];
    }
    
}
-(void)goDetialStudy:(UIButton*)btn{
    MC_VideoplayController * videoplayController = [[MC_VideoplayController alloc]init];
    [self.navigationController pushViewController:videoplayController animated:YES];
}
#pragma mark ------- DataSource & delegate

#pragma mark 返回子页的个数
-(NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.titleArray.count;
}
#pragma mark 返回某个index对应的页面
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    return [[UIViewController alloc]init];
}
#pragma mark 返回index对应的标题
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    
    return self.titleArray[index];
}
#pragma mark getter
-(NSArray<NSString *> *)titleArray{
    if (!_titleArray) {
        _titleArray = [[NSArray alloc]initWithObjects:@"介绍",@"章节",@"评价",@"咨询",nil];
    }
    return _titleArray;
}
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
     self.tabBarController.tabBar.hidden = NO;
}
@end
