//
//  JZLogin_c.h
//  Text01
//
//  Created by apple on 15-1-28.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface JZLogin_c : JZGetValueInDictionary
{
@private
    NSString* p;
    NSString* Userid;
    NSString* Phone;
    NSString* Email;
    NSString* Code;
    NSString* UploadTime;
    
    
    
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* Userid;
@property(nonatomic, copy) NSString* Phone;
@property(nonatomic, copy) NSString* Email;
@property(nonatomic, copy) NSString* Code;
@property(nonatomic, copy) NSString* UploadTime;



+(JZLogin_c*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
             Userid:(NSString*)_Userid
          Phone:(NSString*)_Phone
         Email:(NSString*)_Email
           Code:(NSString*)_Code
         UploadTime:(NSString*)_UploadTime;









@end