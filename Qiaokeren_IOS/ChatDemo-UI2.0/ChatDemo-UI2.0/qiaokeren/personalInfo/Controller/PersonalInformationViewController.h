//
//  SecondViewController.h
//  Text01
//
//  Created by 杨珺舟 on 15-1-19.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConnectTestViewController.h"
@interface PersonalInformationViewController :UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
+(NSString*)titleLablecontents;
+(void) settitleLablecontents: (NSString*)newtitleLablecontents;
+(long)countContents;
+(void) setCountContents: (long)newCountContents;
+(id) instance1;
+(NSString*)detailTextLabelcontents;
+(void) setdetailTextLabelcontents:(NSString *)newdetailTextLabelcontents;
@property(nonatomic,strong)NSString *imagePath;
@end


