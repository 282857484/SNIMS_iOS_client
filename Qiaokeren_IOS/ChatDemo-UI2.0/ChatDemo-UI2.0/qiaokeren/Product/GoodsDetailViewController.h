//
//  GoodsDetailViewController.h
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-21.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConnectTestViewController.h"
@interface GoodsDetailViewController : ConnectTestViewController<UITextFieldDelegate>
-(void)setSelectedGoodsId:(NSString*)str GoodsArray:(NSMutableArray *)value;
@end
