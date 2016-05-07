//
//  JZInviteSelectData.m
//  Text01
//
//  Created by apple on 15-1-25.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZInviteSelectData.h"
#import "JZ_tag.h"
@implementation JZInviteSelectData

@synthesize  p;
@synthesize  qinviteid;
@synthesize  qinvite;
@synthesize  qbeinvitedid;
@synthesize  qinvitenum;
@synthesize  qusestate;

+(JZInviteSelectData*)Jz_initialize{
    JZInviteSelectData* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_tag* a=[JZ_tag Jz_initialize];
    [self setP:[a  InviteSelectData]];
    
}

-(void)initWithInfo:(NSString *)saysomething qinviteid:(NSString *)_qinviteid qinvite:(NSString *)_qinvite qbeinvitedid:(NSString *)_qbeinvitedid qinvitenum:(NSString *)_qinvitenum qusestate:(NSString *)_qusestate{
     NSLog(@"%@",saysomething);
    [self setQinviteid:_qinviteid];
    [self setQinvite:_qinvite];
    [self setQbeinvitedid:_qbeinvitedid];
    [self setQinvitenum:_qinvitenum];
    [self setQusestate:_qusestate];

}
@end
