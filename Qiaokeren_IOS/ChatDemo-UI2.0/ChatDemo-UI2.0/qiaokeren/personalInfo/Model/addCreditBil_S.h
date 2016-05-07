//
//  addCreditBil_S.h
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-21.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JZGetValueInDictionary.h"

@interface addCreditBil_S : JZGetValueInDictionary
{
@private
    NSString * p ;
    NSString * UserID ;
    NSString * UploadTime ;
    NSString * Mark ;
    NSString * Content ;
    NSString * billid ;
}

@property(nonatomic, copy) NSString * p;
@property(nonatomic, copy) NSString * UserID;
@property(nonatomic, copy) NSString * UploadTime;
@property(nonatomic, copy) NSString * Mark;
@property(nonatomic, copy) NSString * Content;
@property(nonatomic, copy) NSString * billid;



+(addCreditBil_S*)Jz_initialize;
-(void)Jz_setValue;

-(void)initWithInfo:(NSString*)_saysomething
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
               Mark:(NSString*)_Mark
            Content:(NSString*)_Content
             billid:(NSString*)_billid
;

@end
