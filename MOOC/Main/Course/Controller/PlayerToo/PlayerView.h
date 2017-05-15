//
//  PlayerView.h
//  06-CustomVedioPlay
//
//  Created by Ding on 2017/4/17.
//  Copyright © 2011年 Dingyahao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface PlayerView : UIView

@property(nonatomic,strong)AVPlayerItem * playerItem;
@property(nonatomic,strong)AVPlayer * player;
+(instancetype)videoPlayerView;

@end
