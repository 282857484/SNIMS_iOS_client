//
//  JZExchangeBillVIew.m
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-22.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import "JZExchangeBillVIew.h"
#import  "JZExchangeBillVC.h"

@implementation JZExchangeBillVIew

@synthesize requesterName;
@synthesize requesterAdress;
@synthesize creditGoodName;
@synthesize creditGoodNum;
@synthesize totalCredit;
@synthesize creditgoodtype;
@synthesize creditbillstate;
@synthesize billid;
@synthesize subsup;
@synthesize time;


@synthesize accpetBtn;
@synthesize CFDelegate;

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    return self ;
    
}


-(id)initCGWithFrame:(CGRect)frame requesterName:(NSString*)_requesterName requesterAdress:(NSString*)_requesterAdress creditGoodName:(NSString*)_creditGoodName creditGoodNum:(NSString*)_creditGoodNum totalCredit:(NSString*)_totalCredit creditgoodtype:(NSString*)_creditgoodtype creditbillstate:(NSString *)_creditbillstate billid:(NSString *)_billid subsup:(NSString *)_subsup time:(NSString *)_time
{

      self = [super initWithFrame:frame];
      
    if (self) {
        //        peopleNum = _peopleNum;
        self.requesterName  = _requesterName;
        self.requesterAdress = _requesterAdress;
        self.creditGoodName  = _creditGoodName;
        self.creditGoodNum = _creditGoodNum;
        self.totalCredit  = _totalCredit;
        self.creditgoodtype = _creditgoodtype;
        self.creditbillstate  = _creditbillstate;
        self.billid  = _billid;
        self.subsup = _subsup;
        self.userInteractionEnabled = YES;
        self.time = _time;
        [self iniSubviewsWithFrame:frame];
    }
    

    return self ;
}


-(NSString*)timeChangge:(NSString*)htime
{
    NSString* a = [htime substringWithRange:NSMakeRange(0,4)];
    NSString* b = [htime substringWithRange:NSMakeRange(4,2)];
    NSString* c = [htime substringWithRange:NSMakeRange(6,2)];
    NSString* d = [htime substringWithRange:NSMakeRange(8,2)];
    NSString* e = [htime substringWithRange:NSMakeRange(10,2)];

    NSString* stime = [NSString stringWithFormat:@"%@-%@-%@  %@:%@",a,b,c,d,e];
    
//    NSString* stime = [NSString stringWithFormat:@"%@-%@-%@",a,b,c];
    return stime;
}






