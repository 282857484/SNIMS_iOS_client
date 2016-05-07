//
//  FMCContentViewController.h
//  ChatDemo-UI2.0
//
//  Created by apple on 15/7/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JZDataHandle.h"
#import "LessInfoSelectData.h"

@interface FMCContentViewController : UIViewController<UITableViewDataSource,UITableViewDelegate, JZDataHandleDelegate>
    {
        UITableViewCell *contentcell;
        NSMutableArray *data;
        LessInfoSelectData * classInfo;
}
@property (strong, nonatomic) IBOutlet UITableViewCell *contentcell;
@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, strong) LessInfoSelectData * classInfo;


//// 此cell中的声音暂停
//- (void)_actionPause;
//- (void) trackStop;
//- (void) cellClick;
@end
