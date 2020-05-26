//
//  ImageView.m
//  ImageView
//
//  Created by 徐智全 on 2020/5/26.
//  Copyright © 2020 徐智全. All rights reserved.
//

#import "ImageView.h"
#import <mach/mach_time.h>

#define LABEL_TAG 1
static const CGRect imageRect = {{0, 0}, {100, 100}};
static const CGPoint imagePoint = {0, 0};

static const CGSize imageSize = {100, 100};

@implementation ImageView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        if (!self.image) {
            
            //1.获取图片
             self.image = [UIImage imageNamed:@"1"];//236843
            
            // 由于JPEG图像是不透明的，所以第二个参数就设为YES
//             第三个参数是缩放比例。虽然这里可以用 [UIScreen mainScreen].scale 来获取，但实际上设为 0 后，系统就会自动设置正确的比例了
            
            //2.开启图形上下文
            UIGraphicsBeginImageContextWithOptions(imageSize, YES, 0);
            
            // 将图像画到当前的 image context 里，此时就完成了解压缩和重采样的工作
            
            //3.绘制到图形上下文中
            [self.image drawInRect:imageRect];
            
            //4.从上下文中获取图片
            self.image = UIGraphicsGetImageFromCurrentImageContext();
            
            //5.关闭上下文
            UIGraphicsEndImageContext();//61530
            
            //这样处理 图片显示的速度更快
            
            
            //UIGraphicsBeginImageContextWithOptions 开启图形上下文 主要是和图片处理有关的内容
        }
    }
    
    return self;
}

//关于drawRect：  https://www.jianshu.com/p/6b41dbcccce1?from=timeline&isappinstalled=0
- (void)drawRect:(CGRect)rect
{
    
     if (CGRectContainsRect(rect, imageRect)) {
 
          uint64_t start = getTickCount();

          [self.image drawInRect:imageRect];

          uint64_t drawTime = getTickCount() - start;
 
          NSLog(@"%llu", drawTime);  // 打印时间间隔
     }
}

uint64_t getTickCount(void)
{
     static mach_timebase_info_data_t sTimebaseInfo;

     uint64_t machTime = mach_absolute_time();

     // Convert to nanoseconds - if this is the first time we've run, get the timebase.
    if (sTimebaseInfo.denom == 0) {
         (void)mach_timebase_info(&sTimebaseInfo);
    }

    uint64_t millis = (machTime * sTimebaseInfo.numer) / sTimebaseInfo.denom;  // 纳秒

    return millis;
}






@end
