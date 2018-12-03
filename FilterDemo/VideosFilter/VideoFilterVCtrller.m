//
//  VideoFilterVCtrller.m
//  FilterDemo
//
//  Created by 朴子hp on 2018/11/30.
//  Copyright © 2018年 朴子hp. All rights reserved.
//

#import "VideoFilterVCtrller.h"
#import "HVideoPlayer.h"
#import "FilterTypeView.h"
#import "VFilterStyleUtils.h"

@interface VideoFilterVCtrller ()<FilterViewDelegate>

//播放器
@property (strong, nonatomic) HVideoPlayer *player;
//滤镜类型
@property (strong, nonatomic) FilterTypeView *filterView;

//相机
@property (nonatomic, strong) GPUImageMovie *movie;
//图片预览层
@property (nonatomic, strong) GPUImageView *myGPUImageView;
//滤镜相关
@property (nonatomic, strong) GPUImageFilter *myFilter;

@end

@implementation VideoFilterVCtrller

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"视频滤镜处理";
    [self setUpContentView];
}

#pragma mark - 播放相关处理
- (void)setUpContentView{
    
    [VFilterStyleUtils SourceVideo:self.fileUrl withView:self.view];
    
    _filterView = [[FilterTypeView alloc]init];
    _filterView.delegate = self;
    _filterView.frame = CGRectMake(0, kScreenH - 200, kScreenW, 200);
    _filterView.backgroundColor = kHexOfColor(0xB064D6);
    [self.view addSubview:_filterView];
    
}

- (void)didSeletctedEvent:(NSInteger)tag{
    switch (tag) {
        case 0:{
            [VFilterStyleUtils SourceVideo:self.fileUrl withView:self.view];
        }break;
        case 1:{
            //伽马线
            [VFilterStyleUtils GammaVideo:self.fileUrl withView:self.view];
        }break;
        case 2:{
            //反色
            [VFilterStyleUtils ColorInvertVideo:self.fileUrl withView:self.view];
        }break;
        case 3:{
            //褐色（怀旧）
            [VFilterStyleUtils SepiaVideo:self.fileUrl withView:self.view];
        }break;
        case 4:{
            //高斯模糊
            [VFilterStyleUtils GaussianBlurVideo:self.fileUrl withView:self.view];
        }break;
        case 5:{
            //素描
            [VFilterStyleUtils SketchVideo:self.fileUrl withView:self.view];
        }break;
        case 6:{
            //卡通
            [VFilterStyleUtils ToonVideo:self.fileUrl withView:self.view];
        }break;
        case 7:{
            //收缩失真，凹面镜
            [VFilterStyleUtils PinchDistortionVideo:self.fileUrl withView:self.view];
        }break;
        case 8:{
            //伸展失真，哈哈镜
            [VFilterStyleUtils StretchDistortionVideo:self.fileUrl withView:self.view];
        }break;
        case 9:{
            //水晶球效果
            [VFilterStyleUtils GlassSphereVideo:self.fileUrl withView:self.view];
        }break;
        case 100:{
            
        }break;
            
        default:{
            
        }break;
    }
}
@end
