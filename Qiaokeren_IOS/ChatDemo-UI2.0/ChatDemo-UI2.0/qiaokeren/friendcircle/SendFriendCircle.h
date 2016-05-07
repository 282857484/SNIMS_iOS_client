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
#define kFriendsContentValueTag 41
#define kFriendsImage1ValueTag 42
#define kFriendsImage2ValueTag 43
#define kFriendsImage3ValueTag 44
@interface SendFriendCircle : UIViewController<UITableViewDataSource,UITableViewDelegate,JZDataHandleDelegate>
{
    UITableViewCell *tvcell;
    NSMutableArray *data;
    NSString* sharephoto1;
@public
//    JZDataHandle * jzDataHandle;
    
}
//@property (nonatomic, strong)JZDataHandle * jzDataHandle;
@property (atomic, copy)NSString* sharephoto1;
// 处理接收到的信息
- (void)dealLabel:(NetUnit*)nUnit;

@property (atomic, strong)NSMutableArray *data;
@property (nonatomic,retain) IBOutlet UITableViewCell *tvCell;
@property (strong, nonatomic) IBOutlet UITableView *tableview;

@end
