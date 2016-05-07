//
//  JZgetBillInfo_c.h
//  Text01
//
//  Created by apple on 15-1-25.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JZGetValueInDictionary.h"
@interface JZgetBillInfo_c : JZGetValueInDictionary{
  @private
    NSString* p;
    NSString* UserID;
    NSString* UploadTime;
    NSString* BillID;
    NSString* SearchUserID;
    NSString* SearchUpUserID;
    NSString* PageSize;
    NSString* PageIndex;

}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* UserID;
@property(nonatomic, copy) NSString* UploadTime;
@property(nonatomic, copy) NSString* BillID;
@property(nonatomic, copy) NSString* SearchUserID;
@property(nonatomic, copy) NSString* SearchUpUserID;
@property(nonatomic, copy) NSString* PageSize;
@property(nonatomic, copy) NSString* PageIndex;
+(JZgetBillInfo_c*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
             BillID:(NSString*)_BillID
       SearchUserID:(NSString*)_SearchUserID
     SearchUpUserID:(NSString*)_SearchUpUserID
           PageSize:(NSString*)_PageSize
          PageIndex:(NSString*)_PageIndex;





@end
