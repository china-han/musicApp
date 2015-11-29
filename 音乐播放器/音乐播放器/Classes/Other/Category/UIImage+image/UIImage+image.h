




#import <UIKit/UIKit.h>
/**
 *  用来剪切图片,效果:中间为一个圆形图片,外面是一层圆环
 */
@interface UIImage (image)
/**
 *  圆形剪切图片
 *
 *  @param borderW   圆环宽度
 *  @param color     圆环颜色
 *  @param imageName 图片名称
 *
 *  @return 剪切好的图片
 */

+(UIImage *)drawImageWithBroderW:(int)borderW color:(UIColor *)color imageName:(NSString *)imageName;
@end
