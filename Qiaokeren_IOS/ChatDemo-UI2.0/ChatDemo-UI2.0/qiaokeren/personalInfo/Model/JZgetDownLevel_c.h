//
//  JZgetDownLevel_c.h
//  Text01
//
//  Created by apple on 15-1-26.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZGetValueInDictionary.h"

@interface JZgetDownLevel_c : JZGetValueInDictionary{
@private
    NSString* p;
    NSString* Userid;
    /**
     * 用户要求遍历1层关系; 用户要求遍历2层关系; 用户要求遍历3层关系; 用户要求遍历4层关系; 厂家相当于母节点,所有用户必须挂载到母节点下
     */
    NSString* LevelDeep;
    /**
     * 一层遍历的不需要识别码 二层遍历及以上的需要识别码
     */

    NSString* RecognisizeNum;
    /**
     * 遍历级别不得高于用户级别
     */
    NSString* UserLevel;
    NSString* UploadTime;

}
@property(nonatomic, copy) NSString* p;
@property(nonatomic, copy) NSString* Userid;
@property(nonatomic, copy) NSString* LevelDeep;
@property(nonatomic, copy) NSString* RecognisizeNum;
@property(nonatomic, copy) NSString* UserLevel;
@property(nonatomic, copy) NSString* UploadTime;
+(JZgetDownLevel_c*)Jz_initialize;
-(void)Jz_setValue;
-(void)initWithInfo:(NSString*)saysomething
             Userid:(NSString*)_Userid
          LevelDeep:(NSString*)_LevelDeep
     RecognisizeNum:(NSString*)_RecognisizeNum
          UserLevel:(NSString*)_UserLevel
         UploadTime:(NSString*)_UploadTime;




@end
