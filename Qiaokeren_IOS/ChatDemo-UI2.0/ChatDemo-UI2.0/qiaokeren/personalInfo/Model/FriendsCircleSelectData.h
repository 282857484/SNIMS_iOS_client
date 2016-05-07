//
//  FriendsCircleSelectData.h
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-31.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface FriendsCircleSelectData : JZGetValueInDictionary{
@private
    NSString* fcid;
    NSString* userid;
    NSString* timestamp;
    NSString* level;
    NSString* fccontent;
    NSString* photo;
    NSString* time;
}
@property(nonatomic, copy) NSString* fcid;
@property(nonatomic, copy) NSString* userid;
@property(nonatomic, copy) NSString* timestamp;
@property(nonatomic, copy) NSString* level;
@property(nonatomic, copy) NSString* fccontent;
@property(nonatomic, copy) NSString* photo;
@property(nonatomic, copy) NSString* time;
+(FriendsCircleSelectData*)Jz_initialize;
-(void)initWithInfo:(NSString*)saysomething
            fcid:(NSString*)_fcid
         userid:(NSString*)_userid
          timestamp:(NSString*)_timestamp
         level:(NSString*)_level
      fccontent:(NSString*)_fccontent
              photo:(NSString*)_photo
              time:(NSString*)_time;

@end

