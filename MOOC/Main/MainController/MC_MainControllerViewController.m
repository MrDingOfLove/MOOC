//
//  MC_MainControllerViewController.m
//  MOOC
//
//  Created by YunDongLi on 2017/4/17.
//  Copyright © 2017年 DingYahao. All rights reserved.
//
#import "MC_MainControllerViewController.h"
#import "MC_HomePageViewController.h"
#import "MC_CourseViewController.h"
#import "MC_DownloadViewController.h"
#import "MC_MineViewController.h"

@interface MC_MainControllerViewController ()
@property (nonatomic,strong) NSMutableArray * childController;
@property (nonatomic,strong) UINavigationController * homePageViewController;
@property (nonatomic,strong) UINavigationController * courseViewController;
@property (nonatomic,strong) UINavigationController * downloadViewController;
@property (nonatomic,strong) UINavigationController * mineViewController;
@end

@implementation MC_MainControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createChildController];
    self.selectedIndex = 3;
}
/**
 *  创建四个子控制器
 */
-(void)createChildController{
    [self addSubItemWithVieeController:[[MC_HomePageViewController alloc]init] tabBarTitle:@"首页" imageName:@"homePage" selectedImageName:@"homePage_selected"];
    [self addSubItemWithVieeController:[[MC_CourseViewController alloc]init] tabBarTitle:@"课程" imageName:@"course" selectedImageName:@"course_selected"];
    [self addSubItemWithVieeController:[[MC_DownloadViewController alloc]init] tabBarTitle:@"下载" imageName:@"download" selectedImageName:@"download_selected"];
    [self addSubItemWithVieeController:[[MC_MineViewController alloc]init] tabBarTitle:@"我的" imageName:@"mine" selectedImageName:@"mine_selected"];
}
-(void)addSubItemWithVieeController:(UIViewController *)viewController tabBarTitle:(NSString *)tabBarTitle imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{
    UINavigationController * navigationController = [[UINavigationController alloc]initWithRootViewController:viewController];
    navigationController.tabBarItem.title = tabBarTitle;
    navigationController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navigationController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [navigationController.tabBarItem setTitleTextAttributes:[[NSDictionary alloc]initWithObjectsAndKeys:[UIColor colorWithHexString:@"#ee1548"],UITextAttributeTextColor, nil] forState:UIControlStateSelected];
    [self.childController addObject:navigationController];
    self.viewControllers = self.childController;
}
/**
 *  setter&getter
 */
-(NSMutableArray *)childController{
    if (!_childController) {
        _childController = [[NSMutableArray alloc]init];
    }
    return _childController;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
