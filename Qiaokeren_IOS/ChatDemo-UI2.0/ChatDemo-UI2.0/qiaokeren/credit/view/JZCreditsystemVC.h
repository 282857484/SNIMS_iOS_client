//
//  JZCreditsystemVC.h
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-17.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import <UIKit/UIKit.h>
//typedef void (^monthAndYear)(NSString* month,NSString* Year);
@interface JZCreditsystemVC : UIViewController<UITableViewDataSource,UITableViewDelegate>

//-(void)getMonthYear:(monthAndYear)monthYearblock;
+ (JZCreditsystemVC *)sharedActivityView;
@end
