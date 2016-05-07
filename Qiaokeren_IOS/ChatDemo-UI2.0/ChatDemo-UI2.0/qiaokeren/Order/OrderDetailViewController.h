//
//  OrderDetailViewController.h
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-20.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConnectTestViewController.h"
@protocol OrderDetailViewDelegate <NSObject>

- (void)changeOrderStatue:(NSString *)value;
@end

@interface OrderDetailViewController : ConnectTestViewController<UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (nonatomic,unsafe_unretained) id<OrderDetailViewDelegate>delegate;
-(void)setGoodsId:(NSString*)goodsId AndBillId:(NSString*)billId IsUpOrDown:(NSString*)num;//1表示上级；2表示下级
@property(nonatomic,strong)NSString *imagePath;
@end
