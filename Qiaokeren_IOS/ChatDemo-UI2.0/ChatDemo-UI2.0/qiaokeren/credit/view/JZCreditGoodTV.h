//
//  JZCreditGoodTV.h
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-14.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuartzCore/QuartzCore.h" 
@interface JZCreditGoodTV : UIView

@property(nonatomic, copy) NSString* imageUrl;
@property(nonatomic, copy) NSString* needCredit;
@property(nonatomic, copy) NSString* creditGoodName;
@property(nonatomic, copy) NSString* creditgoodtype;

-(id)initCGWithFrame:(CGRect)frame imageUrl:(NSString*)_imageUrl needCredit:(NSString*)_needCredit creditGoodName:(NSString*)_creditGoodName creditgoodtype:(NSString*)_creditgoodtype;
@end
