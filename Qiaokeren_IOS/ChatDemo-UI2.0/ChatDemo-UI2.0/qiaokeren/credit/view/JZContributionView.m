//
//  JZContributionView.m
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-24.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import "JZContributionView.h"

@implementation JZContributionView

@synthesize time;
@synthesize creditGoodName;
@synthesize creditGoodNum;
@synthesize creditbillstate;
@synthesize totalCredit;


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    return self ;
    
}

-(id)initCGWithFrame:(CGRect)frame time:(NSString *)_time creditGoodName:(NSString *)_creditGoodName creditGoodNum:(NSString *)_creditGoodNum creditbillstate:(NSString *)_creditbillstate totalCredit:(NSString *)_totalCredit{
    
    self = [super initWithFrame:frame];

    
    if (self) {
        //        peopleNum = _peopleNum;
        self.time  = _time;
        self.creditGoodName = _creditGoodName;
        self.creditGoodNum = _creditGoodNum;
        self.creditbillstate  = _creditbillstate;
        self.totalCredit  = _totalCredit;
        
        
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
    
    
    CGRect timeRect = CGRectMake(10,10 , 120, 20);
    CGRect creditgoodnameRect = CGRectMake(30,40 , 80, 30);
    CGRect creditGoodNumRect = CGRectMake(110,40 , 80, 30);
    CGRect creditbillstateRect = CGRectMake(30,75 , 80, 15);
    CGRect totalCreditRect = CGRectMake(110, 75, 80, 14);
    
    
    //时间标签
    UILabel* a =[[UILabel alloc]initWithFrame:timeRect];
    a.textAlignment = NSTextAlignmentCenter;
    a.font=[UIFont systemFontOfSize:12];
    a.text =[self timeChangge:self.time];

    //商品名称标签
    UILabel* b =[[UILabel alloc]initWithFrame:creditgoodnameRect];
    b.textAlignment = NSTextAlignmentCenter;
    b.font=[UIFont systemFontOfSize:12];
    b.text = self.creditGoodName;

    //商品数量标签
    UILabel* c =[[UILabel alloc]initWithFrame:creditGoodNumRect];
    c.textAlignment = NSTextAlignmentCenter;
    c.font=[UIFont systemFontOfSize:12];
    c.text = [NSString stringWithFormat:@"数量:%@" , self.creditGoodNum];

    //订单状态标签
    UILabel* d =[[UILabel alloc]initWithFrame:creditbillstateRect];
    d.textAlignment = NSTextAlignmentCenter;
    d.font=[UIFont systemFontOfSize:12];
    if ([self.creditbillstate isEqualToString:@"1"]) {
        d.text = @"订单待接受";
        [d setTextColor:[UIColor blueColor]];
        
    }else if ([self.creditbillstate isEqualToString:@"2"]) {
        d.text = @"订单已经确认";
        [d setTextColor:[UIColor redColor]];
        
    }else if ([self.creditbillstate isEqualToString:@"-1"]) {
        d.text = @"定单已经取消";
        [d setTextColor:[UIColor greenColor]];
        
    }else{
        d.text = @"订单已经确认";
        [d setTextColor:[UIColor redColor]];
    
    }


    //积分量标签
    UILabel* e =[[UILabel alloc]initWithFrame:totalCreditRect];
    e.textAlignment = NSTextAlignmentCenter;
    e.font=[UIFont systemFontOfSize:12];
    if ([self.creditbillstate isEqualToString:@"1"]) {
        e.text = [NSString stringWithFormat:@"%@积分",self.totalCredit];
        [e setTextColor:[UIColor blueColor]];
        
    }else if ([self.creditbillstate isEqualToString:@"2"]) {
        e.text = [NSString stringWithFormat:@"%@积分",self.totalCredit];
        [e setTextColor:[UIColor redColor]];
        
    }else if ([self.creditbillstate isEqualToString:@"-1"]) {
        e.text = [NSString stringWithFormat:@"%@积分",self.totalCredit];
        [e setTextColor:[UIColor greenColor]];
        
    }else{
       e.text = [NSString stringWithFormat:@"%@积分",self.totalCredit];
        [e setTextColor:[UIColor redColor]];
        
    }

    
    
    [self addSubview:a];
    [self addSubview:b];
    [self addSubview:c];
    [self addSubview:d];
    [self addSubview:e];


    
    
}
@end
