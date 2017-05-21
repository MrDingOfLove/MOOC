//
//  MC_TeacherRecommendedCell.m
//  MOOC
//
//  Created by YunDongLi on 2017/5/3.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_TeacherRecommendedCell.h"
#import "MC_TeacherDetial.h"

@interface MC_TeacherRecommendedCell()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end
@implementation MC_TeacherRecommendedCell
- (instancetype)initWithTableView:(UITableView *)tableView
{
    self = [super init];
    if (self) {
        NSString * identifier = NSStringFromClass([self class]);
        self = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(!self){
            self = [[[NSBundle mainBundle] loadNibNamed:identifier owner:nil options:nil] lastObject];
            self.backgroundColor = [UIColor colorWithHexString:@"f0f2f5"];
//            [self setInformation];
//            [self initForPushBlock];
        }
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initForScrollView];
}
-(void)initForScrollView{
    self.scrollView.contentSize = CGSizeMake((RESIZE_UI(110)*5+10), RESIZE_UI(100));
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self initForContent];
}
-(void)initForContent{
    for (int i = 0; i < 5; i++) {
        MC_TeacherDetial * teacherDetial =[[MC_TeacherDetial alloc]initWithFrame:CGRectMake(RESIZE_UI(10) + RESIZE_UI(110)*i, 0, RESIZE_UI(100), RESIZE_UI(100)) data:[[NSObject alloc]init]];
        [teacherDetial setInformationwithHeaderImageName:@"header.jpg" name:@"王福明" position:@"web前段工程师"];
        [self.scrollView addSubview:teacherDetial];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
