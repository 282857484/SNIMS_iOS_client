//
//  JZDataHandle.m
//  Queenircle
//
//  Created by 杨珺舟 on 15-4-4.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZDataHandle.h"

#define TEXTPORT 12345
#define NETADDRESS @"123.57.73.248"
//#define NETADDRESS @"192.168.0.140"

@implementation JZDataHandle

//@synthesize mysock;
@synthesize isOnline;
@synthesize NetworkingDic;
@synthesize netUnit;
@synthesize JZDatadelegate;

- (void)initNetworkingDic{
    NetworkingDic = [NSMutableDictionary dictionaryWithCapacity:25];
}
- (NSMutableDictionary *)getNetworkingDic{
    return NetworkingDic;
}

+ (JZDataHandle*)initdatahandle
{
    JZDataHandle* handle = [[JZDataHandle alloc]init];
    [handle initNetworkingDic];
    return handle;

}


- (void)sendString:(NSString*)sStr time:(NSString*)bTime protocol:(int)p label:(NSString*)cLabel
{
    // status = 1;tag = build;p = set;socket = instance;sendstring = instance;
    netUnit = [[NetUnit alloc] init];
    AsyncSocket * mysock = [[AsyncSocket alloc] initWithDelegate:self];
    //    NSString * StringToSend = [NSString stringWithFormat:@"[{\"BillID\":\"0\",\"PageIndex\":\"0\",\"PageSize\":\"10\",\"SearchUpUserID\":\"0\",\"SearchUserID\":\"21\",\"UploadTime\":\"201501032335700\",\"UserID\":\"21\",\"p\":1015}]"];
    //    netUnit->sendString = StringToSend;
    netUnit->sendString = sStr;
    netUnit->status = 1;
    netUnit->tag = random();// 由一个全局变量自动生成
    netUnit->p = p; // 信息类协议号
    netUnit->lasttime = [NSString stringWithFormat:@"%ld",random()];
    netUnit->sock = mysock;
    netUnit->cLabel = cLabel;
    //    [netUnit OUTPUTTOSEE:1];
    
    [[self getNetworkingDic] setObject:netUnit forKey:[NSString stringWithFormat:@"%ld", netUnit->tag]];

    NSError * error = nil;
    int port = TEXTPORT;
    NSString * host = NETADDRESS;
    //    NSString * host = @"121.40.123.240";
    // 调用connectToHost:onPort:error:方法连接指定IP端口的服务器
    [netUnit->sock connectToHost:host onPort:port withTimeout:2000 error:&error];
}
- (void)sendObject:(NSDictionary*)sObj time:(NSString*)bTime protocol:(int)p label:(NSString*)cLabel{
    // status = 1;tag = build;p = set;socket = instance;sendstring = instance;
    netUnit = [[NetUnit alloc] init];
    AsyncSocket * mysock = [[AsyncSocket alloc] initWithDelegate:self];
    NSString * sStr;
    NSArray *array = [ NSArray arrayWithObjects:sObj, nil];
    if ([NSJSONSerialization isValidJSONObject:array]) {
        NSData* data=[NSJSONSerialization dataWithJSONObject:array options:0 error:nil];
        sStr = [[NSString alloc ] initWithData:data encoding:NSUTF8StringEncoding];
    } else {
        NSLog(@"传入信息类字典错误",nil);
        return;
    }
    if (!sStr) {
        NSLog(@"传入信息类字典为空",nil);
        return;
    }
    
    netUnit->sendString = sStr;
    netUnit->status = 1;
    netUnit->tag = random();// 由一个全局变量自动生成
    netUnit->p = p; // 信息类协议号
    netUnit->lasttime = [NSString stringWithFormat:@"%ld",random()];
    netUnit->sock = mysock;
    netUnit->cLabel = cLabel;
    //    [netUnit OUTPUTTOSEE:1];
    
    [[self getNetworkingDic] setObject:netUnit forKey:[NSString stringWithFormat:@"%ld", netUnit->tag]];
    
    
    NSError * error = nil;
    int port = TEXTPORT;
    NSString * host = NETADDRESS;
    //    NSString * host = @"121.40.123.240";
    // 调用connectToHost:onPort:error:方法连接指定IP端口的服务器
    [mysock connectToHost:host onPort:port withTimeout:5000 error:&error];
}


// AsyncSocketDelegate中定义的方法，当成功连接到服务器时激发改方法
- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port
{
    isOnline = YES;
    
    if(isOnline)
    {
        
        
        //快速枚举遍历所有KEY的值
        NetUnit *nu = nil;
        for (NSString *object in [[self getNetworkingDic] allKeys]) {
            nu = [[self getNetworkingDic] objectForKey:object];
            //            [nu OUTPUTTOSEE:1];
            if (nu->status == 1) {
                break;
            }
            //            NSLog(@"遍历KEY的值: %@",object);
            //            [object OUTPUTTOSEE:1];
            //            if (object->status == 1) {
            //                nu = object;
            //                break;
            //            }
        }
        if (!nu) {
            return;
        }
        if(!(nu->status == 1))
        {
            return;
        }
        
        nu->status = 2;
        
        
        //        NSData * data = [StringToSend dataUsingEncoding:NSUTF8StringEncoding];
        NSString * StringToSend = nu->sendString;
        NSData * data = [StringToSend dataUsingEncoding:NSUTF8StringEncoding];
        long myTag = nu->tag;
        // 写出数据
        [sock writeData:data withTimeout:5000 tag:myTag];
        nu->status = 3;
        // 读取数据
        [sock readDataWithTimeout:15000 tag:myTag];
    }
    else
    {
        NSLog(@"暂未连接服务器");
    }
}

- (void)onSocket:(AsyncSocket *) sock didReadData:(NSData *)data withTag:(long)tag
{
    
    NSLog(@"%ld",tag);
    NetUnit *object = [[self getNetworkingDic] objectForKey:[NSString stringWithFormat:@"%ld",tag]];
    if (!object) {
        NSLog(@"netUnit nil?", nil);
        return;
    }
    if (object->status < 5) {
        object->status = 4;
    } else {
        NSLog(@"status error", nil);
        return;
    }
    
    // 获取读到的内容
    NSData * strData = [data subdataWithRange:NSMakeRange(0, [data length])];
    NSString * content = [[NSString alloc] initWithData:strData encoding:NSUTF8StringEncoding];
    if (content) {
        NSLog(@"收到数据",nil);
        
        // 结尾标识 “FUCKBITCHEVERYDAY”
        NSString * b = [content substringFromIndex:content.length-17];
        NSString * c = [content substringToIndex:content.length-17];
        
        if ([b isEqualToString:@"FUCKBITCHEVERYDAY"]) {
            //            [self addReceiveString:c];
            object->count = object->count + 1;
            object->receiveString = [object->receiveString stringByAppendingString:c];
            object->status = 5;
            NSLog(@"拼接成功",nil);
            if (JZDatadelegate != nil) {
                [JZDatadelegate dealLabel:object ];
            }else{
                NSLog(@"this delegate is nil ...",nil);
            }
            
            [[self getNetworkingDic] removeObjectForKey:[NSString stringWithFormat:@"%ld",object->tag]];
//            [sock disconnect];
            NSLog(@"complete...",nil);
        }
        else
        {
            // 将c进行保存
            object->count = object->count + 1;
            object->receiveString = [object->receiveString stringByAppendingString:content];
            [sock readDataWithTimeout:10000 tag:tag];
            NSLog(@"进行拼接",nil);
        }
    }
}
@end
