//
//  FMLessonClassInfoCell.h
//  ChatDemo-UI2.0
//
//  Created by apple on 15/7/17.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LessInfoSelectData.h"

@interface FMLessonClassInfoCell : UITableViewCell
#pragma mark 微博对象
@property (nonatomic ,strong) LessInfoSelectData * lessonSimepleIntroduceInfo;

#pragma mark 单元格高度
@property (nonatomic ,assign) CGFloat height;

//- (void)setlessonSimepleIntroduceInfo:(LessInfoSelectData *)lessonInfo;
@property (weak, nonatomic) IBOutlet UIImageView *touxiangImageView;
@property (weak, nonatomic) IBOutlet UILabel *topicLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *classLevel;
@property (weak, nonatomic) IBOutlet UILabel *suitLabel;
@property (weak, nonatomic) IBOutlet UILabel *userlevelLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *introduceLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;

-(void) loadView;
@end
