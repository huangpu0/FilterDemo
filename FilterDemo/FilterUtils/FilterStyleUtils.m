//
//  FilterStyleUtils.m
//  FilterDemo
//
//  Created by 朴子hp on 2018/11/28.
//  Copyright © 2018年 朴子hp. All rights reserved.
//

#import "FilterStyleUtils.h"

@implementation FilterStyleUtils

/* 伽马线*/
+ (UIImage *)getGammaImage:(UIImage *)sourceImage;{
    
    GPUImageGammaFilter *disFilter = [[GPUImageGammaFilter alloc] init];
    //设置要渲染的区域
    [disFilter forceProcessingAtSize:sourceImage.size];
    [disFilter useNextFrameForImageCapture];
    //获取数据源
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc]initWithImage:sourceImage];
    //添加上滤镜
    [stillImageSource addTarget:disFilter];
    //开始渲染
    [stillImageSource processImage];
    //获取渲染后的图片
    return  [disFilter imageFromCurrentFramebuffer];

}

/* 反色*/
+ (UIImage *)getColorInvertImage:(UIImage *)sourceImage;{
    
    GPUImageColorInvertFilter *disFilter = [[GPUImageColorInvertFilter alloc] init];
    //设置要渲染的区域
    [disFilter forceProcessingAtSize:sourceImage.size];
    [disFilter useNextFrameForImageCapture];
    //获取数据源
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc]initWithImage:sourceImage];
    //添加上滤镜
    [stillImageSource addTarget:disFilter];
    //开始渲染
    [stillImageSource processImage];
    //获取渲染后的图片
    return  [disFilter imageFromCurrentFramebuffer];
}

/* 褐色(怀旧)*/
+ (UIImage *)getSepiaImage:(UIImage *)sourceImage;{
    
    GPUImageSepiaFilter *disFilter = [[GPUImageSepiaFilter alloc] init];
    //设置要渲染的区域
    [disFilter forceProcessingAtSize:sourceImage.size];
    [disFilter useNextFrameForImageCapture];
    //获取数据源
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc]initWithImage:sourceImage];
    //添加上滤镜
    [stillImageSource addTarget:disFilter];
    //开始渲染
    [stillImageSource processImage];
    //获取渲染后的图片
    return  [disFilter imageFromCurrentFramebuffer];
}

/* 高斯模糊*/
+ (UIImage *)getGaussianBlurImage:(UIImage *)sourceImage;{
    
    GPUImageGaussianBlurFilter *disFilter = [[GPUImageGaussianBlurFilter alloc] init];
   // texelSpacingMultiplier是模糊的强度，数值越大，模糊效果越明显
    disFilter.texelSpacingMultiplier = 9.0f;
    //设置要渲染的区域
    [disFilter forceProcessingAtSize:sourceImage.size];
    [disFilter useNextFrameForImageCapture];
    //获取数据源
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc]initWithImage:sourceImage];
    //添加上滤镜
    [stillImageSource addTarget:disFilter];
    //开始渲染
    [stillImageSource processImage];
    //获取渲染后的图片
    return  [disFilter imageFromCurrentFramebuffer];
    
}

#pragma mark - 视觉效果

/* 素描*/
+ (UIImage *)getSketchImage:(UIImage *)sourceImage;{
    
    GPUImageSketchFilter *disFilter = [[GPUImageSketchFilter alloc] init];
    //设置要渲染的区域
    [disFilter forceProcessingAtSize:sourceImage.size];
    [disFilter useNextFrameForImageCapture];
    //获取数据源
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc]initWithImage:sourceImage];
    //添加上滤镜
    [stillImageSource addTarget:disFilter];
    //开始渲染
    [stillImageSource processImage];
    //获取渲染后的图片
    return  [disFilter imageFromCurrentFramebuffer];
    
}

/* 卡通*/
+ (UIImage *)getToonImage:(UIImage *)sourceImage;{
    
    GPUImageToonFilter *disFilter = [[GPUImageToonFilter alloc] init];
    //设置要渲染的区域
    [disFilter forceProcessingAtSize:sourceImage.size];
    [disFilter useNextFrameForImageCapture];
    //获取数据源
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc]initWithImage:sourceImage];
    //添加上滤镜
    [stillImageSource addTarget:disFilter];
    //开始渲染
    [stillImageSource processImage];
    //获取渲染后的图片
    return  [disFilter imageFromCurrentFramebuffer];
    
}

/* 收缩失真，凹面镜*/
+ (UIImage *)getPinchDistortionImage:(UIImage *)sourceImage;{
    
    GPUImagePinchDistortionFilter *disFilter = [[GPUImagePinchDistortionFilter alloc] init];
    //设置要渲染的区域
    [disFilter forceProcessingAtSize:sourceImage.size];
    [disFilter useNextFrameForImageCapture];
    //获取数据源
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc]initWithImage:sourceImage];
    //添加上滤镜
    [stillImageSource addTarget:disFilter];
    //开始渲染
    [stillImageSource processImage];
    //获取渲染后的图片
    return  [disFilter imageFromCurrentFramebuffer];
    
}

/* 伸展失真，哈哈镜*/
+ (UIImage *)getStretchDistortionImage:(UIImage *)sourceImage;{
    
    GPUImageStretchDistortionFilter *disFilter = [[GPUImageStretchDistortionFilter alloc] init];
    //设置要渲染的区域
    [disFilter forceProcessingAtSize:sourceImage.size];
    [disFilter useNextFrameForImageCapture];
    //获取数据源
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc]initWithImage:sourceImage];
    //添加上滤镜
    [stillImageSource addTarget:disFilter];
    //开始渲染
    [stillImageSource processImage];
    //获取渲染后的图片
    return  [disFilter imageFromCurrentFramebuffer];
    
}

/* 水晶球效果*/
+ (UIImage *)getGlassSphereImage:(UIImage *)sourceImage;{
    
    GPUImageGlassSphereFilter *disFilter = [[GPUImageGlassSphereFilter alloc] init];
    //设置要渲染的区域
    [disFilter forceProcessingAtSize:sourceImage.size];
    [disFilter useNextFrameForImageCapture];
    //获取数据源
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc]initWithImage:sourceImage];
    //添加上滤镜
    [stillImageSource addTarget:disFilter];
    //开始渲染
    [stillImageSource processImage];
    //获取渲染后的图片
    return  [disFilter imageFromCurrentFramebuffer];
    
}

@end
