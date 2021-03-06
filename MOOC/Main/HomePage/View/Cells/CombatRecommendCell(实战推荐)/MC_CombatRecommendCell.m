//
//  MC_CombatRecommendCell.m
//  MOOC
//
//  Created by YunDongLi on 2017/4/30.
//  Copyright © 2017年 DingYahao. All rights reserved.
//
#import "MC_SubView.h"
#import "MC_CombatRecommendCell.h"
#import "MC_BuyMenuController.h"
@interface MC_CombatRecommendCell()
@property (strong, nonatomic) IBOutlet MC_SubView *one;
@property (strong, nonatomic) IBOutlet MC_SubView *two;
@property (strong, nonatomic) IBOutlet MC_SubView *three;
@property (strong, nonatomic) IBOutlet MC_SubView *four;
@property (strong, nonatomic) IBOutlet MC_SubView *five;
@property (strong, nonatomic) IBOutlet MC_SubView *six;

@end
@implementation MC_CombatRecommendCell
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
    [self.one setInformationWithCategoryimageName:@"" category:@"HTML/CSS JavaScript" title:@"DatePicker组件开发" synopsis:@"使用原生态JS开发datepicker组件" studyNum:@"1639人学习" price:@"¥199.00"];
    [self.two setInformationWithCategoryimageName:@"" category:@"HTML/CSS JavaScript" title:@"Web安全-XSS" synopsis:@"从Web安全XSS的定义开始讲起，从原理到实战全面讲解...." studyNum:@"4548人学习" price:@"¥199.00"];
    [self.three setInformationWithCategoryimageName:@"" category:@"Vue.js JavaScript" title:@"使用vue2.0实现购物车和地址选配功能" synopsis:@"本视频教程结合案例完整贯穿各个知识点，轻松掌握全部技能...." studyNum:@"13357人学习" price:@"¥199.00"];
    [self.four setInformationWithCategoryimageName:@"" category:@"大数据 JavaScript" title:@"Echars3.0入门基础与实战" synopsis:@"Echars3.0入门视频教程带你领略高逼格数据可..." studyNum:@"8742人学习" price:@"¥199.00"];
    [self.five setInformationWithCategoryimageName:@"" category:@"大数据 JavaScript" title:@"Echars3.0入门基础与实战" synopsis:@"Echars3.0入门视频教程带你领略高逼格数据可..." studyNum:@"8742人学习" price:@"¥199.00"];
    [self.six setInformationWithCategoryimageName:@"" category:@"大数据 JavaScript" title:@"Echars3.0入门基础与实战" synopsis:@"Echars3.0入门视频教程带你领略高逼格数据可..." studyNum:@"8742人学习" price:@"¥199.00"];
}
-(MC_BuyMenuController *)creat{
    MC_BuyMenuController * v =[[MC_BuyMenuController alloc]initWithData:nil];
    v.view.backgroundColor = [UIColor whiteColor];
    return v;
}
-(void)initForPushBlock{
    __weak typeof(self) weakSelf = self;
    self.one.pushBlock = ^(){
        [weakSelf.pushDeleagte pushToViewController:[weakSelf creat]];
    };
    self.two.pushBlock = ^(){
        [weakSelf.pushDeleagte pushToViewController:[weakSelf creat]];
    };
    self.three.pushBlock = ^(){
        [weakSelf.pushDeleagte pushToViewController:[weakSelf creat]];
    };
    self.four.pushBlock = ^(){
        [weakSelf.pushDeleagte pushToViewController:[weakSelf creat]];
    };
    self.five.pushBlock = ^(){
        [weakSelf.pushDeleagte pushToViewController:[weakSelf creat]];
    };
    self.six.pushBlock = ^(){
        [weakSelf.pushDeleagte pushToViewController:[weakSelf creat]];
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
