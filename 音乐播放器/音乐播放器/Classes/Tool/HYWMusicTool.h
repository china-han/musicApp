//
//  HYWMusicTool.h
//  音乐播放器
//
//  Created by mac on 15/11/28.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Musics;
@interface HYWMusicTool : NSObject
/// 获取所有音乐数组
+ (NSArray *)musics;
///传来当前要播放的音乐
+ (void)setCurrentPlayMusic:(Musics *)music;
///获取当前要播放的音乐
+ (Musics *)getCurrentPlayMusic;
/// 获取下一首音乐
+ (Musics *)getNextMusic;
/// 获取下一首音乐
+ (Musics *)getPreviousMusic;
@end
