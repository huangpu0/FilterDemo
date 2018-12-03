//
//  VFilterStyleUtils.m
//  FilterDemo
//
//  Created by 朴子hp on 2018/11/30.
//  Copyright © 2018年 朴子hp. All rights reserved.
//

#import "VFilterStyleUtils.h"

@implementation VFilterStyleUtils

//源视频
+ (void)SourceVideo:(NSURL *)videoUrl withView:(UIView *)view;{
    
    GPUImageMovie *_movie = [[GPUImageMovie alloc] initWithURL:videoUrl];
    _movie.shouldRepeat = YES;
    [_movie removeAllTargets];
    
    GPUImageView *_myGPUImageView = [[GPUImageView alloc] initWithFrame:CGRectMake(35, kNavH + 20, kScreenW - 70, kScreenH - kNavH - 20 - 240)];
    _myGPUImageView.fillMode = kGPUImageFillModeStretch;
    _myGPUImageView.backgroundColor = [UIColor whiteColor];
    
   
    [_movie addTarget:_myGPUImageView];
    [view addSubview:_myGPUImageView];
    [_movie startProcessing];
}

/* 伽马线*/
+ (void)GammaVideo:(NSURL *)videoUrl withView:(UIView *)view;{
    
    GPUImageMovie *_movie = [[GPUImageMovie alloc] initWithURL:videoUrl];
    _movie.shouldRepeat = YES;
    [_movie removeAllTargets];
    
    GPUImageFilter *myFilter = [[GPUImageFilter alloc]init];
    GPUImageGammaFilter *filter = [[GPUImageGammaFilter alloc] init];
    myFilter = filter;
    
    GPUImageView *_myGPUImageView = [[GPUImageView alloc] initWithFrame:CGRectMake(35, kNavH + 20, kScreenW - 70, kScreenH - kNavH - 20 - 240)];
    _myGPUImageView.fillMode = kGPUImageFillModeStretch;
    _myGPUImageView.backgroundColor = [UIColor whiteColor];
   
    [_movie addTarget:filter];
    [filter addTarget:_myGPUImageView];
    [view addSubview:_myGPUImageView];
    
    [_movie startProcessing];
}

/* 反色*/
+ (void)ColorInvertVideo:(NSURL *)videoUrl withView:(UIView *)view;{
    
    GPUImageMovie *_movie = [[GPUImageMovie alloc] initWithURL:videoUrl];
    _movie.shouldRepeat = YES;
    [_movie removeAllTargets];
    
    GPUImageFilter *myFilter = [[GPUImageFilter alloc]init];
    GPUImageColorInvertFilter *filter = [[GPUImageColorInvertFilter alloc] init];
    myFilter = filter;
    
    GPUImageView *_myGPUImageView = [[GPUImageView alloc] initWithFrame:CGRectMake(35, kNavH + 20, kScreenW - 70, kScreenH - kNavH - 20 - 240)];
    _myGPUImageView.fillMode = kGPUImageFillModeStretch;
    _myGPUImageView.backgroundColor = [UIColor whiteColor];
    
    [_movie addTarget:filter];
    [filter addTarget:_myGPUImageView];
    [filter addTarget:_myGPUImageView];
    [view addSubview:_myGPUImageView];
    [_movie startProcessing];
}

/* 褐色(怀旧)*/
+ (void)SepiaVideo:(NSURL *)videoUrl withView:(UIView *)view;{
    
    GPUImageMovie *_movie = [[GPUImageMovie alloc] initWithURL:videoUrl];
    _movie.shouldRepeat = YES;
    [_movie removeAllTargets];
    
    GPUImageFilter *myFilter = [[GPUImageFilter alloc]init];
    GPUImageSepiaFilter *filter = [[GPUImageSepiaFilter alloc] init];
    myFilter = filter;
    
    GPUImageView *_myGPUImageView = [[GPUImageView alloc] initWithFrame:CGRectMake(35, kNavH + 20, kScreenW - 70, kScreenH - kNavH - 20 - 240)];
    _myGPUImageView.fillMode = kGPUImageFillModeStretch;
    _myGPUImageView.backgroundColor = [UIColor whiteColor];
    
    [_movie addTarget:filter];
    [filter addTarget:_myGPUImageView];
    [view addSubview:_myGPUImageView];
    [_movie startProcessing];
}

/* 高斯模糊*/
+ (void)GaussianBlurVideo:(NSURL *)videoUrl withView:(UIView *)view;{
    
    GPUImageMovie *_movie = [[GPUImageMovie alloc] initWithURL:videoUrl];
    _movie.shouldRepeat = YES;
    [_movie removeAllTargets];
    
    GPUImageFilter *myFilter = [[GPUImageFilter alloc]init];
    GPUImageGaussianBlurFilter *filter = [[GPUImageGaussianBlurFilter alloc] init];
    filter.texelSpacingMultiplier = 9.0f;
    filter.blurRadiusInPixels = 6.0f;
    myFilter = filter;
    
    GPUImageView *_myGPUImageView = [[GPUImageView alloc] initWithFrame:CGRectMake(35, kNavH + 20, kScreenW - 70, kScreenH - kNavH - 20 - 240)];
    _myGPUImageView.fillMode = kGPUImageFillModeStretch;
    _myGPUImageView.backgroundColor = [UIColor whiteColor];
    
    [_movie addTarget:filter];
    [filter addTarget:_myGPUImageView];
    [view addSubview:_myGPUImageView];
    [_movie startProcessing];
}

