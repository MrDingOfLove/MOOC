//
//  MC_HeaderTableViewCell.m
//  MOOC
//
//  Created by YunDongLi on 17/4/23.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_HeaderCell.h"

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
    UIViewController * viewController = [[UIViewController alloc]init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    if ([self.pushDeleagte respondsToSelector:@selector(pushToViewController:)]) {
        [self.pushDeleagte pushToViewController:viewController];
    }
    NSLog(@"training");
}
- (IBAction)path:(UIButton *)sender {
    UIViewController * viewController = [[UIViewController alloc]init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    if ([self.pushDeleagte respondsToSelector:@selector(pushToViewController:)]) {
        [self.pushDeleagte pushToViewController:viewController];
    }
    NSLog(@"path");
}
- (IBAction)question:(UIButton *)sender {
    UIViewController * viewController = [[UIViewController alloc]init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    if ([self.pushDeleagte respondsToSelector:@selector(pushToViewController:)]) {
        [self.pushDeleagte pushToViewController:viewController];
    }
    NSLog(@"question");
}
- (IBAction)note:(UIButton *)sender {
    UIViewController * viewController = [[UIViewController alloc]init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    if ([self.pushDeleagte respondsToSelector:@selector(pushToViewController:)]) {
        [self.pushDeleagte pushToViewController:viewController];
    }
    NSLog(@"note");
}
- (IBAction)find:(UIButton *)sender {
    UIViewController * viewController = [[UIViewController alloc]init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    if ([self.pushDeleagte respondsToSelector:@selector(pushToViewController:)]) {
        [self.pushDeleagte pushToViewController:viewController];
    }
    NSLog(@"find");
}

@end
