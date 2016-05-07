//
//  JZLogin_s.h
//  Text01
//
//  Created by apple on 15-1-28.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface JZLogin_s : JZGetValueInDictionary
{
@private
    NSString* p;
    NSString* Userid;
    NSString* UploadTime;
    NSString* Mark;
    NSString* Content;
    NSString* UserSelectDataToJSON;
    
    
    
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* Userid;
@property(nonatomic, copy) NSString* UploadTime;
@property(nonatomic, copy) NSString* Mark;
@property(nonatomic, copy) NSString* Content;
@property(nonatomic, copy) NSString* UserSelectDataToJSON;



+(JZLogin_s*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
             Userid:(NSString*)_Userid
              UploadTime:(NSString*)_UploadTime
              Mark:(NSString*)_Mark
               Content:(NSString*)_Content
         UserSelectDataToJSON:(NSString*)_UserSelectDataToJSON;









@end

