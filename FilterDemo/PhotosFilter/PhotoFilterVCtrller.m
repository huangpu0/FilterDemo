//
//  PhotoFilterVCtrller.m
//  FilterDemo
//
//  Created by 朴子hp on 2018/11/27.
//  Copyright © 2018年 朴子hp. All rights reserved.
//

#import "PhotoFilterVCtrller.h"
#import "FilterTypeView.h"

@interface PhotoFilterVCtrller ()<FilterViewDelegate>

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) FilterTypeView *filterView;

@end

@implementation PhotoFilterVCtrller

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"相册滤镜处理";
    
    [self setUpContentView];
}

#pragma mark - 内容视图
- (void)setUpContentView{
    
    _imageView = [[UIImageView alloc]initWithImage:self.image];
    _imageView.frame = CGRectMake(70,kNavH + 15, kScreenW - 140, kScreenH - kNavH - 15 - 200 - 30);
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_imageView];
    
    _filterView = [[FilterTypeView alloc]init];
    _filterView.delegate = self;
    _filterView.frame = CGRectMake(0, kScreenH - 200, kScreenW, 200);
    _filterView.backgroundColor = kHexOfColor(0xB064D6);
    [self.view addSubview:_filterView];
   
}

- (void)didSeletctedEvent:(NSInteger)tag{
    switch (tag) {
        case 0:{
            self.imageView.image = self.image;
        }break;
        case 1:{
            //伽马线
            self.imageView.image = [FilterStyleUtils getGammaImage:self.image];
        }break;
        case 2:{
            //反色
            self.imageView.image = [FilterStyleUtils getColorInvertImage:self.image];
        }break;
        case 3:{
            //褐色（怀旧）
            self.imageView.image = [FilterStyleUtils getSepiaImage:self.image];
        }break;
        case 4:{
            //高斯模糊
            self.imageView.image = [FilterStyleUtils getGaussianBlurImage:self.image];
        }break;
        case 5:{
            //素描
            self.imageView.image = [FilterStyleUtils getSketchImage:self.image];
        }break;
        case 6:{
            //卡通
            self.imageView.image = [FilterStyleUtils getToonImage:self.image];
        }break;
        case 7:{
            //收缩失真，凹面镜
            self.imageView.image = [FilterStyleUtils getPinchDistortionImage:self.image];
        }break;
        case 8:{
            //伸展失真，哈哈镜
            self.imageView.image = [FilterStyleUtils getStretchDistortionImage:self.image];
        }break;
        case 9:{
            //水晶球效果
            self.imageView.image = [FilterStyleUtils getGlassSphereImage:self.image];
        }break;
        case 100:{
            UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        }break;

        default:{
            
        }break;
    }
}

//图片写入相册
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    
    if (error) {
        
        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"图片" message:@"图片保存失败！！！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alter show];
        

    }else{
        
        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"图片" message:@"图片保存成功！！！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alter show];
    }
}

@end
