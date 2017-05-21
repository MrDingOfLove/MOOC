//
//  MC_MineHeaderCell.m
//  MOOC
//
//  Created by YunDongLi on 2017/5/4.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_MineHeaderCell.h"
#import "MC_MineHeaderCellView.h"
#import "MC_LoginStatusControl.h"
#import "StartUp.h"
@interface MC_MineHeaderCell()
@property (strong, nonatomic) IBOutlet MC_MineHeaderCellView *one;
@property (strong, nonatomic) IBOutlet MC_MineHeaderCellView *two;
@property (strong, nonatomic) IBOutlet MC_MineHeaderCellView *three;
@property (strong, nonatomic) IBOutlet MC_MineHeaderCellView *four;
@end
@implementation MC_MineHeaderCell
- (instancetype)initWithTableView:(UITableView *)tableView
{
    self = [super init];
    if (self) {
        NSString * identifier = NSStringFromClass([self class]);
        self = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(!self){
            self = [[[NSBundle mainBundle] loadNibNamed:identifier owner:nil options:nil] lastObject];
            [self initForInformation];
            [self initForPushBlock];
        }
    }
    return self;
}
-(void)initForInformation{
    [self.one setInformationWithImageName:@"recommend" title:@"我的课程"];
    [self.two setInformationWithImageName:@"recommend" title:@"我的实战"];
    [self.three setInformationWithImageName:@"recommend" title:@"我的猿问"];
    [self.four setInformationWithImageName:@"recommend" title:@"我的手记"];
}
-(void)initForPushBlock{
    UIViewController * v =[[UIViewController alloc]init];
    v.view.backgroundColor = [UIColor whiteColor];
    MC_LoginStatusControl * loginStatus = [MC_LoginStatusControl shareInstance];
    StartUp *startUp = [[StartUp alloc]init];
    startUp.delegate = self.pushDeleagte;
    __weak typeof(self) weakSelf = self;
    self.one.pushBlock = ^(){
        if (loginStatus.isLogin == YES) {
            [weakSelf.pushDeleagte pushToViewController:v];
        }else{
            [weakSelf.pushDeleagte presentToViewController:startUp];
        }
    };
    self.two.pushBlock = ^(){
        if (loginStatus.isLogin == YES) {
            [weakSelf.pushDeleagte pushToViewController:v];
        }else{
            [weakSelf.pushDeleagte presentToViewController:startUp];
        }
    };
    self.three.pushBlock = ^(){
        if (loginStatus.isLogin == YES) {
            [weakSelf.pushDeleagte pushToViewController:v];
        }else{
            [weakSelf.pushDeleagte presentToViewController:startUp];
        }
    };
    self.four.pushBlock = ^(){
        if (loginStatus.isLogin == YES) {
            [weakSelf.pushDeleagte pushToViewController:v];
        }else{
            [weakSelf.pushDeleagte presentToViewController:startUp];
        }
    };
}

- (void)awakeFromNib {
    [super awakeFromNib];
//    self.one.backgroundColor = [UIColor redColor];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
