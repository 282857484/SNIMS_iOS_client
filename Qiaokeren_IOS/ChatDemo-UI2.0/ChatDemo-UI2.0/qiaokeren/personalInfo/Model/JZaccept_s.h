//
//  JZaccept_s.h
//  Text01
//
//  Created by 杨珺舟 on 15-1-22.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JZGetValueInDictionary.h"
@interface JZaccept_s : JZGetValueInDictionary{
@private
NSString* p ;
NSString* Billid ;
NSString* Userid ;
NSString* UploadTime ;
NSString* Mark ;
NSString* Content ;
NSString* Billstatus ;
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* Billid;
@property(nonatomic, copy) NSString* Userid;
@property(nonatomic, copy) NSString* UploadTime;
@property(nonatomic, copy) NSString* Mark;
@property(nonatomic, copy) NSString* Content;
@property(nonatomic, copy) NSString* Billstatus;
+(JZaccept_s*)Jz_initialize;
-(void)Jz_setValue;
-(NSDictionary*)getValueInDictionary;

-(void)initWithInfo:(NSString*)saysomething
             Billid:(NSString*)_Billid
             Userid:(NSString*)_Userid
         UploadTime:(NSString*)_UploadTime
               Mark:(NSString*)_Mark
            Content:(NSString*)_Content
         Billstatus:(NSString*)_Billstatus;
@end
