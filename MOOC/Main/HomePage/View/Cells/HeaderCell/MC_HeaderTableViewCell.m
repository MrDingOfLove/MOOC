//
//  MC_HeaderTableViewCell.m
//  MOOC
//
//  Created by 志强 on 17/4/23.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_HeaderTableViewCell.h"

@implementation MC_HeaderTableViewCell
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
    [self.pushDeleagte pushToViewController:[[UIViewController alloc]init]];
    NSLog(@"training");
}
- (IBAction)path:(UIButton *)sender {
    NSLog(@"path");
}
- (IBAction)question:(UIButton *)sender {
    NSLog(@"question");
}
- (IBAction)note:(UIButton *)sender {
    NSLog(@"note");
}
- (IBAction)find:(UIButton *)sender {
    NSLog(@"find");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
