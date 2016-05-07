//
//  GetMessageProtocol.h
//  ChatDemo-UI2.0
//
//  Created by apple on 15/7/11.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GetInRecordModel <NSObject>

@required
// 在录音模式下将声音录制到
+(void) getVoiceMessage:(EMChatVoice *) voiceMessage isGroup:(BOOL)isgroup isError:(BOOL)iserror isMaster:(BOOL)ismaster Model:(int)model infoDelegate:(id)thisDelegate BuildTime:(NSString*)buildTime;

@optional
+(void) getVoiceMessage:(EMChatVoice *) voiceMessage isGroup:(BOOL)isgroup isError:(BOOL)iserror isMaster:(BOOL)ismaster Model:(int)model;
+(void) gettextMessage:(NSString *)textMessage isGroup:(BOOL)isgroup isError:(BOOL)iserror isMaster:(BOOL)ismaster Model:(int)model;
+(void) getImageMessage:(UIImage *) imageMessage isGroup:(BOOL)isgroup isError:(BOOL)iserror isMaster:(BOOL)ismaster Model:(int)model;
+(void) getVedioMessage:(EMChatVideo *)video isGroup:(BOOL)isgroup isError:(BOOL)iserror isMaster:(BOOL)ismaster Model:(int)model;

@end

@interface GetMessageProtocol : NSObject<GetInRecordModel>
+(void) getVoiceMessage:(EMChatVoice *) voiceMessage isGroup:(BOOL)isgroup isError:(BOOL)iserror isMaster:(BOOL)ismaster Model:(int)model infoDelegate:(id)thisDelegate BuildTime:(NSString*)buildTime;
+(void) getVoiceMessage:(EMChatVoice *) voiceMessage isGroup:(BOOL)isgroup isError:(BOOL)iserror isMaster:(BOOL)ismaster Model:(int)model;
+(void) gettextMessage:(NSString *)textMessage isGroup:(BOOL)isgroup isError:(BOOL)iserror isMaster:(BOOL)ismaster Model:(int)model;
+(void) getImageMessage:(UIImage *) imageMessage isGroup:(BOOL)isgroup isError:(BOOL)iserror isMaster:(BOOL)ismaster Model:(int)model;
+(void) getVedioMessage:(EMChatVideo *)video isGroup:(BOOL)isgroup isError:(BOOL)iserror isMaster:(BOOL)ismaster Model:(int)model;
@end
