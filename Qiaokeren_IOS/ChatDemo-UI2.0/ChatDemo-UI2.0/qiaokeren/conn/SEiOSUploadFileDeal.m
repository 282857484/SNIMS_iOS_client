//
//  SEiOSUploadFileDeal.m
//  ChatDemo-UI2.0
//
//  Created by apple on 15/7/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "SEiOSUploadFileDeal.h"
#import "ASIFormDataRequest.h"

@implementation SEiOSUploadFileDeal

@synthesize resultDelegate;
- (void) saveFilePath:(NSString *)thisFilePath sendURL:(NSURL *)hburl postKeyValue:(NSDictionary *)keyValue{
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:hburl];
    // 设置POST请求参数
    NSArray * keys = [keyValue allKeys];
    NSString * key = [keys objectAtIndex:0];
    NSString * val = [keyValue objectForKey:key];
    [request setPostValue:val forKey:key];
    // 设置要上传的文件
    [request setFile:thisFilePath  // 指定上传的文件
     // 指定上传文件的原始文件名
        withFileName:nil
      andContentType:nil // 指定上传文件的MIME类型
              forKey:@"uploaded"];  // 指定上传文件对应的请求参数名
    // 设置发送请求、获取服务器响应完成时激发的代码块
    __weak ASIFormDataRequest * thisrequest = request;
    [request setCompletionBlock:^{
        
        if (nil == self->resultDelegate) {
            //获取头文件
            NSDictionary *headers = [thisrequest responseHeaders];
            NSLog(@"headers : %@",headers);
            //获取http协议执行代码
            NSLog(@"statusCode : %d",[thisrequest responseStatusCode]);
            NSLog(@"responseString : %@",[thisrequest responseString]);
            NSLog(@"responseData : %@",[thisrequest responseData]);
            
            [self->resultDelegate uploadFileCallBack:@"上传成功"];
        }
        
    }];
    // 设置发送请求失败时激发该方法
    [request setFailedBlock:^{
        if (nil == self->resultDelegate) {
            NSDictionary *headers = [thisrequest responseHeaders];
            NSLog(@"headers : %@",headers);
            //获取http协议执行代码
            NSLog(@"statusCode : %d",[thisrequest responseStatusCode]);
            NSLog(@"responseString : %@",[thisrequest responseString]);
            NSLog(@"responseData : %@",[thisrequest responseData]);
            NSLog(@"statusCode : %d",[thisrequest responseStatusCode]);
            NSLog(@"error : %@",[thisrequest error]);
            [self->resultDelegate uploadFileCallBack:@"上传失败"];
        }
    }];
    // 发送异步请求
    [request startAsynchronous];
}

- (void) sendImage:(UIImage *)hbImage compressionQuality:(CGFloat)compressQuality sendURL:(NSURL *)hburl saveFilePath:(NSString *)thisFilePath postKeyValue:(NSDictionary*)keyValue{
    //以下是保存文件到沙盒路径下
    //把图片转成NSData类型的数据来保存文件
    NSData *data;
    //压缩图片
    data = UIImageJPEGRepresentation(hbImage, compressQuality);
    //        }
    //保存
    [[NSFileManager defaultManager] createFileAtPath:thisFilePath contents:data attributes:nil];
    // 获取用户选中的文件名
    //        NSString* fileName = @"userInfoHead.png";
    // 根据用户选中的文件名确定需要上传的文件
    NSString *filePath = thisFilePath;
    
    // 定义提交文件上传请求的URL
    //    NSURL* url = [NSURL URLWithString:
    //                  [QiaokerenApplication getUploadPhotoUrl]];
    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:hburl];
    // 设置POST请求参数
    NSArray * keys = [keyValue allKeys];
    NSString * key = [keys objectAtIndex:0];
    NSString * val = [keyValue objectForKey:key];
    [request setPostValue:val forKey:key];
    // 设置要上传的文件
    [request setFile:filePath  // 指定上传的文件
     // 指定上传文件的原始文件名
        withFileName:nil
      andContentType:nil // 指定上传文件的MIME类型
              forKey:@"uploaded"];  // 指定上传文件对应的请求参数名
    __weak ASIFormDataRequest * thisrequest = request;
    [request setCompletionBlock:^{
        
        if (nil != self->resultDelegate) {
            [self->resultDelegate uploadFileCallBack:@"上传成功"];
            //获取头文件
            NSDictionary *headers = [thisrequest responseHeaders];
            NSLog(@"headers : %@",headers);
            //获取http协议执行代码
            NSLog(@"statusCode : %d",[thisrequest responseStatusCode]);
            NSLog(@"responseString : %@",[thisrequest responseString]);
            NSLog(@"responseData : %@",[thisrequest responseData]);
            
            
        }
        
    }];
    // 设置发送请求失败时激发该方法
    [request setFailedBlock:^{
        if (nil != self->resultDelegate) {
            [self->resultDelegate uploadFileCallBack:@"上传失败"];
            NSDictionary *headers = [thisrequest responseHeaders];
            NSLog(@"headers : %@",headers);
            //获取http协议执行代码
            NSLog(@"statusCode : %d",[thisrequest responseStatusCode]);
            NSLog(@"responseString : %@",[thisrequest responseString]);
            NSLog(@"responseData : %@",[thisrequest responseData]);
            NSLog(@"statusCode : %d",[thisrequest responseStatusCode]);
            NSLog(@"error : %@",[thisrequest error]);
            
        }
    }];
    // 发送异步请求
    [request startAsynchronous];
}

- (void) sendImage:(UIImage *)hbImage compressionQuality:(CGFloat)compressQuality sendURL:(NSURL*)hburl{
    //    //以下是保存文件到沙盒路径下
    //    //把图片转成NSData类型的数据来保存文件
    //    NSData *data;
    //    //压缩图片
    //    data = UIImageJPEGRepresentation(hbImage, compressQuality);
    //    //        }
    //    //保存
    //    [[NSFileManager defaultManager] createFileAtPath:self.imagePath contents:data attributes:nil];
    //    // 获取用户选中的文件名
    //    //        NSString* fileName = @"userInfoHead.png";
    //    // 根据用户选中的文件名确定需要上传的文件
    //    NSString *filePath = self.imagePath;
    //
    //    // 定义提交文件上传请求的URL
    //    NSURL* url = [NSURL URLWithString:
    //                  [QiaokerenApplication getUploadPhotoUrl]];
    //    __block ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    //    // 设置POST请求参数
    //    [request setPostValue:[personalInfo quserid] forKey:[QiaokerenApplication getTouxiang]];
    //    // 设置要上传的文件
    //    [request setFile:filePath  // 指定上传的文件
    //     // 指定上传文件的原始文件名
    //        withFileName:nil
    //      andContentType:nil // 指定上传文件的MIME类型
    //              forKey:@"uploaded"];  // 指定上传文件对应的请求参数名
    //    // 设置发送请求、获取服务器响应完成时激发的代码块
    //    [request setCompletionBlock:^{
    //        [self showHint:@"上传成功"];
    //    }];
    //    // 设置发送请求失败时激发该方法
    //    [request setFailedBlock:^{
    //        [self showHint:@"上传失败"];
    //    }];
    //    // 发送异步请求
    //    [request startAsynchronous];
}
@end

