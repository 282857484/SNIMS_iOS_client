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
#define kImageValueTag 1
#define kAmountValueTag 2
#define kTimeValueTag 3
#define kPerPriceValueTag 4
#define kResourceValueTag 5
#define kActionValueTag 6
@interface MyUpOrderViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,JZDataHandleDelegate>
{
    UITableViewCell *tvcell;
    NSMutableArray *data;
@public

//    JZDataHandle * jzDataHandle;
    
}
//@property (nonatomic, strong)JZDataHandle * jzDataHandle;
// 处理接收到的信息
- (void)dealLabel:(NetUnit*)nUnit;

@property (nonatomic,strong) NSArray *computers;
@property (nonatomic, strong)NSMutableArray *data;
@property (nonatomic,retain) IBOutlet UITableViewCell *tvCell;
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end
