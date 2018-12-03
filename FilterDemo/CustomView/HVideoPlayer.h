//
//  HVideoPlayer.h
//  FilterDemo
//
//  Created by 朴子hp on 2018/11/30.
//  Copyright © 2018年 朴子hp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HVideoPlayer : UIView

//视频文件Url
@property (strong, nonatomic) NSURL *fileUrl;

@property (strong, nonatomic) AVURLAsset *kj_urlAsset;

@end

NS_ASSUME_NONNULL_END
