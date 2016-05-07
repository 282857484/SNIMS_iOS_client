//
//  RegViewController.h
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-16.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "ConnectTestViewController.h"
@protocol RegViewControllerDelegate <NSObject>
- (void)setQiaokerenID:(NSString *)value;
@end

@interface RegViewController : ConnectTestViewController
@property (nonatomic,unsafe_unretained) id<RegViewControllerDelegate>delegate;
@end
