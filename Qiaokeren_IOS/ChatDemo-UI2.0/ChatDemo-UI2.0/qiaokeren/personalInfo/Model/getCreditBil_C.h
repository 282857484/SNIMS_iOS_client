//
//  getCreditBil_C.h
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-21.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface getCreditBil_C : JZGetValueInDictionary
{
@private
    NSString * p ;
    NSString * UserID ;
    NSString * UploadTime ;
    NSString * supOrsub ;
    NSString * PageSize ;
    NSString * PageIndex ;
}

@property(nonatomic, copy) NSString * p;
@property(nonatomic, copy) NSString * UserID;
@property(nonatomic, copy) NSString * UploadTime;
@property(nonatomic, copy) NSString * supOrsub;
@property(nonatomic, copy) NSString * PageSize;
@property(nonatomic, copy) NSString * PageIndex;

+(getCreditBil_C*)Jz_initialize;
-(void)Jz_setValue;


-(void)initWithInfo:(NSString*)_saysomething
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
           supOrsub:(NSString*)_supOrsub
           PageSize:(NSString*)_PageSize
          PageIndex:(NSString*)_PageIndex
;

@end
