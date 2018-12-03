//
//  VideoUtils.m
//  FilterDemo
//
//  Created by 朴子hp on 2018/11/30.
//  Copyright © 2018年 朴子hp. All rights reserved.
//

#import "VideoUtils.h"

@implementation VideoUtils

+ (void)conversionFormatMp4WithUrl:(NSURL *)videoUrl videoblock:(void (^)(BOOL success, NSString* urlStr))callblock;{
   
    AVURLAsset *avAsset = [AVURLAsset URLAssetWithURL:videoUrl options:nil];
    NSArray *compatiblePresets = [AVAssetExportSession exportPresetsCompatibleWithAsset:avAsset];
    
    if ([compatiblePresets containsObject:AVAssetExportPresetLowQuality]) {
        
        AVAssetExportSession *exportSession = [[AVAssetExportSession alloc]initWithAsset:avAsset presetName:AVAssetExportPresetPassthrough];
        
        NSDate *date = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        //设定时间格式,这里可以设置成自己需要的格式
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *dateStr = [dateFormatter stringFromDate:date];
        
        NSString  *exportPath = [NSString stringWithFormat:@"%@/%@Video.mp4", [NSHomeDirectory() stringByAppendingString:@"/tmp"], dateStr];
        exportSession.outputURL = [NSURL fileURLWithPath:exportPath];
        exportSession.outputFileType = AVFileTypeMPEG4;
        [exportSession exportAsynchronouslyWithCompletionHandler:^{
            
            switch ([exportSession status]){
                case AVAssetExportSessionStatusFailed:
                {
                    if (callblock) {
                        callblock(NO,[NSString stringWithFormat:@"%@",exportSession.error]);
                    }
                    NSLog(@"导出视频失败--%@",[[exportSession error] localizedDescription]);
                }break;
                    
                case AVAssetExportSessionStatusCancelled:
                {
                    NSLog(@"导出视频取消");
                }break;
                    
                case AVAssetExportSessionStatusCompleted:
                {
                    if (callblock) {
                        callblock(YES,exportPath);
                     }
                    NSLog(@"导出视频地址--%@",exportPath);
                }break;
                default:
                    break;
                    
            } }];
    }
}

// 合成音乐
+ (void)musicCompositionForMusicInfo:(NSURL *)musicUrl withVideoPath:(NSURL *)videoUrl videoblock:(void (^)(BOOL success, NSString* urlStr))callblock;{
    
        //合成工具
        AVMutableComposition *kj_composition = [AVMutableComposition composition];
        //音频
        AVMutableCompositionTrack *kj_audioTrack = [kj_composition addMutableTrackWithMediaType:AVMediaTypeAudio preferredTrackID:kCMPersistentTrackID_Invalid];
        //视频
        AVMutableCompositionTrack *kj_videoTrack = [kj_composition addMutableTrackWithMediaType:AVMediaTypeVideo preferredTrackID:kCMPersistentTrackID_Invalid];
        
        NSDictionary* kj_options = @{AVURLAssetPreferPreciseDurationAndTimingKey:@YES};
        //视频AVAsset
        AVURLAsset *kj_videoAsset = [[AVURLAsset alloc] initWithURL:videoUrl options:kj_options];
        //视频时间范围（合成的音乐不能超过这个时间范围）
        CMTimeRange kj_videoTimeRange = CMTimeRangeMake(kCMTimeZero, kj_videoAsset.duration);
        //采集kj_videoAsset中的视频
        NSArray *videoArray = [kj_videoAsset tracksWithMediaType:AVMediaTypeVideo];
        AVAssetTrack *kj_assetVideo = videoArray.firstObject;
        [kj_videoTrack setPreferredTransform:kj_assetVideo.preferredTransform];
    
        //采集的视频加入到视频通道kj_videoTrack
        NSError *kj_videoError = nil;
        BOOL isComplete_video = [kj_videoTrack insertTimeRange:kj_videoTimeRange
                                                       ofTrack:kj_assetVideo
                                                        atTime:kCMTimeZero
                                                         error:&kj_videoError];
        NSLog(@"加入视频isComplete_video：%d error：%@",isComplete_video, kj_videoError);
    
        //音频AVAsset
        AVURLAsset *kj_audioAsset = [[AVURLAsset alloc] initWithURL:musicUrl options:kj_options];
    
        //采集kj_audioAsset中的音频
        NSArray *audioArray = [kj_audioAsset tracksWithMediaType:AVMediaTypeAudio];
        AVAssetTrack *kj_assetAudio = audioArray.firstObject;
        //音频的范围
        CMTimeRange kj_audioTimeRange = CMTimeRangeMake(kCMTimeZero, kj_audioAsset.duration);
        if (CMTimeCompare(kj_audioAsset.duration, kj_videoAsset.duration)) {
            //当视频时间小于音频时间
            kj_audioTimeRange = CMTimeRangeMake(kCMTimeZero, kj_videoAsset.duration);
        }
    
        //采集的音频加入到音频通道kj_audioTrack
        NSError *kj_audioError = nil;
        BOOL isComplete_audio = [kj_audioTrack insertTimeRange:kj_audioTimeRange
                                                       ofTrack:kj_assetAudio
                                                        atTime:kCMTimeZero
                                                         error:&kj_audioError];
        NSLog(@"加入音频isComplete_audio：%d error：%@",isComplete_audio, kj_audioError);
    
    AVAssetExportSession *exportSession = [[AVAssetExportSession alloc]initWithAsset:kj_composition presetName:AVAssetExportPresetPassthrough];
    
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateStr = [dateFormatter stringFromDate:date];
    
    NSString  *exportPath = [NSString stringWithFormat:@"%@/%@Video.mp4", [NSHomeDirectory() stringByAppendingString:@"/tmp"], dateStr];
    exportSession.outputURL = [NSURL fileURLWithPath:exportPath];
    exportSession.outputFileType = AVFileTypeMPEG4;
    [exportSession exportAsynchronouslyWithCompletionHandler:^{
        
        switch ([exportSession status]){
            case AVAssetExportSessionStatusFailed:
            {
                if (callblock) {
                    callblock(NO,[NSString stringWithFormat:@"%@",exportSession.error]);
                }
                NSLog(@"导出视频失败--%@",[[exportSession error] localizedDescription]);
            }break;
                
            case AVAssetExportSessionStatusCancelled:
            {
                NSLog(@"导出视频取消");
            }break;
                
            case AVAssetExportSessionStatusCompleted:
            {
                if (callblock) {
                    callblock(YES,exportPath);
                }
                NSLog(@"导出视频地址--%@",exportPath);
            }break;
            default:
                break;
                
        } }];
    
}

@end
