//
//  UserDelegate.h
//  passValue
//
//  Created by mac on 14-11-8.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
@protocol UserDelegate <NSObject>

    -(void)setValue:(id)userValue;

@end
