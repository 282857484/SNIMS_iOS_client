//
//  FMLessonContentOtherStyleCellTableViewCell.h
//  ChatDemo-UI2.0
//
//  Created by apple on 15/7/17.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LessonContentSelectData.h"

@interface FMLessonContentOtherStyleCellTableViewCell : UITableViewCell
#pragma mark 微博对象
@property (nonatomic ,strong) LessonContentSelectData * lessonContentInfo;

#pragma mark 单元格高度
@property (nonatomic ,assign) CGFloat height;

//- (void)setlessonContentInfo:(LessonContentSelectData *)lessonInfo;

- (void) loadView;
// 此cell中的声音暂停
- (void)_actionPause;
- (void) trackStop;
- (void) cellClick;
@end
