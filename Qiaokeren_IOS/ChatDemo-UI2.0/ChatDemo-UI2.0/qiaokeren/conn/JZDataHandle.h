//
//  JZDataHandle.h
//  Queenircle
//
//  Created by 杨珺舟 on 15-4-4.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AsyncSocket.h"
#import "NetUnit.h"

// 定义一个协议，用作回调传递函数
@protocol JZDataHandleDelegate <NSObject>
@required
- (void)dealLabel:(NetUnit*)nUnit;
@end

// 全局数据
@interface JZDataHandle : NSObject{

    BOOL isOnline;
    NSMutableDictionary * NetworkingDic;
    NetUnit *netUnit;

}

// 数据接口...
@property BOOL isOnline;
@property (nonatomic, retain) NSMutableDictionary * NetworkingDic;
@property (nonatomic, retain)NetUnit *netUnit;
// 某个实现此接口的类
//@property(assign,nonatomic)id<JZDataHandleDelegate>JZDatadelegate;
@property (weak, nonatomic)id<JZDataHandleDelegate>JZDatadelegate;
+ (JZDataHandle*)initdatahandle;
// 处理接收到的信息
- (void)sendString:(NSString*)sStr time:(NSString*)bTime protocol:(int)p label:(NSString*)cLabel;
- (void)sendObject:(NSDictionary*)sObj time:(NSString*)bTime protocol:(int)p label:(NSString*)cLabel;
//- (void)dealLabel:(NetUnit*)nUnit;
- (void)initNetworkingDic;
- (NSMutableDictionary *)getNetworkingDic;


@end
