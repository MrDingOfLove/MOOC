//
//  MC_GuessYouLikeCell.m
//  MOOC
//
//  Created by YunDongLi on 2017/5/4.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_GuessYouLikeCell.h"
#import "MC_SubView.h"

@interface MC_GuessYouLikeCell()
@property (strong, nonatomic) IBOutlet MC_SubView *one;
@property (strong, nonatomic) IBOutlet MC_SubView *two;

@end
@implementation MC_GuessYouLikeCell
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
            [self initForPushBlock];
        }
    }
    return self;
}
-(void)setInformation{
    [self.one setInformationWithCategoryimageName:@"" category:@"HTML/CSS JavaScript" title:@"DatePicker组件开发" synopsis:@"使用原生态JS开发datepicker组件" studyNum:@"1639人学习" price:nil];
    [self.two setInformationWithCategoryimageName:@"" category:@"HTML/CSS JavaScript" title:@"Web安全-XSS" synopsis:@"从Web安全XSS的定义开始讲起，从原理到实战全面讲解...." studyNum:@"4548人学习" price:nil];
}
-(void)initForPushBlock{
    UIViewController * v =[[UIViewController alloc]init];
    v.view.backgroundColor = [UIColor whiteColor];
    __weak typeof(self) weakSelf = self;
    self.one.pushBlock = ^(){
        [weakSelf.pushDeleagte pushToViewController:v];
    };
    self.two.pushBlock = ^(){
        [weakSelf.pushDeleagte pushToViewController:v];
    };
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
