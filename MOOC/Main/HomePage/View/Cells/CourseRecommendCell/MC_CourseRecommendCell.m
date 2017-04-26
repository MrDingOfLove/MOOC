//
//  MC_CourseRecommendCell.m
//  MOOC
//
//  Created by YunDongLi on 2017/4/26.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_CourseRecommendCell.h"

@implementation MC_CourseRecommendCell
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
- (IBAction)go:(UIButton *)sender {
    UIViewController * viewController = [[UIViewController alloc]init];
    viewController.view.backgroundColor = [UIColor greenColor];
    if ([self.pushDeleagte respondsToSelector:@selector(pushToViewController:)]) {
        [self.pushDeleagte pushToViewController:viewController];
    }

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
