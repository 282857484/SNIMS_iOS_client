//
//  JZGetValueInDictionary.m
//  Text01
//
//  Created by apple on 15-1-25.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@implementation JZGetValueInDictionary
-(NSDictionary*)toDictionary{
    NSMutableDictionary* mydictionary = [NSMutableDictionary dictionary];
    Class  own = [self class];
    unsigned int ivarsCnt = 0;
    Ivar* ivars = class_copyIvarList(own, &ivarsCnt);
    for (const Ivar *p = ivars; p < ivars + ivarsCnt; ++p)
    {
        Ivar const ivar = *p;
        
        //　获取变量名
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        // 若此变量未在类结构体中声明而只声明为Property，则变量名加前缀 '_'下划线
        // 比如 @property(retain) NSString *abc;则 key == _abc;
        
        //　获取变量值
        id value = [self valueForKey:key];
        //
        //        //　取得变量类型
        //        // 通过 type[0]可以判断其具体的内置类型
        //const char *type = ivar_getTypeEncoding(ivar);
        
        if (value)
        {
            [mydictionary setObject:value forKey:key];
        }
    }
    return mydictionary;
}
@end
