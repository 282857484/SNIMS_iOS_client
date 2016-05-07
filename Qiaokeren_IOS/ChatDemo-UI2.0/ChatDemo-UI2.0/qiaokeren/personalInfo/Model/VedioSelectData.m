//
//  VedioSelectData.m
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "VedioSelectData.h"
#import "JZ_tag.h"
@implementation VedioSelectData

@synthesize  p;
@synthesize  vedioid;
@synthesize  vediolevel;
@synthesize  vediotype;
@synthesize  vediointro;
@synthesize  vedioresource;
+(VedioSelectData*)Jz_initialize{
    VedioSelectData* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_tag* a=[JZ_tag Jz_initialize];
    [self setP:[a  VedioSelectData]];
    
}
-(void)initWithInfo:(NSString *)saysomething vedioid:(NSString *)_vedioid vediolevel:(NSString *)_vediolevel vediotype:(NSString *)_vediotype vediointro:(NSString *)_vediointro vedioresource:(NSString *)_vedioresource{
    [self setVedioid:_vedioid];
    [self setVediolevel:_vediolevel];
    [self setVediotype:_vediotype];
    [self setVediointro:_vediointro];
    [self setVedioresource:_vedioresource];
}

@end