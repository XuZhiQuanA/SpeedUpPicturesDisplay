//
//  ViewController.m
//  ImageView
//
//  Created by 徐智全 on 2020/5/26.
//  Copyright © 2020 徐智全. All rights reserved.
//

#import "ViewController.h"
#import "ImageView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ImageView *imageView = [[ImageView alloc] initWithFrame:self.view.bounds];
    imageView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:imageView];
}


@end
