//
//  VideoUtils.h
//  FilterDemo
//
//  Created by 朴子hp on 2018/11/30.
//  Copyright © 2018年 朴子hp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VideoUtils : NSObject

// 视频转Mp4格式 并输出 url地址
+ (void)conversionFormatMp4WithUrl:(NSURL *)videoUrl videoblock:(void (^)(BOOL success,NSString* urlStr))callblock;

// 合成音乐
+ (void)musicCompositionForMusicInfo:(NSURL *)musicUrl withVideoPath:(NSURL *)videoUrl videoblock:(void (^)(BOOL success, NSString* urlStr))callblock;

@end

NS_ASSUME_NONNULL_END
