//
//  MC_DownloadViewController.m
//  MOOC
//
//  Created by YunDongLi on 2017/4/17.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_DownloadViewController.h"
#import "MC_CapacityView.h"

@interface MC_DownloadViewController ()
@property (nonatomic,strong) MC_CapacityView * capacityView;
@property (nonatomic,strong) UIImageView * imageView;
@property (nonatomic,strong) UILabel * noContent;
@end

@implementation MC_DownloadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"f0f2f5"];
    self.navigationItem.title = NSLocalizedStringFromTable(@"DownLoad", @"internationalization", nil);
    [self initForView];
}
-(void)initForView{
    [self.view addSubview:self.capacityView];
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.noContent];
}
#pragma mark getter&setter
-(MC_CapacityView *)capacityView{
    if (!_capacityView){
        _capacityView = [[MC_CapacityView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_HEIGHT, RESIZE_UI(40))];
    }
    return _capacityView;
}
-(UIImageView *)imageView{
    if (!_imageView){
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/4.0, CGRectGetMaxY(self.capacityView.frame)+SCREEN_WIDTH/4.0, SCREEN_WIDTH/2.0, SCREEN_WIDTH/2.0)];
        _imageView.image = [UIImage imageNamed:@"nocache"];
    }
    return _imageView;
}
-(UILabel *)noContent{
    if (!_noContent){
        _noContent = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/4.0, CGRectGetMaxY(self.imageView.frame)+RESIZE_UI(20), SCREEN_WIDTH/2.0, RESIZE_UI(20))];
        _noContent.textAlignment = NSTextAlignmentCenter;
        _noContent.textColor = [UIColor lightGrayColor];
        _noContent.font = [UIFont systemFontOfSize:RESIZE_UI(12)];
        _noContent.text = @"暂无下载内容";
    }
    return _noContent;
}
@end
