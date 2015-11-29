//
//  UIImage+image.m
//  08---02---图片剪裁
//
//  Created by mac on 15/10/4.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "UIImage+image.h"

@implementation UIImage (image)
+(UIImage *)drawImageWithBroderW:(int)borderW color:(UIColor *)color imageName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
//    //圆环宽度
//    CGFloat  borderW =10;
    //    计算位图上下文的size
    CGFloat W = image.size.width + 2*borderW ;
    CGFloat H = image.size.height + 2*borderW;
    //    计算位图上下文的frame
    CGRect rect = CGRectMake(0, 0, W, H);
    
    
    //开启位图上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    //设置圆环
    // 2.1绘制大圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    [color set];
    [path fill];
    // 2.2绘制小圆
    //小圆内切的正方体frame 也是设置裁剪区域
    CGRect rect1 = CGRectMake(borderW , borderW, image.size.width, image.size.height);
    //小圆路径
    UIBezierPath *path1 = [UIBezierPath bezierPathWithOvalInRect:rect1];
    //谁addClip就把谁作为裁剪区域,只会把[clipPath addClip]添加上的进行裁剪
    [path1 addClip];
    //绘制图片
    [image drawAtPoint:CGPointMake(borderW, borderW)];
    //获取图片
    image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    return image;
    

}
@end
