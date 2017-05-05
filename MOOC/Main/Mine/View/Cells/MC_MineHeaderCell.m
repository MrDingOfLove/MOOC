//
//  MC_MineHeaderCell.m
//  MOOC
//
//  Created by YunDongLi on 2017/5/4.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_MineHeaderCell.h"
#import "MC_MineHeaderCellView.h"
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
    __weak typeof(self) weakSelf = self;
    self.one.pushBlock = ^(){
        [weakSelf.pushDeleagte pushToViewController:v];
    };
    self.two.pushBlock = ^(){
        [weakSelf.pushDeleagte pushToViewController:v];
    };
    self.three.pushBlock = ^(){
        [weakSelf.pushDeleagte pushToViewController:v];
    };
    self.four.pushBlock = ^(){
        [weakSelf.pushDeleagte pushToViewController:v];
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
