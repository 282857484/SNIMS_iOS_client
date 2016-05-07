//
//  JZgetGoodsInfo_s.h
//  Text01
//
//  Created by apple on 15-1-28.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface JZgetGoodsInfo_s : JZGetValueInDictionary{
@private
    NSString* p;
    NSString* UserID;
    NSString* UploadTime;
    NSString* PageSize;
    NSString* PageIndex;
    NSString* GoodsList;
    NSString* Mark;
    NSString* Content;

}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* UserID;
@property(nonatomic, copy) NSString* UploadTime;
@property(nonatomic, copy) NSString* PageSize;
@property(nonatomic, copy) NSString* PageIndex;
@property(nonatomic, copy) NSString* GoodsList;
@property(nonatomic, copy) NSString* Mark;
@property(nonatomic, copy) NSString* Content;


+(JZgetGoodsInfo_s*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
             UserID:(NSString*)_UserID
         UploadTime:(NSString*)_UploadTime
           PageSize:(NSString*)_PageSize
          PageIndex:(NSString*)_PageIndex
          GoodsList:(NSString*)_GoodsList
               Mark:(NSString*)_Mark
            Content:(NSString*)_Content;



@end
