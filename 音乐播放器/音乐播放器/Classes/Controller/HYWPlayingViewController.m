//
//  HYWPlayingViewController.m
//  音乐播放器
//
//  Created by mac on 15/11/28.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "HYWPlayingViewController.h"
#import "UIView+Frame.h"
#import "Musics.h"
#import "HMAudioTool.h"
#import "HYWMusicTool.h"

@interface HYWPlayingViewController ()
///记录当前播放的音乐
@property (nonatomic,strong) Musics *playMusic;
///音乐播放器
@property (nonatomic,strong) AVAudioPlayer *player;
///歌手的封面
@property (weak, nonatomic) IBOutlet UIImageView *singerIcon;
///歌曲名
@property (weak, nonatomic) IBOutlet UILabel *songLable;
/// 歌手名
@property (weak, nonatomic) IBOutlet UILabel *singerLabel;
///音乐总时长
@property (weak, nonatomic) IBOutlet UILabel *totalTimeLabel;
///拖拽按钮
@property (weak, nonatomic) IBOutlet UIButton *sliderButton;
///显示时间的lable
@property (weak, nonatomic) IBOutlet UILabel *showTimeLabel;
///播放或暂停按钮
@property (weak, nonatomic) IBOutlet UIButton *playOrPauseButton;
/// 拖拽按钮与左边的距离
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *sliderLeftConstraint;
///退出界面
- (IBAction)exit;
/// 点击进度条时更新
- (IBAction)TapProgressBackground:(UITapGestureRecognizer *)sender;
///拖拽滑块按钮时更新
- (IBAction)panSliderButton:(UIPanGestureRecognizer *)sender;


@end

@implementation HYWPlayingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 控制界面
///弹出界面
- (void)showWithAnimo {
    ///判断要播放的音乐有没有改变
    if (self.playMusic && self.playMusic != [HYWMusicTool getCurrentPlayMusic]) {
        [self stopMusic];
    }
    
     // 1.拿到window
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
          // 2.设置view的frame
      self.view.frame = window.bounds;
     // 3.将自身的view添加到window上
    [window addSubview:self.view];
     // 4.给self.view添加动画
    self.view.y = self.view.height;
    window.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.7 animations:^{
        self.view.y = 0;
    } completion:^(BOOL finished) {
        window.userInteractionEnabled = YES;
        //开始播放音乐
        [self startPlayMusic];
    }];
    
    
}
/// 退出界面
- (IBAction)exit {
    
    // 1.拿到window
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.7 animations:^{
        self.view.y = self.view.height;;
    } completion:^(BOOL finished) {
        window.userInteractionEnabled = YES;
       
    }];

    
}

#pragma mark - 对音乐的控制
///播放音乐
- (void)startPlayMusic{
    //当前要播的音乐
    Musics *music = [HYWMusicTool getCurrentPlayMusic];
    if (music == self.playMusic) {
        return;
    }
    self.playMusic = music;
    ///设置界面数据
    self.songLable.text = music.name;
    self.singerIcon.image = [UIImage imageNamed:music.icon];
    self.singerLabel.text = music.singer;
    ///播放音乐
    self.player = [HMAudioTool playMusicWithName:music.filename];
    self.totalTimeLabel.text = [self stringWithTime:self.player.duration];
}
///停止音乐
- (void)stopMusic{
    /// 1 清除界面
    self.songLable.text = nil;
    self.singerIcon.image = [UIImage imageNamed:@"play_cover_pic_bg"];
    self.singerLabel.text = nil;
    self.totalTimeLabel.text = nil;
    // 2.停止播放音乐
    [HMAudioTool stopMusicWithName:self.playMusic.filename];
    
}
#pragma mark - 手势方法
/// 点击进度条时更新
- (IBAction)TapProgressBackground:(UITapGestureRecognizer *)sender {
      // 1.获取用户点击位置
    CGPoint point = [sender locationInView:sender.view];
    // 2.改变sliderButton的约束
    if (point.x >= self.view.width - self.sliderButton.width) {
        self.sliderLeftConstraint.constant = self.view.width - self.sliderButton.width - 1;
    }else if (point.x <= self.sliderButton.width*0.5){
        self.sliderLeftConstraint.constant = 0;
        
    }else{
        
        self.sliderLeftConstraint.constant = point.x - self.sliderButton.width*0.5;
    }
    
    
    
}
///拖拽滑块按钮时更新
- (IBAction)panSliderButton:(UIPanGestureRecognizer *)sender {
}

#pragma mark - 设置时间格式
- (NSString *)stringWithTime:(NSTimeInterval )time{
    NSInteger mimute = time / 60;
    NSInteger second = (NSInteger)time % 60;
    return [NSString stringWithFormat:@"%02ld:%02ld",mimute,second];
}



@end
