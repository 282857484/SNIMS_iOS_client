//
//  LevelRelationSelectData.h
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface LevelRelationSelectData : JZGetValueInDictionary{
@private
    NSString* p;
    NSString* relateid;
    NSString* userid;
    NSString* neuserid;
    NSString* timestamp;
    NSString* status;
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* relateid;
@property(nonatomic, copy) NSString* userid;
@property(nonatomic, copy) NSString* neuserid;
@property(nonatomic, copy) NSString* timestamp;
@property(nonatomic, copy) NSString* status;
+(LevelRelationSelectData*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
        relateid:(NSString*)_relateid
             userid:(NSString*)_userid
          neuserid:(NSString*)_neuserid
      timestamp:(NSString*)_timestamp
     status:(NSString*)_status;

@end
