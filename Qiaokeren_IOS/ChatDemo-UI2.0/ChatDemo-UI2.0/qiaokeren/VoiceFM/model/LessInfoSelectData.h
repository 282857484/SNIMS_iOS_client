//
//  LessInfoSelectData.h
//  ChatDemo-UI2.0
//
//  Created by apple on 15/7/14.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface LessInfoSelectData : JZGetValueInDictionary{
    @private
//    NSString * p;
    NSString * classid;
    NSString * userid;
    NSString * timestamp;
    NSString * username;
    NSString * userlevel;
    NSString * classlevel;
    NSString * place;
    NSString * introduce;
    NSString * topic;
    NSString * type;
    NSString * suit;
}

//@property(nonatomic, copy) NSString * p;
@property(nonatomic, copy) NSString * classid;
@property(nonatomic, copy) NSString * userid;
@property(nonatomic, copy) NSString * timestamp;
@property(nonatomic, copy) NSString * username;
@property(nonatomic, copy) NSString * userlevel;
@property(nonatomic, copy) NSString * classlevel;
@property(nonatomic, copy) NSString * place;
@property(nonatomic, copy) NSString * introduce;
@property(nonatomic, copy) NSString * topic;
@property(nonatomic, copy) NSString * type;
@property(nonatomic, copy) NSString * suit;

-(void) isValid;
+(id) instance2;
-(void) initWithInfo:(NSString *) _saysomething
//                   p:(NSString *) _p
             classid:(NSString *) _classid
              userid:(NSString *) _userid
           timestamp:(NSString *) _timestamp
            username:(NSString *) _username
           userlevel:(NSString *) _userlevel
          classlevel:(NSString *) _classlevel
               place:(NSString *) _place
           introduce:(NSString *) _introduce
               topic:(NSString *) _topic
                type:(NSString *) _type
                suit:(NSString *) _suit;



@end
