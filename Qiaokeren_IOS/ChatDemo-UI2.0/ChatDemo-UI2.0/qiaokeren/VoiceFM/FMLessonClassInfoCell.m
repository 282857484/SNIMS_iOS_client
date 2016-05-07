//
//  FMLessonClassInfoCell.m
//  ChatDemo-UI2.0
//
//  Created by apple on 15/7/17.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "FMLessonClassInfoCell.h"
#import "QiaokerenApplication.h"
#import "UIImageView+DispatchLoad.h"

@implementation FMLessonClassInfoCell
@synthesize touxiangImageView;
@synthesize topicLabel;
@synthesize usernameLabel;
@synthesize classLevel;
@synthesize suitLabel;
@synthesize userlevelLabel;
@synthesize typeLabel;
@synthesize introduceLabel;
@synthesize placeLabel;
@synthesize lessonSimepleIntroduceInfo;
@synthesize height;

-(void) loadView{
    // 加载头像
//    touxiangImageView.view = [UIImage imageNamed:@"defaultuserhaed.png"];
//    touxiangImageView = [touxiangImageView initWithImage:[UIImage imageNamed:@"defaultuserhaed.png"]];
    [touxiangImageView setImageFromUrl:[QiaokerenApplication getTouXiangUrlUserID:[lessonSimepleIntroduceInfo userid]]
                             completion:^(void) {}];
    [topicLabel setText:[lessonSimepleIntroduceInfo topic]];
    [topicLabel setFont:[UIFont systemFontOfSize:16.0]];
    [topicLabel setTextColor:[UIColor colorWithWhite:0.4 alpha:1.0]];
    [topicLabel setTextAlignment:NSTextAlignmentCenter];
    [topicLabel setLineBreakMode:NSLineBreakByTruncatingTail];
    [usernameLabel setText:[lessonSimepleIntroduceInfo username]];
    [usernameLabel setFont:[UIFont systemFontOfSize:16.0]];
    [usernameLabel setTextColor:[UIColor colorWithWhite:0.4 alpha:1.0]];
    [usernameLabel setTextAlignment:NSTextAlignmentCenter];
    [usernameLabel setLineBreakMode:NSLineBreakByTruncatingTail];
    [classLevel setText:[lessonSimepleIntroduceInfo classlevel]];
    [classLevel setFont:[UIFont systemFontOfSize:16.0]];
    [classLevel setTextColor:[UIColor colorWithWhite:0.4 alpha:1.0]];
    [classLevel setTextAlignment:NSTextAlignmentCenter];
    [classLevel setLineBreakMode:NSLineBreakByTruncatingTail];
    [suitLabel setText:[lessonSimepleIntroduceInfo suit]];
    [suitLabel setFont:[UIFont systemFontOfSize:16.0]];
    [suitLabel setTextColor:[UIColor colorWithWhite:0.4 alpha:1.0]];
    [suitLabel setTextAlignment:NSTextAlignmentCenter];
    [suitLabel setLineBreakMode:NSLineBreakByTruncatingTail];
    [userlevelLabel setText:[lessonSimepleIntroduceInfo userlevel]];
    [userlevelLabel setFont:[UIFont systemFontOfSize:16.0]];
    [userlevelLabel setTextColor:[UIColor colorWithWhite:0.4 alpha:1.0]];
    [userlevelLabel setTextAlignment:NSTextAlignmentCenter];
    [userlevelLabel setLineBreakMode:NSLineBreakByTruncatingTail];
    [typeLabel setText:[lessonSimepleIntroduceInfo type]];
    [typeLabel setFont:[UIFont systemFontOfSize:16.0]];
    [typeLabel setTextColor:[UIColor colorWithWhite:0.4 alpha:1.0]];
    [typeLabel setTextAlignment:NSTextAlignmentCenter];
    [typeLabel setLineBreakMode:NSLineBreakByTruncatingTail];
    [introduceLabel setText:[lessonSimepleIntroduceInfo introduce]];
    [introduceLabel setFont:[UIFont systemFontOfSize:16.0]];
    [introduceLabel setTextColor:[UIColor colorWithWhite:0.4 alpha:1.0]];
    [introduceLabel setTextAlignment:NSTextAlignmentCenter];
    [introduceLabel setLineBreakMode:NSLineBreakByTruncatingTail];
    [placeLabel setText:[lessonSimepleIntroduceInfo place]];
    [placeLabel setFont:[UIFont systemFontOfSize:16.0]];
    [placeLabel setTextColor:[UIColor colorWithWhite:0.4 alpha:1.0]];
    [placeLabel setTextAlignment:NSTextAlignmentCenter];
    [placeLabel setLineBreakMode:NSLineBreakByTruncatingTail];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
