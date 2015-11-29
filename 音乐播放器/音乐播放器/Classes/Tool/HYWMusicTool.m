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
     ///音乐数组
   static NSArray *_musics;
    ///当前正在播放的音乐
  static Musics *_currentMusic;

+(void)initialize{
    _musics = [Musics objectArrayWithFilename:@"Musics.plist"];
    
}
///返回音乐数组
+ (NSArray *)musics{
    return _musics;
}
///设置当前正在播放的音乐
+ (void)setCurrentPlayMusic:(Musics *)music{
    _currentMusic = music;
}
///获取播放的音乐
+ (Musics *)getCurrentPlayMusic{
    return _currentMusic;
}

/// 获得下一首音乐
+ (Musics *)getNextMusic{
    // 2.获取下一首音乐
    // 2.1.获取当前音乐的索引
     NSInteger currentIndex = [_musics indexOfObject:_currentMusic ];
     // 2.2. 索引加1 获取下一首音乐的索引
     currentIndex ++;
     // 2.3.判断是否越界
    if (currentIndex > _musics.count-1) {
        currentIndex = 0;
    }
    //2.4.获取下一首要播放的音乐
    Musics *nextMusic = _musics[currentIndex];
    //2.5.调整当前音乐的指针
    _currentMusic = nextMusic;
     //返回下一首音乐
    return nextMusic;
    
    
}
/// 获得上一首音乐
+ (Musics *)getPreviousMusic{
    // 2.获取上一首音乐
    // 2.1.获取当前音乐的索引
    NSInteger currentIndex = [_musics indexOfObject:_currentMusic ];
    // 2.2. 索引加1 获取下一首音乐的索引
    currentIndex --;
    // 2.3.判断是否越界
    if (currentIndex < 0) {
        currentIndex = _musics.count-1;
    }
    //2.4.获取上一首要播放的音乐
    Musics *previousMusic = _musics[currentIndex];
    //2.5.调整当前音乐的指针
    _currentMusic = previousMusic;
    //返回上一首音乐
    return previousMusic;
    
}
@end
