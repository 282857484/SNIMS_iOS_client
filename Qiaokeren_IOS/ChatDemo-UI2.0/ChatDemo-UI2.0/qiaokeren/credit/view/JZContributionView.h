//
//  JZContributionView.h
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-24.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZContributionView : UIView

@property(nonatomic, copy) NSString* time;
@property(nonatomic, copy) NSString* creditGoodName;
@property(nonatomic, copy) NSString* creditGoodNum;
@property(nonatomic, copy) NSString* creditbillstate;
@property(nonatomic, copy) NSString* totalCredit;


-(id)initCGWithFrame:(CGRect)frame time:(NSString*)_time creditGoodName:(NSString*)_creditGoodName creditGoodNum:(NSString*)_creditGoodNum creditbillstate:(NSString*)_creditbillstate totalCredit:(NSString*)_totalCredit;

@end
