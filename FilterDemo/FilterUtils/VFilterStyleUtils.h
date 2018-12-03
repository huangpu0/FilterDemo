//
//  VFilterStyleUtils.h
//  FilterDemo
//
//  Created by 朴子hp on 2018/11/30.
//  Copyright © 2018年 朴子hp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GPUImage.h"

NS_ASSUME_NONNULL_BEGIN

@interface VFilterStyleUtils : NSObject

//源视频
+ (void)SourceVideo:(NSURL *)videoUrl withView:(UIView *)view;

/* 伽马线*/
+ (void)GammaVideo:(NSURL *)videoUrl withView:(UIView *)view;

//* 反色*/
+ (void)ColorInvertVideo:(NSURL *)videoUrl withView:(UIView *)view;

/* 褐色(怀旧)*/
+ (void)SepiaVideo:(NSURL *)videoUrl withView:(UIView *)view;

/* 高斯模糊*/
+ (void)GaussianBlurVideo:(NSURL *)videoUrl withView:(UIView *)view;

#pragma mark - 视觉效果

/* 素描*/
+ (void)SketchVideo:(NSURL *)videoUrl withView:(UIView *)view;

/* 卡通*/
+ (void)ToonVideo:(NSURL *)videoUrl withView:(UIView *)view;

/* 收缩失真，凹面镜*/
+ (void)PinchDistortionVideo:(NSURL *)videoUrl withView:(UIView *)view;

/* 伸展失真，哈哈镜*/
+ (void)StretchDistortionVideo:(NSURL *)videoUrl withView:(UIView *)view;

/* 水晶球效果*/
+ (void)GlassSphereVideo:(NSURL *)videoUrl withView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
