//
//  JZInviteSelectData.h
//  Text01
//
//  Created by apple on 15-1-25.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JZGetValueInDictionary.h"
@interface JZInviteSelectData : JZGetValueInDictionary{
   @private
    NSString* p;
    NSString* qinviteid;//主建id
    NSString* qinvite;//邀请人id
    NSString* qbeinvitedid;//被邀请人id
    NSString* qinvitenum;//邀请码
    NSString* qusestate;//邀请码使用状态
    

}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* qinviteid;
@property(nonatomic, copy) NSString* qinvite;
@property(nonatomic, copy) NSString* qbeinvitedid;
@property(nonatomic, copy) NSString* qinvitenum;
@property(nonatomic, copy) NSString* qusestate;

+(JZInviteSelectData*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
          qinviteid:(NSString*)_qinviteid
            qinvite:(NSString*)_qinvite
       qbeinvitedid:(NSString*)_qbeinvitedid
         qinvitenum:(NSString*)_qinvitenum
          qusestate:(NSString*)_qusestate;





@end
