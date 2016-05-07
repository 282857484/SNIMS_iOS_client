//
//  QiaokerenApplication.h
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-26.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserSeletData.h"
@interface QiaokerenApplication : NSObject

+(int) getAccountType;
+(void)setAccountNumber:(NSString*)value;
+(NSString*)getAccountNumber;
+(void)setUserSelectData:(UserSeletData*)user;
+(UserSeletData*)getUserSelectData;
+(NSString*)getConnectionPort;
+(NSString*)getConnectionUploasImagePort;
+(void)setGoodsArray:(NSMutableArray*)goods;
+(NSMutableArray*)getGoodsArray;
//+(NSString*)getTouXiangUrl:(NSString *)UserId;
//+(NSString*)getUploadPhotoUrl;


//+ (NSString*)getUploadPhotoUrl;

+ (NSString*) getAppDownloadURL;
+ (NSString*) getDownloadResourceURL;
+ (NSString*) getImageTouXiangURL;
+ (NSString*) getTouxiang;
+ (NSString*) getImageViewImageURL;
+ (NSString*) getImageChanPinURL;
+ (NSString*) getImageShipinURL;
+ (NSString*) getImagePengYouQuanURL;
+ (NSString*) getVedioJiaoxueURL;
+ (NSString*) getAudioTheClassURL;
+ (NSString*) GetAudioname;
+ (NSString*) getBillCutURL;
+ (NSString*) getBillCut;

+ (NSString*) getUploadtouxiangPhotoUrl;
+ (NSString*) getUploadAudioJiaoxueUrl;
+ (NSString*) getUploadBillCutUrl;

+ (NSString*)getTouXiangUrlUserID:(NSString *)UserId;
+ (NSString*)getAudioJiaoXueUrlUserID:(NSString *)UserId TimeStamp:(NSString*)timestamp;
+ (NSString*)getBillCutUrlBillID:(NSString *)billId;
@end
