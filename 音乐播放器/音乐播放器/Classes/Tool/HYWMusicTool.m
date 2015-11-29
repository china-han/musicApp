//
//  HYWMusicTool.m
//  音乐播放器
//
//  Created by mac on 15/11/28.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "HYWMusicTool.h"
#import "MJExtension.h"
#import "Musics.h"
@implementation HYWMusicTool
   static NSArray *_musics;
+(void)initialize{
    _musics = [Musics objectArrayWithFilename:@"Musics.plist"];
    
}
+ (NSArray *)musics{
    return _musics;
}
@end
