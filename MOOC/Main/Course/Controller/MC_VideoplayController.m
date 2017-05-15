//
//  MC_VideoplayController.m
//  MOOC
//
//  Created by YunDongLi on 2017/5/8.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_VideoplayController.h"
#import "PlayerView.h"

@interface MC_VideoplayController ()
@property (nonatomic,strong) UILabel * label;
@property (nonatomic,strong) UIButton * currentBtn;
@property (nonatomic,strong) PlayerView * playerView;
@end

@implementation MC_VideoplayController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.playerView = [PlayerView videoPlayerView];
    [self.view addSubview:self.playerView];
    self.playerView.frame = CGRectMake(0, RESIZE_UI(64), CGRectGetWidth(self.view.frame), CGRectGetWidth(self.view.frame)*9.0/16.0);
    NSURL * url = [NSURL URLWithString:@"http://v1.mukewang.com/a45016f4-08d6-4277-abe6-bcfd5244c201/L.mp4"];
    AVPlayerItem * playerItem = [[AVPlayerItem alloc]initWithURL:url];
    self.playerView.playerItem = playerItem;
    
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.playerView.frame), SCREEN_WIDTH, RESIZE_UI(50))];
    v.backgroundColor = [UIColor whiteColor];
    self.label.frame = CGRectMake(SCREEN_WIDTH/16, RESIZE_UI(48), SCREEN_WIDTH/8, RESIZE_UI(2));
    [v addSubview:self.label];
    NSArray * title = @[@"章节",@"详情",@"评论",@"问答"];
    for (int i = 0; i < 4; i++) {
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(i*SCREEN_WIDTH/4.0, 0, SCREEN_WIDTH/4, RESIZE_UI(49))];
        if (i == 0) {
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            self.currentBtn = btn;
        }else{
            [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        }
        [btn setTitle:title[i] forState:UIControlStateNormal];
                [btn addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
        [v addSubview:btn];
    }
    [self.view addSubview:v];
}
-(void)go:(UIButton*)btn{
    [UIView animateWithDuration:0.3 animations:^{
        [self.currentBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        self.currentBtn = btn;
        [self.currentBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];        
        self.label.x = btn.x+btn.width/4;
    }];
}
-(UILabel *)label{
    if (!_label){
        _label = [[UILabel alloc]init];
        _label.backgroundColor = [UIColor redColor];
    }
    return _label;
}
//控制器将要消失的时候调用
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //视频播放暂停
    [self.playerView.player pause];
    //视频播放对象清空
    self.playerView = nil;
}
@end
