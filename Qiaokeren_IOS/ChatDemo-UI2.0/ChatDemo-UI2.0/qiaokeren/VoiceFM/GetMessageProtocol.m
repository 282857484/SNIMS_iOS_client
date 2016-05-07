//
//  GetMessageProtocol.m
//  ChatDemo-UI2.0
//
//  Created by apple on 15/7/11.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "GetMessageProtocol.h"
#import "QiaokerenApplication.h"
#import "UtilsAll.h"
#import "SEiOSUploadFileDeal.h"

@implementation GetMessageProtocol

+(void) getVoiceMessage:(EMChatVoice *) voiceMessage isGroup:(BOOL)isgroup isError:(BOOL)iserror isMaster:(BOOL)ismaster Model:(int)model infoDelegate:(id)thisDelegate BuildTime:(NSString*)buildTime{
    NSLog(@"displayName:%@;\nlocalPath:%@;\nfileLength:%lld;\nduration:%ld\n",[voiceMessage displayName] ,[voiceMessage localPath],[voiceMessage fileLength],(long)[voiceMessage duration]);
    //获取Documents文件夹目录
    NSMutableDictionary * dic =[[NSMutableDictionary alloc]init];
    NSString * voiceFileName = [NSString stringWithFormat:@"%@_%@",[[QiaokerenApplication getUserSelectData]quserid],buildTime];
    [dic setValue:voiceFileName forKey:[QiaokerenApplication GetAudioname]];
    SEiOSUploadFileDeal *uploadHandler = [[SEiOSUploadFileDeal alloc] init];
    uploadHandler.resultDelegate = thisDelegate;
    [uploadHandler saveFilePath:[voiceMessage localPath] sendURL:[NSURL URLWithString:[QiaokerenApplication getUploadAudioJiaoxueUrl]] postKeyValue:dic];
}

+(void) getVoiceMessage:(EMChatVoice *) voiceMessage isGroup:(BOOL)isgroup isError:(BOOL)iserror isMaster:(BOOL)ismaster Model:(int)model{}
+(void) gettextMessage:(NSString *)textMessage isGroup:(BOOL)isgroup isError:(BOOL)iserror isMaster:(BOOL)ismaster Model:(int)model{}
+(void) getImageMessage:(UIImage *) imageMessage isGroup:(BOOL)isgroup isError:(BOOL)iserror isMaster:(BOOL)ismaster Model:(int)model{}
+(void) getVedioMessage:(EMChatVideo *)video isGroup:(BOOL)isgroup isError:(BOOL)iserror isMaster:(BOOL)ismaster Model:(int)model{}


@end
