//
//  JZgetDownLevel_s.h
//  Text01
//
//  Created by apple on 15-1-27.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface JZgetDownLevel_s : JZGetValueInDictionary{
@private
    NSString* p;
    NSString* Userid;
    NSString* UploadTime;
    NSString* RealLevelDeep;
    NSString* UserNum;
    NSString* UseridList;
    NSString* Mark;
    NSString* Content;
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* Userid;
@property(nonatomic, copy) NSString* UploadTime;
@property(nonatomic, copy) NSString* RealLevelDeep;
@property(nonatomic, copy) NSString* UserNum;
@property(nonatomic, copy) NSString* UseridList;
@property(nonatomic, copy) NSString* Mark;
@property(nonatomic, copy) NSString* Content;
+(JZgetDownLevel_s*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
             Userid:(NSString*)_Userid
         UploadTime:(NSString*)_UploadTime
      RealLevelDeep:(NSString*)_RealLevelDeep
            UserNum:(NSString*)_UserNum
         UseridList:(NSString*)_UseridList
               Mark:(NSString*)_Mark
            Content:(NSString*)_Content;





@end
