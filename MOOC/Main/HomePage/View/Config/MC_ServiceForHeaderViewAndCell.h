//
//  MC_ServiceForHeaderView.h
//  MOOC
//
//  Created by YunDongLi on 2017/4/22.
//  Copyright © 2017年 DingYahao. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface MC_ServiceForHeaderViewAndCell : NSObject
-(instancetype)initWithData:(NSObject *)data;
@property (nonatomic,strong) void (^pushBlock) (UIViewController * ViewController);

//为每个标题设置高度
-(CGFloat)heightOfSection:(NSInteger)section;
//为每个标题返回相对应的标题视图
-(UIView *)viewOfSection:(NSInteger)section;
//为每个展示模块返回不同风格的Cell
-(UITableViewCell *)cellForTableView:(UITableView *)tableView sectionAtIndexPath:(NSIndexPath *)indexPath;
//每个模块展示区域的高度
-(CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath;
//每个模块的Cell个数
-(NSInteger)numberOfRowsInSection:(NSInteger)section;

@end
