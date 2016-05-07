//
//  JZVideosTableViewCell.m
//  Text01
//
//  Created by 杨珺舟 on 15-1-29.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZVideosTableViewCell.h"
#import "UIImageView+DispatchLoad.h"

@implementation JZVideosTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setvideos:(VedioSelectData *)videoInfo{
     NSLog(@"%@",@"cell里执行了");
    self.title.text = videoInfo.vediointro;
//    [self.image setImage:[UIImage imageNamed:videoInfo.vediotype]];
    //[self.image setImage:[UIImage imageNamed:@"1.jpg"]];
//    self.title.text= @"hhahahhh";
    [self.image setImageFromUrl:videoInfo.vediotype
                  completion:^(void) {}];
}

@end
