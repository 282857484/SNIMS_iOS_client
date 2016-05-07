//
//  CGDetailViewController.h
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-17.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreditGoodData.h"
#import "JZDataHandle.h"
typedef void (^nameAndAdress)(NSString* name,NSString* adress,NSString* gi);

@interface CGDetailViewController : UIViewController<UITextFieldDelegate>


-(void)getNameAdress:(nameAndAdress)nameAdressblock;
+ (CGDetailViewController *)sharedActivityView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil CreditGoodData:(CreditGoodData*)_CreditGoodData;
@end
