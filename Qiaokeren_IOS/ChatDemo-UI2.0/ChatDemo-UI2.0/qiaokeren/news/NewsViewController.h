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
#import "AsyncSocket.h"
#import "NetUnit.h"
#import "JZDataHandle.h"
#define kTitleValueNewsTag 31
#define kImageValueNewsTag 32
#define kDescribeValueNewsTag 33
@interface NewsViewController : UIViewController<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,JZDataHandleDelegate>
{
    NSArray *computers;
    UITableViewCell *tvcell;
    NSMutableArray *data;
    NSMutableArray *dataHotNews;
@public
//    JZDataHandle * jzDataHandle;
    
}
//@property (nonatomic, strong)JZDataHandle * jzDataHandle;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (atomic, strong)NSMutableArray *data;
@property (atomic, strong)NSMutableArray *dataHotNews;
@property (strong,nonatomic)UIScrollView *scrollView;
@property (strong,nonatomic)NSMutableArray *slideImages;
@property (strong,nonatomic)UIPageControl *pageControl;
@property (strong, nonatomic)UITextField *text;

// 处理接收到的信息
- (void)dealLabel:(NetUnit*)nUnit;
@property (nonatomic,retain) NSArray *computers;
@property (nonatomic,retain) IBOutlet UITableViewCell *tvCell;

@end
