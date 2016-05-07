//
//  ViewController.h
//  TestIOS
//
//  Created by lenbol on 13-6-5.
//  Copyright (c) 2013年 lenbol. All rights reserved.
//

//修改ViewController.h文件
#import <UIKit/UIKit.h>
#import "ConnectTestViewController.h"
#import "JZDataHandle.h"
#define kImageDownValueTag 11
#define kAmountDownValueTag 12
#define kTimeDownValueTag 13
#define kPerPriceDownValueTag 14
#define kResourceDownValueTag 15
#define kActionDownValueTag 16
@interface MyDownOrderViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,JZDataHandleDelegate>
{
    UITableViewCell *tvcell;
    NSMutableArray *data;
@public
//    JZDataHandle * jzDataHandle;
    
}
//@property (nonatomic, strong)JZDataHandle * jzDataHandle;

// 处理接收到的信息
- (void)dealLabel:(NetUnit*)nUnit;
@property (nonatomic,retain) IBOutlet UITableViewCell *tvCell;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (atomic, strong)NSMutableArray *data;
@end
