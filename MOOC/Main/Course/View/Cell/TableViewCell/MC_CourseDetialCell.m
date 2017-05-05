//
//  MC_CourseDetialCell.m
//  MOOC
//
//  Created by YunDongLi on 2017/5/4.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_CourseDetialCell.h"

@interface MC_CourseDetialCell ()
@property (strong, nonatomic) IBOutlet UIImageView *courseImage;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (strong, nonatomic) IBOutlet UILabel *levelLabel;
@property (strong, nonatomic) IBOutlet UILabel *studyNumLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@end
@implementation MC_CourseDetialCell
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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
