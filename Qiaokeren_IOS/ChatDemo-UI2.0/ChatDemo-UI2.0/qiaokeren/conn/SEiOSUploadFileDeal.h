//
//  SEiOSUploadFileDeal.h
//  ChatDemo-UI2.0
//
//  Created by apple on 15/7/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//
#import <Foundation/Foundation.h>

@protocol iOSUploadFileCallBack <NSObject>
@required
- (void) uploadFileCallBack:(NSString*)sendMessage;

@end

@interface SEiOSUploadFileDeal : NSObject
//(UIImage *)image-CGFloat compressionQuality-NSURL* url-NSString *filePath
//- (void) sendImage:(UIImage *)hbImage compressionQuality:(CGFloat)compressQuality sendURL:(NSURL*)hburl;
- (void) saveFilePath:(NSString*)thisFilePath sendURL:(NSURL*)hburl postKeyValue:(NSDictionary*)keyValue;
- (void) sendImage:(UIImage *)hbImage compressionQuality:(CGFloat)compressQuality sendURL:(NSURL*)hburl saveFilePath:(NSString*)thisFilePath postKeyValue:(NSDictionary*)keyValue;
//- (void) sendImageFilePath:(UIImage *)hbImagePath compressionQuality:(CGFloat)compressQuality sendURL:(NSURL *)hburl;

@property (nonatomic, weak) id<iOSUploadFileCallBack> resultDelegate;
@end
