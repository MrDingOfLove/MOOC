//
//  MC_TeacherDetial.m
//  MOOC
//
//  Created by YunDongLi on 2017/5/3.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_TeacherDetial.h"
@interface MC_TeacherDetial()
@property (nonatomic,strong) UIImageView * headImageView;
@property (nonatomic,strong) UILabel * nameLabel;
@property (nonatomic,strong) UILabel * positionLabel;
@end
@implementation MC_TeacherDetial
- (instancetype)initWithFrame:(CGRect)frame data:(NSObject *)data
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius= RESIZE_UI(5);
        self.backgroundColor = [UIColor whiteColor];
        [self initForView];
    }
    return self;
}
-(void)initForView{
    [self addSubview:self.headImageView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.positionLabel];
}
-(void)setInformationwithHeaderImageName:(NSString *)imageName name:(NSString *)name position:(NSString *)position{
    self.headImageView.image = [UIImage imageNamed:imageName];
    self.nameLabel.text = name;
    self.positionLabel.text = position;
}
-(UIImageView *)headImageView{
    if (!_headImageView){
        _headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.width/4.0, RESIZE_UI(10), self.width/2.0, self.width/2.0)];
        _headImageView.layer.cornerRadius = _headImageView.width/2.0;
        _headImageView.clipsToBounds = YES;
        _headImageView.backgroundColor = [UIColor redColor];
    }
    return _headImageView;
}
-(UILabel *)nameLabel{
    if (!_nameLabel){
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headImageView.frame)+ RESIZE_UI(5), self.width, RESIZE_UI(15))];
        _nameLabel.font = [UIFont systemFontOfSize:RESIZE_UI(12)];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLabel;
}
-(UILabel *)positionLabel{
    if (!_positionLabel){
        _positionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.nameLabel.frame), self.width, RESIZE_UI(15))];
        _positionLabel.font = [UIFont systemFontOfSize:RESIZE_UI(10)];
        _positionLabel.textAlignment = NSTextAlignmentCenter;
        _positionLabel.textColor = [UIColor grayColor];
    }
    return _positionLabel;
}
@end
