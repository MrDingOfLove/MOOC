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
//Height
-(CGFloat)heightOfSection:(NSInteger)section;
//View
-(UIView *)viewOfSection:(NSInteger)section;
//Cell
-(UITableViewCell *)cellForTableView:(UITableView *)tableView sectionAtIndexPath:(NSIndexPath *)indexPath;
//HeightForrow
-(CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath;
//numberOfRowsInSection
-(NSInteger)numberOfRowsInSection:(NSInteger)section;
@end
