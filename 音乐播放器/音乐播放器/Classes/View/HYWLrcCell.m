//
//  HYWLrcCell.m
//  音乐播放器
//
//  Created by mac on 15/11/28.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "HYWLrcCell.h"
#import "Musics.h"
@implementation HYWLrcCell


#pragma mark - 接受数据，设置控件
-(void)setMusic:(Musics *)music{
    _music = music;
    self.textLabel.text = music.name;
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
