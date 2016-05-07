//
//  getGoodinfoNew_C.h
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-24.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface getGoodinfoNew_C : JZGetValueInDictionary
{
@private
    NSString * p ;
    NSString * UserID ;
    NSString * UploadTime ;
    NSString * goodsid ;
    NSString * PageSize ;
    NSString * PageIndex ;
}

@property(nonatomic, copy) NSString * p;
@property(nonatomic, copy) NSString * UserID;
@property(nonatomic, copy) NSString * UploadTime;
@property(nonatomic, copy) NSString * goodsid;
@property(nonatomic, copy) NSString * PageSize;
@property(nonatomic, copy) NSString * PageIndex;

+(getGoodinfoNew_C*)Jz_initialize;
-(void)Jz_setValue;

-(void)initWithInfo:(NSString*)_saysomething
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
            goodsid:(NSString*)_goodsid
           PageSize:(NSString*)_PageSize
          PageIndex:(NSString*)_PageIndex
;

@end
