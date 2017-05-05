//
//  MC_CapacityView.m
//  MOOC
//
//  Created by YunDongLi on 2017/5/4.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_CapacityView.h"
@interface MC_CapacityView()
@property (nonatomic,strong) UILabel * capacityLabel;
@property (nonatomic,strong) UIProgressView * progressView;
@end

@implementation MC_CapacityView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initForView];
    }
    return self;
}
-(void)initForView{
    [self addSubview:self.capacityLabel];
    [self addSubview:self.progressView];
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask , YES)objectAtIndex:0];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDictionary *fileSysAttributes = [fileManager attributesOfFileSystemForPath:path error:nil];
    NSNumber *freeSpace = [fileSysAttributes objectForKey:NSFileSystemFreeSize];
    NSNumber *totalSpace = [fileSysAttributes objectForKey:NSFileSystemSize];
    double free = ([freeSpace doubleValue])/1024.0/1024.0/1024.0;
    double total = ([totalSpace doubleValue])/1024.0/1024.0/1024.0;
    self.progressView.progress = 1 - free/total;
    self.capacityLabel.text = [NSString stringWithFormat:@"剩余%0.1lfG",free];
}
-(UILabel *)capacityLabel{
    if (!_capacityLabel){
        _capacityLabel = [[UILabel alloc]initWithFrame:CGRectMake(RESIZE_UI(20), RESIZE_UI(5), RESIZE_UI(100), RESIZE_UI(20))];
        _capacityLabel.font = [UIFont systemFontOfSize:RESIZE_UI(12)];
        _capacityLabel.textColor = [UIColor lightGrayColor];
    }
    return _capacityLabel;
}
-(UIProgressView *)progressView{
    if (!_progressView){
        _progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(RESIZE_UI(20), CGRectGetMaxY(self.capacityLabel.frame), SCREEN_WIDTH - 40, RESIZE_UI(20))];
        _progressView.backgroundColor = [UIColor lightGrayColor];
        _progressView.progressViewStyle = UIProgressViewStyleBar;
        _progressView.tintColor = [UIColor colorWithHexString:@"1f98cf"];
    }
    return _progressView;
}
@end
