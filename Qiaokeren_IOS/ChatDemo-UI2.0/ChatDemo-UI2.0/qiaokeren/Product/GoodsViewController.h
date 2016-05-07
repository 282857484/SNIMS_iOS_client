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
#define kTitleValueGoodsTag 21
#define kImageValueGoodsTag 22
#define kDescribeValueGoodsTag 23
@interface GoodsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,JZDataHandleDelegate>
{
    NSArray *computers;
    UITableViewCell *tvcell;
    NSMutableArray *data;
@public

//    JZDataHandle * jzDataHandle;
    
}
//@property (nonatomic, strong)JZDataHandle * jzDataHandle;
@property (nonatomic,retain) NSArray *computers;
@property (nonatomic,retain) IBOutlet UITableViewCell *tvCell;
@property (atomic, strong)NSMutableArray *data;

@property (weak, nonatomic) IBOutlet UITableView *tableview;

// 处理接收到的信息
- (void)dealLabel:(NetUnit*)nUnit;

@end
