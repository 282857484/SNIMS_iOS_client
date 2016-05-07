//
//  FMClassIntroduceCellTableViewCell.h
//  ChatDemo-UI2.0
//
//  Created by apple on 15/7/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LessInfoSelectData.h"


@interface FMClassIntroduceCellTableViewCell : UITableViewCell
#pragma mark 微博对象
@property (nonatomic ,strong) LessInfoSelectData * lessonSimepleIntroduceInfo;

#pragma mark 单元格高度
@property (nonatomic ,assign) CGFloat height;

- (void)setlessonSimepleIntroduceInfo:(LessInfoSelectData *)lessonInfo;
@end
