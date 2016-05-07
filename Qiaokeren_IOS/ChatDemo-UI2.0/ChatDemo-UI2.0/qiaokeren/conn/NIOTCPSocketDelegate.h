//
//  NIOTCPSocketDelegate.h
//  ChatDemo-UI2.0
//
//  Created by apple on 15/7/3.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NIOTCPSocketDelegate <NSObject>

@required
// 发送的字符串；发送时间；协议号；用户标签（可选，记录你们的行为）
- (void)sendString:(NSString*)sStr time:(NSString*)bTime protocol:(int)p label:(NSString*)cLabel;
- (void)sendObject:(NSDictionary*)sObj time:(NSString*)bTime protocol:(int)p label:(NSString*)cLabel;
- (void)sendData:(NSData*)sData fileName:(NSString*)fName fileLength:(long)fLen fileType:(int)fType time:(NSString*)bTime protocol:(int)p label:(NSString*)cLabel;


@end
