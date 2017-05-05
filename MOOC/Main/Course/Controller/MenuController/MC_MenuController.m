//
//  MC_DetialController.m
//  MOOC
//
//  Created by YunDongLi on 2017/5/4.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_MenuController.h"
#import "MC_DetialController.h"
@interface MC_MenuController ()
@property (nonatomic,strong) NSObject * data;
// 标题数组
@property (nonatomic,strong) NSArray<NSString *> * titleArray;
//控制器数组
@property (nonatomic,strong) NSArray<UIViewController *> * viewControllerArray;
@end

@implementation MC_MenuController
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
    }
    return self;
}
#pragma mark ------- DataSource & delegate

#pragma mark 返回子页的个数
-(NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.titleArray.count;
}
#pragma mark 返回某个index对应的页面
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    switch (index) {
        case 0:
        case 1:
        case 2:
            return [self creatControllerWithData:self.data];
            break;
        default:{
            UIViewController *vcClass = [UIViewController new];
            return vcClass;
        }
            break;
    }
}
-(MC_DetialController *)creatControllerWithData:(NSObject *)data{
    MC_DetialController * detialController = [[MC_DetialController alloc]initWithData:data];
    return detialController;
}
#pragma mark 返回index对应的标题
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    
    return self.titleArray[index];
}
#pragma mark getter
-(NSArray<NSString *> *)titleArray{
    if (!_titleArray) {
        _titleArray = [[NSArray alloc]initWithObjects:@"全部",@"基础",@"案例",nil];
    }
    return _titleArray;
}

@end
