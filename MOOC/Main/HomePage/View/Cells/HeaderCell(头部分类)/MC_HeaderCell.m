//
//  MC_HeaderTableViewCell.m
//  MOOC
//
//  Created by YunDongLi on 17/4/23.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_HeaderCell.h"
#import "MC_HeaderDetialController.h"

@implementation MC_HeaderCell
- (instancetype)initWithTableView:(UITableView *)tableView
{
    self = [super init];
    if (self) {
        NSString * identifier = NSStringFromClass([self class]);
        self = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(!self){
            self = [[[NSBundle mainBundle] loadNibNamed:identifier owner:nil options:nil] lastObject];
        }
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)training:(UIButton *)sender {
    MC_HeaderDetialController * viewController = [[MC_HeaderDetialController alloc]init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.navigationItem.title = @"实战";
    if ([self.pushDeleagte respondsToSelector:@selector(pushToViewController:)]) {
        [self.pushDeleagte pushToViewController:viewController];
    }
    NSLog(@"training");
}
- (IBAction)path:(UIButton *)sender {
    MC_HeaderDetialController * viewController = [[MC_HeaderDetialController alloc]init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.navigationItem.title = @"路径";
    if ([self.pushDeleagte respondsToSelector:@selector(pushToViewController:)]) {
        [self.pushDeleagte pushToViewController:viewController];
    }
    NSLog(@"path");
}
- (IBAction)question:(UIButton *)sender {
    MC_HeaderDetialController * viewController = [[MC_HeaderDetialController alloc]init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.navigationItem.title = @"猿问";
    if ([self.pushDeleagte respondsToSelector:@selector(pushToViewController:)]) {
        [self.pushDeleagte pushToViewController:viewController];
    }
    NSLog(@"question");
}
- (IBAction)note:(UIButton *)sender {
    MC_HeaderDetialController * viewController = [[MC_HeaderDetialController alloc]init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.navigationItem.title = @"手记";
    if ([self.pushDeleagte respondsToSelector:@selector(pushToViewController:)]) {
        [self.pushDeleagte pushToViewController:viewController];
    }
    NSLog(@"note");
}
- (IBAction)find:(UIButton *)sender {
    MC_HeaderDetialController * viewController = [[MC_HeaderDetialController alloc]init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.navigationItem.title = @"发现";
    if ([self.pushDeleagte respondsToSelector:@selector(pushToViewController:)]) {
        [self.pushDeleagte pushToViewController:viewController];
    }
    NSLog(@"find");
}

@end
