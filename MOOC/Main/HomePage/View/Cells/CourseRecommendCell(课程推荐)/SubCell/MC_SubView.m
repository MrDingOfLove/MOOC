//
//  MC_SubView.m
//  MOOC
//
//  Created by YunDongLi on 2017/4/27.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_SubView.h"
@interface MC_SubView()
@property (strong, nonatomic) IBOutlet UIImageView *titleImage;
@property (strong, nonatomic) IBOutlet UILabel *categoryLabel;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (strong, nonatomic) IBOutlet UILabel *studyNumLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;

@end
@implementation MC_SubView
-(void)setInformationWithCategoryimageName:(NSString *)imageName category:(NSString*)category title:(NSString *)title synopsis:(NSString *)synopsis studyNum:(NSString *)studyNum price:(NSString *)price{
    self.titleImage.image = [UIImage imageNamed:imageName];
    self.categoryLabel.text = category;
    self.titleLabel.text = title;
    self.synopsisLabel.text = synopsis;
    self.studyNumLabel.text = studyNum;
    self.priceLabel.text = price;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    MC_SubView *subView = [[[NSBundle mainBundle] loadNibNamed:@"MC_SubView" owner:self options:nil] lastObject];
    subView.frame = self.bounds;
    [self addSubview:subView];
}
- (IBAction)seeDetial:(UIButton *)sender {
    self.pushBlock();
    NSLog(@"seeDetial");
}
@end
