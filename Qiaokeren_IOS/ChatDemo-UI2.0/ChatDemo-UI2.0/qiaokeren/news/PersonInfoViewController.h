//
//  PersonInfoViewController.h
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-7-19.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonInfoViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

-(void)setPersonUserId:(NSString*)userid;
@end
