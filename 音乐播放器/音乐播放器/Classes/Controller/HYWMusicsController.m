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
@interface HYWMusicsController () 
@end

@implementation HYWMusicsController
- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
   return [HYWMusicTool musics].count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 创建cell
    static  NSString *ID = @"cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    //取数据
    Musics *music = [HYWMusicTool musics][indexPath.row];
    // 设置cell
    cell.textLabel.text = music.name;
    cell.backgroundColor = [UIColor yellowColor];
    //返回cell
    return cell;
}



@end
