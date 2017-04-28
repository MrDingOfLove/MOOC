//
//  MC_AdvertisingCell.m
//  MOOC
//
//  Created by YunDongLi on 2017/4/28.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_AdvertisingCell.h"
@interface MC_AdvertisingCell ()
@property (strong, nonatomic) IBOutlet UIImageView *advertisingImage;

@end
@implementation MC_AdvertisingCell
- (instancetype)initWithTableView:(UITableView *)tableView
{
    self = [super init];
    if (self) {
        NSString * identifier = NSStringFromClass([self class]);
        self = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(!self){
            self = [[[NSBundle mainBundle] loadNibNamed:identifier owner:nil options:nil] lastObject];
            self.backgroundColor = [UIColor colorWithHexString:@"f0f2f5"];
            [self setInformation];
        }
    }
    return self;
}
-(void)setInformation{
    self.advertisingImage.image = [UIImage imageNamed:@"advertising.jpg"];
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
