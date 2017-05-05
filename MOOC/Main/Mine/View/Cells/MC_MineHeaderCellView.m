//
//  MC_MineHeaderCellView.m
//  MOOC
//
//  Created by YunDongLi on 2017/5/4.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_MineHeaderCellView.h"

@interface MC_MineHeaderCellView ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@end
@implementation MC_MineHeaderCellView
-(void)setInformationWithImageName:(NSString *)imageName title:(NSString *)title{
    self.imageView.image = [UIImage imageNamed:imageName];
    self.titleLabel.text = title;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    MC_MineHeaderCellView *subView = [[[NSBundle mainBundle] loadNibNamed:@"MC_MineHeaderCellView" owner:self options:nil] lastObject];
    subView.frame = self.bounds;
    [self addSubview:subView];
}
- (IBAction)seeDetial:(UIButton *)sender {
    self.pushBlock();
    NSLog(@"seeDetial");
}
@end
