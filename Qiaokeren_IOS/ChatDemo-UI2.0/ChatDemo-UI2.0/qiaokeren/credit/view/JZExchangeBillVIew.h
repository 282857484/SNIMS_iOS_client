//
//  JZExchangeBillVIew.h
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-22.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JZExchangeBillDelegate <NSObject>

@optional
- (void)JZExchangeBillDidClickedFInish:(NSString*)_billid billstatus:(NSString*)_billstatus;

@end




@interface JZExchangeBillVIew : UIView

@property(nonatomic, copy) NSString* requesterName;
@property(nonatomic, copy) NSString* requesterAdress;
@property(nonatomic, copy) NSString* creditGoodName;
@property(nonatomic, copy) NSString* creditGoodNum;
@property(nonatomic, copy) NSString* totalCredit;
@property(nonatomic, copy) NSString* creditgoodtype;
@property(nonatomic, copy) NSString* creditbillstate;
@property(nonatomic, copy) NSString* billid;
@property(nonatomic, copy) NSString* subsup;
@property(nonatomic, copy) NSString* time;

@property(assign,nonatomic) id <JZExchangeBillDelegate> CFDelegate;

@property (strong, nonatomic)  UIButton *accpetBtn;

-(id)initCGWithFrame:(CGRect)frame requesterName:(NSString*)_requesterName requesterAdress:(NSString*)_requesterAdress creditGoodName:(NSString*)_creditGoodName creditGoodNum:(NSString*)_creditGoodNum totalCredit:(NSString*)_totalCredit creditgoodtype:(NSString*)_creditgoodtype creditbillstate:(NSString*)_creditbillstate billid:(NSString*)_billid subsup:(NSString*)_subsup time:(NSString*)_time;

@end
