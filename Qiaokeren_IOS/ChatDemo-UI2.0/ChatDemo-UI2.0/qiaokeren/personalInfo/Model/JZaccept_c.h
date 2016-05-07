//
//  accept_c.h
//  datacalss
//
//  Created by 杨珺舟 on 15-1-22.
//
//

#import <Foundation/Foundation.h>
#import "JZGetValueInDictionary.h"
@interface JZaccept_c : JZGetValueInDictionary{

@private
NSString* p ;
NSString* Billid ;
NSString* Userid ;
NSString* UploadTime ;
NSString* IsAccept ;
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* Billid;
@property(nonatomic, copy) NSString* Userid;
@property(nonatomic, copy) NSString* UploadTime;
@property(nonatomic, copy) NSString* IsAccept;
+(JZaccept_c*)Jz_initialize;
-(void)Jz_setValue;
-(NSDictionary*)getValueInDictionary;

-(void)initWithInfo:(NSString*)_saysomething
             Billid:(NSString*)_Billid
             Userid:(NSString*)_Userid
         UploadTime:(NSString*)_UploadTime
           IsAccept:(NSString*)_IsAccept;

@end
