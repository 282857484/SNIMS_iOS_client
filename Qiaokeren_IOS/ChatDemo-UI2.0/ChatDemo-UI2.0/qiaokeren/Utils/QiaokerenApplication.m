//
//  QiaokerenApplication.m
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-26.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "QiaokerenApplication.h"

@implementation QiaokerenApplication

NSString *AccountNumber = @"0";
UserSeletData * userinfo;
+(void)setAccountNumber:(NSString*)value{
    if (value != nil) {
        AccountNumber = value;
    }
}
+(int) getAccountType{
    if ([[userinfo qphone] isEqual:@"13007420476"]) {
        return 0;
    } else {
        return 1;
    }
//    switch ([[userinfo qphone] integerValue]) {
//        case 13007420476:// 测试帐号返回0
//            return 0;
//            break;
//            
//        default:
//            return 1;
//            break;
//    }
}
+(NSString*)getAccountNumber{
   return AccountNumber;
}
+(NSString*)getConnectionPort{
    return @"12345";
}

+(NSString*)getConnectionUploasImagePort{
    return @"12347";
}

+(void)setUserSelectData:(UserSeletData*)user{
    userinfo = user;
}
+(UserSeletData*)getUserSelectData{
    return userinfo;
}
NSMutableArray *goodsArray;
+(void)setGoodsArray:(NSMutableArray*)goods{
    goodsArray = goods;
}
+(NSMutableArray*)getGoodsArray{
    return goodsArray;
}

//+ (NSString*)getTouXiangUrl:(NSString *)userid{
//    return [[NSString alloc] initWithFormat:@"http://qiaokeren.com/uploadimg/upload/upload/%@.png",userid];
////    return [[NSString alloc] initWithFormat:@"http://%@:80/image/qiao/touxiang/xiaotu/%@%@",ip,userid,@".png"];
//}
//
//+(NSString*)getUploadPhotoUrl{
//    return @"http://qiaokeren.com/uploadimg/upload/upload.php";
//}






/**
 * 说明：新版应用下载
 * 文件名命名规则：应用固有文件名
 */
NSString * AppDownloadURL = @"http://qiaokeren.com/app/download/app/";
+ (NSString*) getAppDownloadURL{
    return AppDownloadURL;
}
/**
 * 说明：资源文件下载
 * 文件名命名规则：固有文件名/${random()}
 */
NSString * DownloadResourceURL = @"http://qiaokeren.com/app/download/resource/";
+ (NSString*) getDownloadResourceURL{
    return DownloadResourceURL;
}
/**
 * 说明：头像
 * 文件名命名规则：${userid}.png
 * 传输暗号：touxiangname
 */
NSString * ImageTouXiangURL = @"http://qiaokeren.com/app/img/touxiang/";
NSString * touxiang = @"touxiangname";
+ (NSString*) getImageTouXiangURL{
    return ImageTouXiangURL;
}
+ (NSString*) getTouxiang{
    return touxiang;
}
/**
 * 说明：界面图片加载
 * 文件名命名规则：固有文件名
 */
NSString * ImageViewImageURL = @"http://qiaokeren.com/app/img/viewimage/";
+ (NSString*) getImageViewImageURL{
    return ImageViewImageURL;
}
/**
 * 说明：产品图片
 * 文件名命名规则：固有文件名称
 */
NSString * ImageChanPinURL = @"http://qiaokeren.com/app/img/chanpin/";
+ (NSString*) getImageChanPinURL{
    return ImageChanPinURL;
}
/**
 * 说明：教学视频图片
 * 文件名命名规则：固有文件名
 */
NSString * ImageShipinURL = @"http://qiaokeren.com/app/img/shipin/";
+ (NSString*) getImageShipinURL{
    return ImageShipinURL;
}
/**
 * 说明：朋友圈
 * 文件名命名规则：固有文件名
 */
NSString * ImagePengYouQuanURL = @"http://qiaokeren.com/app/img/pengyouquan/";
+ (NSString*) getImagePengYouQuanURL{
    return ImagePengYouQuanURL;
}
/**
 * 说明：教学视频
 * 文件名命名规则：固有名称
 */
NSString * VedioJiaoxueURL = @"http://qiaokeren.com/app/vedio/jiaoxue/";
+ (NSString*) getVedioJiaoxueURL{
    return VedioJiaoxueURL;
}
/**
 * 说明：课堂录音
 * 文件名命名规则：${userid}_${timestamp}.wav
 */

NSString * AudioTheClassURL = @"http://qiaokeren.com/app/audio/theclass/";
NSString * AudioName = @"audioname";
+ (NSString*) getAudioTheClassURL{
    return AudioTheClassURL;
}
+ (NSString*) GetAudioname{
    return AudioName;
}

NSString * BillCutURL = @"http://qiaokeren.com/app/billcut/";
NSString * Billcut = @"billname";
+ (NSString*) getBillCutURL{
    return BillCutURL;
}
+ (NSString*) getBillCut{
    return Billcut;
}
NSString * NewsURL = @"http://qiaokeren.com/app/news/";


+ (NSString*)getTouXiangUrlUserID:(NSString *)UserId{
    return [[NSString alloc] initWithFormat:@"http://qiaokeren.com/app/img/touxiang/%@.png",UserId];
}
+ (NSString*)getAudioJiaoXueUrlUserID:(NSString *)UserId TimeStamp:(NSString*)timestamp{
    return [[NSString alloc] initWithFormat:@"%@%@_%@.amr",AudioTheClassURL,UserId,timestamp];
}
+ (NSString*)getBillCutUrlBillID:(NSString *)billId{
    return [[NSString alloc] initWithFormat:@"%@%@.png",BillCutURL,billId];
}

NSString* PHPUploadFileName = @"upload.php";
//+(NSString*)getUploadPhotoUrl{
//    return @"http://qiaokeren.com/app/img/touxiang/upload.php";
//}

+ (NSString*) getUploadtouxiangPhotoUrl{
    return [NSString stringWithFormat:@"%@%@",ImageTouXiangURL,PHPUploadFileName];
}
+ (NSString*) getUploadAudioJiaoxueUrl{
    return [NSString stringWithFormat:@"%@%@",AudioTheClassURL,PHPUploadFileName];
}
+ (NSString*) getUploadBillCutUrl{
    return [NSString stringWithFormat:@"%@%@",BillCutURL,PHPUploadFileName];
}
@end
