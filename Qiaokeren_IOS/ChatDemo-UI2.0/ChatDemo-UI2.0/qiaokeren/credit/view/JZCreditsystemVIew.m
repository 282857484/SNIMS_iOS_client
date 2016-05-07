//
//  JZCreditsystemVIew.m
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-17.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//
#define APP_Frame_Height   [[UIScreen mainScreen] applicationFrame].size.height //应用程序的屏幕高度
#define App_Frame_Width    [[UIScreen mainScreen] applicationFrame].size.width  //应用程序的屏幕宽度

#import "JZCreditsystemVIew.h"
#import "JZCreditsystemVC.h"

@implementation JZCreditsystemVIew

@synthesize monthCredit; //月积分
@synthesize yearCredit; //年积分

@synthesize monthCreditLB; //顶部月积分标签
@synthesize BTmonthCreditLB ;//底部月积分标签
@synthesize yearCreditLB; //年积分标签

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    return self ;
    
}

-(id)initCGWithFrame:(CGRect)frame monthCredit:(NSString *)_monthCredit yearCredit:(NSString *)_yearCredit
{

    self = [super initWithFrame:frame];
    if (self) {
        
        self.monthCredit     = _monthCredit;
        self.yearCredit   = _yearCredit;
        
        
        
        self.userInteractionEnabled = YES;//可以响应
        [self iniSubviewsWithFrame:frame];
//        [self finishloading];
    }
    
    
    return self;


}


-(void)iniSubviewsWithFrame:(CGRect)frame
{
    CGFloat width = frame.size.width;
    //        CGFloat height = frame.size.height;
    CGRect monthCreditBGRect = CGRectMake(0, 0, width, 125); //顶部本月积分背景
    CGRect monthCreditRect = CGRectMake(0, 20, 80, 30); //顶部"本月积分:"
    CGRect monthCreditCTRect = CGRectMake(0, 50, 80, 50); //顶部本月积分内容
    CGRect jifenRect = CGRectMake(60, 70, 50, 20); //顶部“积分”
    CGRect BTmonthCreditCTRect = CGRectMake(0, 125, App_Frame_Width/2, 25);//本月积分内容
    CGRect BTmonthCreditRect = CGRectMake(0, 150, App_Frame_Width/2, 15);//"本月积分："
    CGRect BTyearCreditCTRect= CGRectMake(App_Frame_Width/2, 125, App_Frame_Width/2, 25);//"本年积分内容"
    CGRect BTyearCreditRect= CGRectMake(App_Frame_Width/2, 150, App_Frame_Width/2, 15);//"本年积分："
    

    
    //顶部本月积分背景
    UIView*monthCreditBG = [[UIView alloc]initWithFrame:monthCreditBGRect];
    UIColor *color = [UIColor colorWithRed:0.0 green:0.5 blue:1.0 alpha:1.0];
    monthCreditBG.backgroundColor = color;
    
    //  "本月积分："
    UILabel*labelDS=[[UILabel alloc]initWithFrame:monthCreditRect];
    labelDS.textAlignment = NSTextAlignmentCenter;
    labelDS.backgroundColor= [UIColor clearColor];
    labelDS.font=[UIFont systemFontOfSize:16];
    labelDS.text = @"本月积分";
    [labelDS setTextColor:[UIColor whiteColor]];
    
    //顶部本月积分内容
    monthCreditLB = [[UILabel alloc]initWithFrame:monthCreditCTRect];
    monthCreditLB.textAlignment = NSTextAlignmentCenter;
    monthCreditLB.backgroundColor= [UIColor clearColor];
    monthCreditLB.font=[UIFont systemFontOfSize:30];
    monthCreditLB.text = self.monthCredit;
    [monthCreditLB setTextColor:[UIColor whiteColor]];

    //  "积分"
    UILabel*jifen=[[UILabel alloc]initWithFrame:jifenRect];
    jifen.textAlignment = NSTextAlignmentCenter;
    jifen.font=[UIFont systemFontOfSize:12];
    jifen.text = @"积分";
    [jifen setTextColor:[UIColor whiteColor]];
    
    //底部本月积分
    BTmonthCreditLB = [[UILabel alloc]initWithFrame:BTmonthCreditCTRect];
    BTmonthCreditLB.textAlignment = NSTextAlignmentCenter;
    BTmonthCreditLB.font=[UIFont systemFontOfSize:14];
    BTmonthCreditLB.text = self.monthCredit;
     [BTmonthCreditLB setTextColor:[UIColor greenColor]];
  
    //  "本月积分："
    UILabel*labelNum=[[UILabel alloc]initWithFrame:BTmonthCreditRect];
    labelNum.textAlignment = NSTextAlignmentCenter;
    labelNum.font=[UIFont systemFontOfSize:12];
    labelNum.text = @"本月积分";
    
    
    //底部本年积分
    yearCreditLB = [[UILabel alloc]initWithFrame:BTyearCreditCTRect];
    yearCreditLB.textAlignment = NSTextAlignmentCenter;
    yearCreditLB.font=[UIFont systemFontOfSize:12];
    yearCreditLB.text = self.yearCredit;
    [yearCreditLB setTextColor:[UIColor redColor]];
    
    //  "本年积分："
    UILabel*labelyelb=[[UILabel alloc]initWithFrame:BTyearCreditRect];
    labelyelb.textAlignment = NSTextAlignmentCenter;
    labelyelb.font=[UIFont systemFontOfSize:12];
    labelyelb.text = @"年度积分";

    
    //显示分割线
    CGRect carveUpRect = CGRectMake(3, 169.7, width-3,0.3);
    UILabel* carveup = [[UILabel alloc]initWithFrame:carveUpRect];
    carveup.layer.borderColor = [UIColor lightGrayColor].CGColor;
    carveup.layer.borderWidth = 0.5;
    
    //显示分割线
    CGRect carveUpcenterRect = CGRectMake(App_Frame_Width/2, 130, 0.5,35);
    UILabel* carveupcenter = [[UILabel alloc]initWithFrame:carveUpcenterRect];
    carveupcenter.layer.borderColor = [UIColor lightGrayColor].CGColor;
    carveupcenter.layer.borderWidth = 0.5;
    
    [self addSubview:monthCreditBG];
    [self addSubview:labelDS];
    [self addSubview:monthCreditLB];
    [self addSubview:jifen];
    [self addSubview:BTmonthCreditLB];
    [self addSubview:labelNum];
    [self addSubview:carveup];
    [self addSubview:carveupcenter];
    [self addSubview:yearCreditLB];
    [self addSubview:labelyelb];
    
}

//-(void)finishloading
//{
//    [JZCreditsystemVC sharedActivityView];
//    __block  NSString* n ;
//    __block  NSString* a ;
//    [[JZCreditsystemVC sharedActivityView] getMonthYear:^(NSString *month, NSString *Year) {
//        n = month;
//        a = Year;
//        NSLog(@"%@+++++++%@",n,a);
//    }     ];
//    
//        monthCreditLB.text = n;
//        BTmonthCreditLB.text = n;
//        yearCreditLB.text = a;
//}


@end
