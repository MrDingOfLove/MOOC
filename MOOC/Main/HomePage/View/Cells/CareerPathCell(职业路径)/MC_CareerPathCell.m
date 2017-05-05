//
//  MC_CareerPathCell.m
//  MOOC
//
//  Created by YunDongLi on 2017/4/28.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_CareerPathCell.h"
@interface MC_CareerPathCell()
@property (nonatomic,strong) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *synopsis;
@property (strong, nonatomic) IBOutlet UILabel *curseNumlabel;
@property (strong, nonatomic) IBOutlet UILabel *learnNumlabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;

@end
@implementation MC_CareerPathCell
- (instancetype)initWithTableView:(UITableView *)tableView
{
    self = [super init];
    if (self) {
        NSString * identifier = NSStringFromClass([self class]);
        self = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(!self){
            self = [[[NSBundle mainBundle] loadNibNamed:identifier owner:nil options:nil] lastObject];
            [self setForinformation];
        }
    }
    return self;
}
-(void)setForinformation{
    [self setInformationWithImageName:@"careerPath.jpg" title:@"iOS界面优化与数据存储" synopsis:@"iOS视图控制器、屏幕适配、数据存储、加团购实战、更有Swift核心编程，助你成长" curseNum:@"20门课/" learnNum:@"1024人学习" price:@"¥ 328.00"];
}
-(void)setInformationWithImageName:(NSString *)imageName title:(NSString*)title synopsis:(NSString*)synopsis curseNum:(NSString*)curseNum learnNum:(NSString*)learnNum price:(NSString*)price{
    self.image.image = [UIImage imageNamed:imageName];
    self.titleLabel.text = title;
    self.synopsis.text = synopsis;
    self.curseNumlabel.text = curseNum;
    self.learnNumlabel.text = learnNum;
    self.priceLabel.text = price;
}
- (IBAction)selected:(UIButton *)sender{
    UIViewController * viewController = [[UIViewController alloc]init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    if ([self.pushDeleagte respondsToSelector:@selector(pushToViewController:)]) {
        [self.pushDeleagte pushToViewController:viewController];
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
}
@end
