//
//  HYWMusicsController.m
//  音乐播放器
//
//  Created by mac on 15/11/28.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "HYWMusicsController.h"
#import "Musics.h"
#import "HYWMusicTool.h"
#import "UIImage+image.h"
#import "HYWPlayingViewController.h"
#import "HMAudioTool.h"
@interface HYWMusicsController ()
@property (nonatomic,strong) HYWPlayingViewController *playingVC;
@end

@implementation HYWMusicsController
#pragma mark - 懒加载
-(HYWPlayingViewController *)playingVC{
    if (_playingVC == nil) {
        _playingVC = [[HYWPlayingViewController alloc]init];
        
    }
    return _playingVC;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 80;
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



#pragma mark - 数据源代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   // NSLog(@"点击");
    //获取当前要播放的音乐
    Musics *music = [HYWMusicTool musics][indexPath.row];
    //把当前要播放的音乐告诉管理类
    [HYWMusicTool setCurrentPlayMusic:music];
    [self.playingVC showWithAnimo];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
   return [HYWMusicTool musics].count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 创建cell
    static  NSString *ID = @"cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    //取数据
    Musics *music = [HYWMusicTool musics][indexPath.row];
    // 设置cell
    cell.textLabel.text = music.name;
    cell.imageView.image = [UIImage drawImageWithBroderW:3 color:[UIColor purpleColor] imageName:music.singerIcon];
    cell.detailTextLabel.text = music.singer;
    //返回cell
    return cell;
}



@end
