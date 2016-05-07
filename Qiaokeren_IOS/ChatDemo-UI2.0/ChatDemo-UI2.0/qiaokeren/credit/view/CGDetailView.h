//
//  CGDetailView.h
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-16.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserCreditData.h"
#import "addCreditBil_C.h"

@protocol CGDetailViewDelegate <NSObject>

@optional
- (void)CGDetailViewDidClickedFInish:(addCreditBil_C*)addCreData;

@end



@interface CGDetailView : UIView

@property(nonatomic, copy) NSString* imageUrl;
@property(nonatomic, copy) NSString* needCredit;
@property(nonatomic, copy) NSString* creditGoodName;
@property(nonatomic, copy) NSString* creditGoodDescribe;

@property (strong, nonatomic)  UILabel *CGname;
@property (strong, nonatomic)  UIImageView *CGImage;
//@property (weak, nonatomic) IBOutlet UILabel *goodsPerPrice;
@property (strong, nonatomic)  UILabel *goodsDescribe;
@property (strong, nonatomic)  UILabel *ordernumber;
@property (strong, nonatomic)  UILabel *ordeTotalCredit;
@property (strong, nonatomic)  UIButton *btnMilus;
@property (strong, nonatomic)  UIButton *btnPlus;
@property (strong, nonatomic)  UIButton *btnOrder;

@property (strong, nonatomic)  UITextField *address;
@property (strong, nonatomic)  UITextField *username;

@property(assign,nonatomic) id <CGDetailViewDelegate> cliFinDelegate;


-(id)initCGWithFrame:(CGRect)frame imageUrl:(NSString*)_imageUrl needCredit:(NSString*)_needCredit creditGoodName:(NSString*)_creditGoodName creditGoodDescribe:(NSString*)_creditGoodDescribe;

@end
