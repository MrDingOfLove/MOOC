//
//  MC_CollectionViewCell.m
//  MOOC
//
//  Created by YunDongLi on 2017/5/4.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_CollectionViewCell.h"
@interface MC_CollectionViewCell()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation MC_CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imageView.layer.cornerRadius = self.imageView.width/2.0;
    self.imageView.clipsToBounds = YES;
    self.imageView.image = [UIImage imageNamed:@"courseheader"];
}

@end
