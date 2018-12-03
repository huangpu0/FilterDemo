//
//  ViewController.m
//  FilterDemo
//
//  Created by 朴子hp on 2018/11/27.
//  Copyright © 2018年 朴子hp. All rights reserved.
//

#import "ViewController.h"
#import "PhotoCameraVCtrller.h"
#import "VideoCameraVCtrller.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"图片视频滤镜处理";
    
    [self setUpContentView];
}

#pragma mark - 建立视图
- (void)setUpContentView{
    
    UIButton *btn  = [[UIButton alloc]init];
    btn.frame = CGRectMake(50, 200, kScreenW - 100, 40);
    btn.backgroundColor = [UIColor redColor];
    btn.tag = 100;
    [btn setTitle:@"图片" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(touchEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1  = [[UIButton alloc]init];
    btn1.frame = CGRectMake(50, 300, kScreenW - 100, 40);
    btn1.backgroundColor = [UIColor redColor];
    btn1.tag = 101;
    [btn1 setTitle:@"视频" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(touchEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
}

- (void)touchEvent:(UIButton *)btn{
    
    if (btn.tag == 100) {
        
        PhotoCameraVCtrller *pVC = [[PhotoCameraVCtrller alloc]init];
        [self.navigationController pushViewController:pVC animated:YES];
        
    }else{
        
        VideoCameraVCtrller *vVC = [[VideoCameraVCtrller alloc]init];
        [self.navigationController pushViewController:vVC animated:YES];
    }
}

@end
