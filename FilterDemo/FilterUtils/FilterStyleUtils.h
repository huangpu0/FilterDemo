//
//  FilterStyleUtils.h
//  FilterDemo
//
//  Created by 朴子hp on 2018/11/28.
//  Copyright © 2018年 朴子hp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GPUImage.h"
NS_ASSUME_NONNULL_BEGIN

@interface FilterStyleUtils : NSObject

/* 伽马线*/
+ (UIImage *)getGammaImage:(UIImage *)sourceImage;

/* 反色*/
+ (UIImage *)getColorInvertImage:(UIImage *)sourceImage;

/* 褐色(怀旧)*/
+ (UIImage *)getSepiaImage:(UIImage *)sourceImage;

/* 高斯模糊*/
+ (UIImage *)getGaussianBlurImage:(UIImage *)sourceImage;

#pragma mark - 视觉效果

/* 素描*/
+ (UIImage *)getSketchImage:(UIImage *)sourceImage;

/* 卡通*/
+ (UIImage *)getToonImage:(UIImage *)sourceImage;

/* 收缩失真，凹面镜*/
+ (UIImage *)getPinchDistortionImage:(UIImage *)sourceImage;

/* 伸展失真，哈哈镜*/
+ (UIImage *)getStretchDistortionImage:(UIImage *)sourceImage;

/* 水晶球效果*/
+ (UIImage *)getGlassSphereImage:(UIImage *)sourceImage;

@end

NS_ASSUME_NONNULL_END