-(void)iniSubviewsWithFrame:(CGRect)frame
{
    CGRect rqNameLabelRect = CGRectMake(15, 10, 80, 14);
    CGRect rqAdressLabelRect = CGRectMake(80, 10, 180, 14);
    CGRect creditgoodnameRect = CGRectMake(5,30 , 80, 14);
    CGRect creditGoodNumRect = CGRectMake(80,30 , 80, 14);
    CGRect timeRect = CGRectMake(160,30 , 160, 14);
    CGRect totalCreditRect = CGRectMake(5, 52, 80, 14);
    CGRect creditgoodtypeRect = CGRectMake(80, 52, 80, 14);
    CGRect creditbillstateRect = CGRectMake(10,74 , 80, 14);
    CGRect accpetBtnRect = CGRectMake(220,65 , 40, 25);

    //姓名标签
    UILabel* a =[[UILabel alloc]initWithFrame:rqNameLabelRect];
    a.textAlignment = NSTextAlignmentCenter;
    a.font=[UIFont systemFontOfSize:12];
    a.text = self.requesterName;
    
    
    //地址标签
    UILabel* b =[[UILabel alloc]initWithFrame:rqAdressLabelRect];
    b.textAlignment = NSTextAlignmentCenter;
    b.font=[UIFont systemFontOfSize:12];
    b.text = self.requesterAdress;
    
    
    
    
    
    //商品名称
    UILabel* c =[[UILabel alloc]initWithFrame:creditgoodnameRect];
    c.textAlignment = NSTextAlignmentCenter;
    c.font=[UIFont systemFontOfSize:12];
    c.text = self.creditGoodName;
    
    
    
//    
      UILabel* h =[[UILabel alloc]initWithFrame:timeRect];
      h.textAlignment = NSTextAlignmentCenter;
      h.font=[UIFont systemFontOfSize:12];
      h.text = [self timeChangge:self.time];
//    h.text = [NSString stringWithFormat:@"时间:%@",self.creditGoodNum];
    
    
    UILabel* d =[[UILabel alloc]initWithFrame:creditGoodNumRect];
    d.textAlignment = NSTextAlignmentCenter;
    d.font=[UIFont systemFontOfSize:12];
    d.text = [NSString stringWithFormat:@"数量:%@",self.creditGoodNum];
    
    
    
    UILabel* e =[[UILabel alloc]initWithFrame:totalCreditRect];
    e.textAlignment = NSTextAlignmentCenter;
    e.font=[UIFont systemFontOfSize:12];
    e.text = [NSString stringWithFormat:@"%@积分",self.totalCredit];
    
    
    
    UILabel* f =[[UILabel alloc]initWithFrame:creditgoodtypeRect];
    f.textAlignment = NSTextAlignmentCenter;
    f.font=[UIFont systemFontOfSize:12];
    f.text = self.creditgoodtype;
    
    
    
    
    
    UILabel* g =[[UILabel alloc]initWithFrame:creditbillstateRect];
    g.textAlignment = NSTextAlignmentCenter;
    g.font=[UIFont systemFontOfSize:12];
    if ([self.creditbillstate isEqualToString:@"1"]) {
    g.text = @"订单待接受";
        [g setTextColor:[UIColor blueColor]];

    }
    if ([self.creditbillstate isEqualToString:@"2"]) {
        g.text = @"订单已经确认";
        [g setTextColor:[UIColor redColor]];
    }
    if ([self.creditbillstate isEqualToString:@"-1"]) {
        g.text = @"定单已经取消";
        [g setTextColor:[UIColor greenColor]];
    }
    
    
    accpetBtn = [UIButton buttonWithType:UIButtonTypeCustom];//自定义类型
    accpetBtn.frame = accpetBtnRect;
    [accpetBtn setTitle:self.subsup forState:UIControlStateNormal];
    [accpetBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:12]];
    UIColor *color = [UIColor colorWithRed:0.0 green:0.5 blue:1.0 alpha:1.0];
    [accpetBtn setTitleColor:color forState:UIControlStateNormal];
    //    btnOrder.titleLabel.backgroundColor = [UIColor blueColor];
    [accpetBtn.layer setMasksToBounds:YES];
    [accpetBtn.layer setCornerRadius:10.0]; //设置矩形四个圆角半径
    [accpetBtn.layer setBorderWidth:1.0];
    accpetBtn.layer.borderColor =  [UIColor lightGrayColor].CGColor;
    if ([self.creditbillstate isEqualToString:@"1"]) {
        accpetBtn.hidden = false;
        
    }
    if ([self.creditbillstate isEqualToString:@"2"]) {
        accpetBtn.hidden = true;
    }
    if ([self.creditbillstate isEqualToString:@"-1"]) {
       accpetBtn.hidden = true;
    }
    
    if ([self.subsup isEqualToString:@"取消"]) {
        accpetBtn.hidden = true;
    }

    [accpetBtn addTarget:self action:@selector(finishOrderInfo) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    [self addSubview:a];
    [self addSubview:b];
    [self addSubview:c];
    [self addSubview:d];
    [self addSubview:e];
    [self addSubview:f];
    [self addSubview:g];
    [self addSubview:h];
    
    [self addSubview:accpetBtn];
    
}


-(void)finishOrderInfo
{
    
    if (CFDelegate && [CFDelegate respondsToSelector:@selector(JZExchangeBillDidClickedFInish:billstatus:)]) {
        [CFDelegate JZExchangeBillDidClickedFInish:self.billid billstatus:self.creditbillstate];
    }

}


@end
