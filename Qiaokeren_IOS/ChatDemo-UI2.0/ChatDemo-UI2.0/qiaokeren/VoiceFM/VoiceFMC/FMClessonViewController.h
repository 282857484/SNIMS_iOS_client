//
//  FMClessonViewController.h
//  ChatDemo-UI2.0
//
//  Created by apple on 15/7/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JZDataHandle.h"

@interface FMClessonViewController : UIViewController<UITableViewDataSource,UITableViewDelegate, JZDataHandleDelegate>{
    UITableViewCell *tvcell;
    NSMutableArray *lessondata;
}
@property (strong, nonatomic) IBOutlet UITableViewCell *tvcell;
@property (nonatomic, strong)NSMutableArray *lessondata;

@end