#pragma mark - 视觉效果

/* 素描*/
+ (void)SketchVideo:(NSURL *)videoUrl withView:(UIView *)view;{
    
    GPUImageMovie *_movie = [[GPUImageMovie alloc] initWithURL:videoUrl];
    _movie.shouldRepeat = YES;
    [_movie removeAllTargets];
    
    GPUImageFilter *myFilter = [[GPUImageFilter alloc]init];
    GPUImageSketchFilter *filter = [[GPUImageSketchFilter alloc] init];
    myFilter = filter;
    
    GPUImageView *_myGPUImageView = [[GPUImageView alloc] initWithFrame:CGRectMake(35, kNavH + 20, kScreenW - 70, kScreenH - kNavH - 20 - 240)];
    _myGPUImageView.fillMode = kGPUImageFillModeStretch;
    _myGPUImageView.backgroundColor = [UIColor whiteColor];
    
    [_movie addTarget:filter];
    [filter addTarget:_myGPUImageView];
    [view addSubview:_myGPUImageView];
    [_movie startProcessing];
}

/* 卡通*/
+ (void)ToonVideo:(NSURL *)videoUrl withView:(UIView *)view;{
    
    GPUImageMovie *_movie = [[GPUImageMovie alloc] initWithURL:videoUrl];
    _movie.shouldRepeat = YES;
    [_movie removeAllTargets];
    
    GPUImageFilter *myFilter = [[GPUImageFilter alloc]init];
    GPUImageToonFilter *filter = [[GPUImageToonFilter alloc] init];
    myFilter = filter;
    
    GPUImageView *_myGPUImageView = [[GPUImageView alloc] initWithFrame:CGRectMake(35, kNavH + 20, kScreenW - 70, kScreenH - kNavH - 20 - 240)];
    _myGPUImageView.fillMode = kGPUImageFillModeStretch;
    _myGPUImageView.backgroundColor = [UIColor whiteColor];
    
    [_movie addTarget:filter];
    [filter addTarget:_myGPUImageView];
    [view addSubview:_myGPUImageView];
    [_movie startProcessing];
}

/* 收缩失真，凹面镜*/
+ (void)PinchDistortionVideo:(NSURL *)videoUrl withView:(UIView *)view;{
    
    GPUImageMovie *_movie = [[GPUImageMovie alloc] initWithURL:videoUrl];
    _movie.shouldRepeat = YES;
    [_movie removeAllTargets];
    
    GPUImageFilter *myFilter = [[GPUImageFilter alloc]init];
    GPUImagePinchDistortionFilter *filter = [[GPUImagePinchDistortionFilter alloc] init];
    myFilter = filter;
    
    GPUImageView *_myGPUImageView = [[GPUImageView alloc] initWithFrame:CGRectMake(35, kNavH + 20, kScreenW - 70, kScreenH - kNavH - 20 - 240)];
    _myGPUImageView.fillMode = kGPUImageFillModeStretch;
    _myGPUImageView.backgroundColor = [UIColor whiteColor];
    
    [_movie addTarget:filter];
    [filter addTarget:_myGPUImageView];
    [view addSubview:_myGPUImageView];
    [_movie startProcessing];
}

/* 伸展失真，哈哈镜*/
+ (void)StretchDistortionVideo:(NSURL *)videoUrl withView:(UIView *)view;{
    
    GPUImageMovie *_movie = [[GPUImageMovie alloc] initWithURL:videoUrl];
    _movie.shouldRepeat = YES;
    [_movie removeAllTargets];
    
    GPUImageFilter *myFilter = [[GPUImageFilter alloc]init];
    GPUImageStretchDistortionFilter *filter = [[GPUImageStretchDistortionFilter alloc] init];
    myFilter = filter;
    
    GPUImageView *_myGPUImageView = [[GPUImageView alloc] initWithFrame:CGRectMake(35, kNavH + 20, kScreenW - 70, kScreenH - kNavH - 20 - 240)];
    _myGPUImageView.fillMode = kGPUImageFillModeStretch;
    _myGPUImageView.backgroundColor = [UIColor whiteColor];
    
    [_movie addTarget:filter];
    [filter addTarget:_myGPUImageView];
    [view addSubview:_myGPUImageView];
    [_movie startProcessing];
}

/* 水晶球效果*/
+ (void)GlassSphereVideo:(NSURL *)videoUrl withView:(UIView *)view;{
    
    GPUImageMovie *_movie = [[GPUImageMovie alloc] initWithURL:videoUrl];
    _movie.shouldRepeat = YES;
    [_movie removeAllTargets];
    
    GPUImageFilter *myFilter = [[GPUImageFilter alloc]init];
    GPUImageGlassSphereFilter *filter = [[GPUImageGlassSphereFilter alloc] init];
    myFilter = filter;
    
    GPUImageView *_myGPUImageView = [[GPUImageView alloc] initWithFrame:CGRectMake(35, kNavH + 20, kScreenW - 70, kScreenH - kNavH - 20 - 240)];
    _myGPUImageView.fillMode = kGPUImageFillModeStretch;
    _myGPUImageView.backgroundColor = [UIColor whiteColor];
    
    [_movie addTarget:filter];
    [filter addTarget:_myGPUImageView];
    [view addSubview:_myGPUImageView];
    [_movie startProcessing];
}

@end
