//
//  HVideoPlayer.m
//  FilterDemo
//
//  Created by 朴子hp on 2018/11/30.
//  Copyright © 2018年 朴子hp. All rights reserved.
//

#import "HVideoPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface HVideoPlayer ()

//视频预览层
@property (strong, nonatomic) AVPlayerLayer *playerLayer;
//媒体资源管理
@property (strong, nonatomic) AVPlayerItem  *playerItem;
//播放器
@property (strong, nonatomic) AVPlayer *avPlayer;

@end

@implementation HVideoPlayer

- (instancetype )initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
       
    }
    return self;
}

//播放相关内容
- (void)setUpContentView{

    //添加监听
    [self.playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    [self.playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    
    self.playerItem = [AVPlayerItem playerItemWithURL:self.fileUrl];
    self.avPlayer = [AVPlayer playerWithPlayerItem:self.playerItem];
    
    //设置模式
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.avPlayer];
    self.playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    self.playerLayer.contentsScale = [UIScreen mainScreen].scale;
    self.playerLayer.frame = self.bounds;
    [self.layer addSublayer:self.playerLayer];
    
    // 播放完成通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayDidEnd)
                                                 name:AVPlayerItemDidPlayToEndTimeNotification
                                               object:nil];
    
}

- (void)setFileUrl:(NSURL *)fileUrl{
    _fileUrl = fileUrl;
    self.playerItem = [AVPlayerItem playerItemWithURL:fileUrl];
    [self setUpContentView];
    [self.avPlayer play];
}
//监听回调
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    AVPlayerItem *playerItem = (AVPlayerItem *)object;
    
    if ([keyPath isEqualToString:@"loadedTimeRanges"]){
        
    }else if ([keyPath isEqualToString:@"status"]){
        //准备播放的状态
        if (playerItem.status == AVPlayerItemStatusReadyToPlay){
            [self.avPlayer seekToTime:kCMTimeZero];
        }
    }
}

//视频播放完成
- (void)moviePlayDidEnd{
    [self.avPlayer seekToTime:kCMTimeZero];
    [self.avPlayer play];
}

- (void)dealloc{
    [self.avPlayer pause];
    self.playerItem = nil;
    self.avPlayer = nil;
    [self.avPlayer.currentItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
    [self.avPlayer.currentItem removeObserver:self forKeyPath:@"status"];
}

@end
