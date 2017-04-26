//
//  MC_CourseRecommendHeader.m
//  MOOC
//
//  Created by YunDongLi on 2017/4/26.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_CourseRecommendHeader.h"
@interface MC_CourseRecommendHeader()
@property (nonatomic,strong) NSObject * data;
@property (nonatomic,strong) UIImageView * imageView;
@property (nonatomic,strong) UILabel * titleLabel;
@property (nonatomic,strong) UIButton * changeBtn;
@end

@implementation MC_CourseRecommendHeader
- (instancetype)initWithFrame:(CGRect)frame data:(NSObject *)data
{
    self = [super initWithFrame:frame];
    if (self) {
        self.data = data;
        [self initForview];
    }
    return self;
}
-(void)initForview{
    [self addSubview:self.titleLabel];
    [self.titleLabel addSubview:self.imageView];
    [self addSubview:self.changeBtn];
}
-(UIImageView *)imageView{
    if (!_imageView){
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,(self.height-RESIZE_UI(18))/2.0, RESIZE_UI(18), RESIZE_UI(18))];
        _imageView.image = [UIImage imageNamed:@"recommend"];
        _imageView.backgroundColor = [UIColor whiteColor];
    }
    return _imageView;
}
-(UILabel *)titleLabel{
    if (!_titleLabel){
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.width/3.0, 0, self.width/3.0, self.height)];
        _titleLabel.text = NSLocalizedStringFromTable(@"CourseRecommendedTitle", @"internationalization", nil);
        _titleLabel.textColor = [UIColor colorWithHexString:@"#31373d"];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
-(UIButton *)changeBtn{
    if (!_changeBtn){
        _changeBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.width - RESIZE_UI(80), 0,RESIZE_UI(80), self.height)];
        [_changeBtn setTitle:NSLocalizedStringFromTable(@"ChangeCourseRecommendedTitle", @"internationalization", nil) forState:UIControlStateNormal];
        [_changeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _changeBtn.titleLabel.font = [UIFont systemFontOfSize:RESIZE_UI(14)];
        [_changeBtn addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _changeBtn;
}
-(void)change:(UIButton *)btn{
    NSLog(@"change");
}
@end
