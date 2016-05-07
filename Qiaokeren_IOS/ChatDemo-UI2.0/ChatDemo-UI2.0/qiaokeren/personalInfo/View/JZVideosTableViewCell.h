//
//  JZVideosTableViewCell.h
//  Text01
//
//  Created by 杨珺舟 on 15-1-29.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VedioSelectData.h"

@interface JZVideosTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property(nonatomic,strong)VedioSelectData* vedioInfo;
-(void)setvideos:(VedioSelectData *)videoInfo;

@end
