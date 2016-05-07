//
//  JZgetGoodsInfo_s.m
//  Text01
//
//  Created by apple on 15-1-28.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZgetGoodsInfo_s.h"
#import "JZ_agreement_s.h"
@implementation JZgetGoodsInfo_s

@synthesize  p;
@synthesize  UserID;
@synthesize  UploadTime;
@synthesize  PageSize;
@synthesize  PageIndex;
@synthesize  GoodsList;
@synthesize  Mark;
@synthesize  Content;

+(JZgetGoodsInfo_s*)Jz_initialize{
    JZgetGoodsInfo_s* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_s* a=[JZ_agreement_s Jz_initialize];
    [self setP:[a  getGoodsInfo_S]];
    
}
-(void)initWithInfo:(NSString *)saysomething UserID:(NSString *)_UserID UploadTime:(NSString *)_UploadTime PageSize:(NSString *)_PageSize PageIndex:(NSString *)_PageIndex GoodsList:(NSString *)_GoodsList Mark:(NSString *)_Mark Content:(NSString *)_Content{
    NSLog(@"%@",saysomething);
    [self setUserID:_UserID];
    [self setUploadTime:_UploadTime];
    [self setPageSize:_PageSize ];
    [self setPageIndex:_PageIndex];
    [self setGoodsList:_GoodsList];
    [self setMark:_Mark];
    [self setContent:_Content];


}
@end
