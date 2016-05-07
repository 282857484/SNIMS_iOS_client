//
//  JZgetFriendsCircle_S.h
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-31.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface JZgetFriendsCircle_S : JZGetValueInDictionary{
@private
    NSString* p;
    NSString* UserID;
    NSString* UploadTime;
    NSString* PageSize;
    NSString* PageIndex;
    NSString* Mark;
    NSString* Content;
    NSString* FriendsCircleList;
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* UserID;
@property(nonatomic, copy) NSString* UploadTime;
@property(nonatomic, copy) NSString* PageSize;
@property(nonatomic, copy) NSString* PageIndex;
@property(nonatomic, copy) NSString* Mark;
@property(nonatomic, copy) NSString* Content;
@property(nonatomic, copy) NSString* FriendsCircleList;
+(JZgetFriendsCircle_S*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
           PageSize:(NSString*)_PageSize
          PageIndex:(NSString*)_PageIndex
               Mark:(NSString*)_Mark
            Content:(NSString*)_Content
FriendsCircleList:(NSString*)_FriendsCircleList;
@end
