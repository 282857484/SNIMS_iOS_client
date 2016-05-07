//
//  getCreditBil_S.h
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-21.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface getCreditBil_S : JZGetValueInDictionary
{
@private
    NSString * p ;
    NSString * UserID ;
    NSString * UploadTime ;
    NSString * PageSize ;
    NSString * PageIndex ;
    NSString * Mark ;
    NSString * Content ;
    NSString * BillSelectDataList ;
}

@property(nonatomic, copy) NSString * p;
@property(nonatomic, copy) NSString * UserID;
@property(nonatomic, copy) NSString * UploadTime;
@property(nonatomic, copy) NSString * PageSize;
@property(nonatomic, copy) NSString * PageIndex;
@property(nonatomic, copy) NSString * Mark;
@property(nonatomic, copy) NSString * Content;
@property(nonatomic, copy) NSString * BillSelectDataList;

+(getCreditBil_S*)Jz_initialize;
-(void)Jz_setValue;


-(void)initWithInfo:(NSString*)_saysomething
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
           PageSize:(NSString*)_PageSize
          PageIndex:(NSString*)_PageIndex
               Mark:(NSString*)_Mark
            Content:(NSString*)_Content
	BillSelectDataList:(NSString*)_BillSelectDataList
;

@end
