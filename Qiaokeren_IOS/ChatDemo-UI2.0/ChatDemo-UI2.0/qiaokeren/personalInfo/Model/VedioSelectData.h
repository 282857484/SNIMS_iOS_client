//
//  VedioSelectData.h
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface VedioSelectData : JZGetValueInDictionary{
@private
    NSString* p;
    NSString* vedioid;
    NSString* vediolevel;
    NSString* vediotype;
    NSString* vediointro;
    NSString* vedioresource;
}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* vedioid;
@property(nonatomic, copy) NSString* vediolevel;
@property(nonatomic, copy) NSString* vediotype;
@property(nonatomic, copy) NSString* vediointro;
@property(nonatomic, copy) NSString* vedioresource;
+(VedioSelectData*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
             vedioid:(NSString*)_vedioid
             vediolevel:(NSString*)_vediolevel
           vediotype:(NSString*)_vediotype
        vediointro:(NSString*)_vediointro
          vedioresource:(NSString*)_vedioresource;

@end