//
//  VideoCameraVCtrller.m
//  FilterDemo
//
//  Created by 朴子hp on 2018/11/30.
//  Copyright © 2018年 朴子hp. All rights reserved.
//

#import "VideoCameraVCtrller.h"
#import "VideoFilterVCtrller.h"
#import "VideoUtils.h"

@interface VideoCameraVCtrller ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

//系统相册选择
@property (nonatomic, strong) UIImagePickerController *imgPicker;
//相机
@property (nonatomic, strong) GPUImageStillCamera *myCamera;
//图片预览层
@property (nonatomic, strong) GPUImageView *myGPUImageView;
//滤镜相关
@property (nonatomic, strong) GPUImageFilter *myFilter;

@end

@implementation VideoCameraVCtrller

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self cameraConfig];
    
    [self setUpContentView];
}

#pragma mark - 相机基本配置
- (void)cameraConfig{
    
    _myCamera = [[GPUImageStillCamera alloc] initWithSessionPreset:AVCaptureSessionPreset1280x720 cameraPosition:AVCaptureDevicePositionBack];
    //竖屏方向
    _myCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
    
    
    GPUImageSepiaFilter *stretchDistortionFilter = [[GPUImageSepiaFilter alloc] init];
    self.myFilter = stretchDistortionFilter;
    
    _myGPUImageView = [[GPUImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
    _myGPUImageView.fillMode = kGPUImageFillModeStretch;
    
    [_myCamera addTarget:stretchDistortionFilter];
    [stretchDistortionFilter addTarget:_myGPUImageView];
    [stretchDistortionFilter addTarget:_myGPUImageView];
    [self.view addSubview:_myGPUImageView];
    [_myCamera startCameraCapture];

    
}

#pragma mark - 建立主要触摸视图
- (void)setUpContentView{
    
    UIButton *back = [[UIButton alloc]init];
    back.tag = 106;
    back.frame = CGRectMake(30, kStatusH, 50, 30);
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back addTarget:self action:@selector(eventTouch:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
    
    //底部试图
    UIView *btView = [[UIView alloc]init];
    btView.frame = CGRectMake(0, kScreenH - 150, kScreenW, 150);
    btView.backgroundColor = kRgbAColor(0, 0, 0, .5);
    [self.view addSubview:btView];
    
    //相册
    UIButton *btn = [[UIButton alloc]init];
    btn.tag = 100;
    btn.frame = CGRectMake(50, 50, 50, 50);
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
    [btn setTitle:@"相册" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(eventTouch:) forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.textColor = [UIColor whiteColor];
    [btView addSubview:btn];
    
    //相机
    UIView *cView = [[UIView alloc]init];
    cView.frame = CGRectMake(kScreenW/2 - 35, 40, 70, 70);
    cView.layer.borderWidth = 5.0f;
    cView.layer.borderColor = [UIColor whiteColor].CGColor;
    cView.layer.cornerRadius = 35.0f;
    cView.layer.masksToBounds = YES;
    [btView addSubview:cView];
    
    UIButton *btn1 = [[UIButton alloc]init];
    btn1.tag = 101;
    btn1.frame = CGRectMake(10, 10, 50, 50);
    btn1.backgroundColor = [UIColor whiteColor];
    btn1.layer.masksToBounds = YES;
    btn1.layer.cornerRadius = 25.0f;
    [btn1 addTarget:self action:@selector(eventTouch:) forControlEvents:UIControlEventTouchUpInside];
    [cView addSubview:btn1];
    
    //切换摄像头
    UIButton *btn2 = [[UIButton alloc]init];
    btn2.tag = 102;
    btn2.frame = CGRectMake(kScreenW/2 + 25, 50, kScreenW/2 - 25, 50);
    btn2.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [btn2 setTitle:@"切换摄像头" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(eventTouch:) forControlEvents:UIControlEventTouchUpInside];
    btn2.titleLabel.textColor = [UIColor whiteColor];
    [btView addSubview:btn2];
}

#pragma mark - 相机相册触发事件
- (void)eventTouch:(UIButton *)btn{
    
    switch (btn.tag) {
        case 106:{
            [self.navigationController popViewControllerAnimated:YES];
        }break;
        case 100:{
            [self openImagePickerControllerWithVideoType];
        }break;
        case 101:{
            [self shutterCamera];
        }break;
        case 102:{
            [self.myCamera rotateCamera];
        }break;
        default:break;
    }
}

#pragma mark - 打开ImagePickerController的方法 判断视频/图片类型
- (void)openImagePickerControllerWithVideoType{
    
    _imgPicker = [[UIImagePickerController alloc] init];
    _imgPicker.delegate = self;
    _imgPicker.videoMaximumDuration = 30.0f;
    _imgPicker.mediaTypes = [NSArray arrayWithObjects:@"public.movie", nil];
    _imgPicker.sourceType= UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self presentViewController:_imgPicker animated:YES completion:nil];
    
}

#pragma mark -  相册视频选择
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    NSString *mediaType=[info objectForKey:UIImagePickerControllerMediaType];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if ([mediaType isEqualToString:@"public.movie"]){
        NSLog(@"视频Url --%@",info[UIImagePickerControllerMediaURL]);
        
        //如果是视频 /获得视频的URL 转成 Mp4 格式
        
        [VideoUtils conversionFormatMp4WithUrl:info[UIImagePickerControllerMediaURL] videoblock:^(BOOL success, NSString * _Nonnull urlStr) {
            
            if (success) {
                VideoFilterVCtrller *filterVC = [[VideoFilterVCtrller alloc]init];
                filterVC.fileUrl = [NSURL fileURLWithPath:urlStr];
                [self.navigationController pushViewController:filterVC animated:YES];
            }
    
        }];
        
    }
    
}


#pragma mark - 录像
- (void)shutterCamera {
    
    
}

@end
