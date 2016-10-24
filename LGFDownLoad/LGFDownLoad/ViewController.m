//
//  ViewController.m
//  LGFDownLoad
//
//  Created by liguofu on 16/9/22.
//  Copyright © 2016年 appcan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIImageView *imageview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"DownLoad";
    
    self.imageview = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 200, 200)];
    NSURL *url = [NSURL URLWithString:@"https://picjumbo.imgix.net/HNCK8461.jpg?q=40&w=1650&sharp=30"];
    [self downloadImageWithUrl:url];
    
}


/**
 * NSData dataWithContentOfURL 下载文件
 */
- (void)downloadImageWithUrl:(NSURL *)url {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // 发送一个get请求
        NSData *data = [NSData dataWithContentsOfURL:url];
        // 回到主线程刷新UI
        dispatch_async(dispatch_get_main_queue(),^{
            self.imageview.image = [UIImage imageWithData:data];
        });
        
    });
}

/**
 *  NSURLConnection 下载文件
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
