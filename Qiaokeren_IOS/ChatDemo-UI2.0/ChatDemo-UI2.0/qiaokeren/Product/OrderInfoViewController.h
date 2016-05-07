//
//  OrderInfoViewController.h
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-22.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TwoViewDelegate <NSObject>

- (void)changeValue:(NSString *)value;

@end


@interface OrderInfoViewController : UIViewController
@property (nonatomic,unsafe_unretained) id<TwoViewDelegate>delegate;
- (void)setOrderNumber:(NSString*)number Name:(NSString *)name;
@end
