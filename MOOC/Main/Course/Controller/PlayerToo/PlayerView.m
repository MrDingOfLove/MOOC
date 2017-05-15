//
//  PlayerView.m
//  06-CustomVedioPlay
//
//  Created by Ding on 2017/4/17.
//  Copyright © 2017年 Dingyahao. All rights reserved.
//

#import "PlayerView.h"
@interface PlayerView ()


@property(nonatomic,strong)AVPlayerLayer * playerLayer;
@property(nonatomic,strong)NSTimer * timer;
/**
 * Xib连接
 */
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIView *controllView;

@property (weak, nonatomic) IBOutlet UIButton *play;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIView *timeView;
//timeLabel
@property (weak, nonatomic) IBOutlet UILabel *hour_01;
@property (weak, nonatomic) IBOutlet UILabel *hour_02;
@property (weak, nonatomic) IBOutlet UILabel *colon_01;
@property (weak, nonatomic) IBOutlet UILabel *minute_01;
@property (weak, nonatomic) IBOutlet UILabel *minute_02;
@property (weak, nonatomic) IBOutlet UILabel *colon_02;
@property (weak, nonatomic) IBOutlet UILabel *second_01;
@property (weak, nonatomic) IBOutlet UILabel *second_02;
//timeLabel




@property (weak, nonatomic) IBOutlet UIButton *fullScreen;
@end

@implementation PlayerView
+(instancetype)videoPlayerView{
    return [[[NSBundle mainBundle]loadNibNamed:@"PlayerView" owner:nil options:nil] lastObject];
}
#pragma mark
#pragma mark#--------------加载Nib文件
//加载nib文件时调用 调用一次
-(void)awakeFromNib{
    _player = [[AVPlayer alloc]init];
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
    //添加播放结束监听
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(itemDidPlayToEndTime:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    [self.imageView.layer addSublayer:self.playerLayer];
    
    self.controllView.alpha = 0.8;
    self.play.selected = YES;
    [self.slider setThumbImage:[UIImage imageNamed:@"thumbImage"] forState:UIControlStateNormal];
    
    [self.slider setMinimumTrackImage:[UIImage imageNamed:@"MinimumTrackImage"] forState:UIControlStateNormal];
    [self.slider setMaximumTrackImage:[UIImage imageNamed:@"MaximumTrackImage"] forState:UIControlStateNormal];
    
    self.imageView.userInteractionEnabled = YES;
    [self addGestureToImageView];
    self.slider.continuous = NO;
    [self.slider addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventValueChanged];
}
-(void)changeValue:(UISlider *)slider{
    float allTime = CMTimeGetSeconds(self.player.currentItem.duration);
//    CMTime cMtime = CMTimeMakeWithSeconds(slider.value * allTime,self.player.currentItem);
    CMTime cMtime = CMTimeMakeWithSeconds(slider.value * allTime, kCMTimeZero.timescale);
    [_player seekToTime:cMtime];
}
#pragma mark
#pragma mark#--------------播放结束监听事件
- (void)itemDidPlayToEndTime:(NSNotification *)not{
    NSLog(@"播放结束");
    [self.play setBackgroundImage:[UIImage imageNamed:@"refresh"] forState:UIControlStateNormal];
    self.play.selected = YES;
}
#pragma mark
#pragma mark#--------------layoutSubviews
-(void)layoutSubviews{
    [super layoutSubviews];
    //切记此处,让playerLayer撑起来,否则不显示此区域
    self.playerLayer.frame = self.bounds;
}
#pragma mark
#pragma mark#--------------playerItem set方法
-(void)setPlayerItem:(AVPlayerItem *)playerItem{
    if (nil == _playerItem) {
        _playerItem = playerItem;
        //添加播放源
        [self.player replaceCurrentItemWithPlayerItem:_playerItem];
    }
}
#pragma mark
#pragma mark#--------------添加手势
-(void)addGestureToImageView{
    //创建点击手势
    UITapGestureRecognizer * pan = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pan)];
    pan.numberOfTapsRequired = 1;
    //为视图添加手势
    [self.imageView addGestureRecognizer:pan];
}
-(void)pan{
    static BOOL flag = 1;
    if (flag) {
        [UIView animateWithDuration:0.5 animations:^{
            self.controllView.alpha = 0;
        }];
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            self.controllView.alpha = 0.8;
        }];
    }
    flag = !flag;
}
#pragma mark
#pragma mark#--------------按钮点击事件
//添加事件
- (IBAction)play:(UIButton *)sender {
    if (self.play.selected) {
        if (CMTimeGetSeconds(self.player.currentTime) == CMTimeGetSeconds(self.player.currentItem.duration)) {
            [_player seekToTime:kCMTimeZero];
        }
        [self.player play];
        [self addProgressTimer];
        [_timer setFireDate:[NSDate distantPast]];
        [self.play setBackgroundImage:[UIImage imageNamed:@"full_pause_btn_hl"] forState:UIControlStateNormal];
    }else{
        [self.player pause];
        [_timer setFireDate:[NSDate distantFuture]];
        [self.play setBackgroundImage:[UIImage imageNamed:@"full_play_btn_hl"] forState:UIControlStateNormal];
    }
    self.play.selected = !self.play.selected;
}
#pragma mark
#pragma mark#--------------定时器
-(void)addProgressTimer{
    if (nil == _timer) {
       _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateProgressValue) userInfo:nil repeats:YES];
    }
}
-(void)updateProgressValue{
    //当前播放的时间
    float currentTime = CMTimeGetSeconds(self.player.currentTime);
    [self showCurrentTime:currentTime];
    //总播放时间长
    float allTime = CMTimeGetSeconds(self.player.currentItem.duration);
//    NSLog(@"%f",allTime);
    self.slider.value = currentTime/allTime;
}
#pragma mark
#pragma mark#--------------显示当前时间
-(void)showCurrentTime:(float)curentTime{
    NSInteger count = curentTime;
    //秒
    NSInteger second = count%60;
    NSInteger second_01 = second%10;
    NSInteger second_02 = second/10;
    self.second_01.text = [NSString stringWithFormat:@"%ld",second_02];
    self.second_02.text = [NSString stringWithFormat:@"%ld",second_01];
    
    //分
    NSInteger minute = (count/60)%60;
    NSInteger minute_01 = (minute%60)%10;
    NSInteger minute_02 = (minute%60)/10;
    self.minute_01.text = [NSString stringWithFormat:@"%ld",minute_02];
    self.minute_02.text = [NSString stringWithFormat:@"%ld",minute_01];
    
    //时
    NSInteger hour = ((count/60)/60)%24;
    NSInteger hour_01 = hour%10;
    NSInteger hour_02 = hour/10;
    self.hour_01.text = [NSString stringWithFormat:@"%ld",hour_02];
    self.hour_01.text = [NSString stringWithFormat:@"%ld",hour_01];
}
@end
