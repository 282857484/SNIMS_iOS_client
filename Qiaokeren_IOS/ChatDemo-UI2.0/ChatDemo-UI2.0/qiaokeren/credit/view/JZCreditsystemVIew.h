//
//  JZCreditsystemVIew.h
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-17.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol  JZCreditsystemDelegate <NSObject>
//
//@optional
//- (void) JZCreditsystemViewDidClicked;
//
//@end



@interface JZCreditsystemVIew : UIView

@property(nonatomic, copy) NSString* monthCredit;
@property(nonatomic, copy) NSString* yearCredit;



@property (strong, nonatomic)  UILabel *monthCreditLB;
@property (strong, nonatomic)  UILabel *BTmonthCreditLB;
@property (strong, nonatomic)  UILabel *yearCreditLB;
//@property(assign,nonatomic) id <JZCreditsystemDelegate> creditSystemDelegate;
-(id)initCGWithFrame:(CGRect)frame monthCredit:(NSString*)_monthCredit yearCredit:(NSString*)_yearCredit;


@end
