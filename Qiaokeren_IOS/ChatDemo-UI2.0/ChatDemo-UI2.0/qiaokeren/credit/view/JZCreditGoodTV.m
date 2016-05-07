//
//  JZCreditGoodTV.m
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-14.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import "JZCreditGoodTV.h"
#import "UIImageView+DispatchLoad.h"
@implementation JZCreditGoodTV

@synthesize imageUrl;
@synthesize needCredit;
@synthesize creditGoodName;
@synthesize creditgoodtype;
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    return self ;
    
}

-(id)initCGWithFrame:(CGRect)frame imageUrl:(NSString *)_imageUrl needCredit:(NSString *)_needCredit creditGoodName:(NSString *)_creditGoodName creditgoodtype:(NSString*)_creditgoodtype
{
    self = [super initWithFrame:frame];
    if (self) {
        //        peopleNum = _peopleNum;
        self.imageUrl     = _imageUrl;
        self.needCredit   = _needCredit;
        self.creditGoodName  = _creditGoodName;
        self.creditgoodtype = _creditgoodtype;
        self.userInteractionEnabled = YES;
        [self iniSubviewsWithFrame:frame];
    }


    return self;
}

-(void)iniSubviewsWithFrame:(CGRect)frame
{
//    CGFloat width = frame.size.width;
//    CGFloat height = frame.size.height;
    CGRect imageRect = CGRectMake(10, 10, 100, 80);
    CGRect nameRect = CGRectMake(120, 15, 180, 10);
    CGRect creditRect = CGRectMake(140,60 , 50, 10);
    CGRect goodTypeRect = CGRectMake(190,60 , 30, 10);
    CGRect goodTypeCTRect = CGRectMake(220,60 , 50, 10);

    UIImageView*imageView = [[UIImageView alloc]initWithFrame:imageRect];
//    imageView.image = [UIImage imageNamed:imageUrl];
    [imageView setImageFromUrl:imageUrl completion:^(void) {}];

//    imageView.layer.masksToBounds =YES;
//    imageView.layer.cornerRadius =60;

    
    UILabel*labelName =[[UILabel alloc]initWithFrame:nameRect];
    labelName.textAlignment = NSTextAlignmentCenter;
    labelName.font=[UIFont systemFontOfSize:12];
    labelName.text = creditGoodName;
    
    UILabel*labelCredit = [[UILabel alloc]initWithFrame:creditRect];
    labelCredit.textAlignment = NSTextAlignmentCenter;
    labelCredit.font=[UIFont systemFontOfSize:10];
    labelCredit.text = [NSString stringWithFormat:@"%@积分",needCredit];
    
    UILabel*labelgoodtype =[[UILabel alloc]initWithFrame:goodTypeRect];
    labelgoodtype.textAlignment = NSTextAlignmentCenter;
    labelgoodtype.font=[UIFont systemFontOfSize:12];
    labelgoodtype.text = @"类型:";
    
    UILabel*labelgoodtypeCT =[[UILabel alloc]initWithFrame:goodTypeCTRect];
    labelgoodtypeCT.textAlignment = NSTextAlignmentCenter;
    labelgoodtypeCT.font=[UIFont systemFontOfSize:12];
    if([creditgoodtype isEqualToString:@"1"]){
    labelgoodtypeCT.text = @"月积分";
    }
    if([creditgoodtype isEqualToString:@"2"]){
        labelgoodtypeCT.text = @"年积分";
    }
    
    
    CGRect carveUpRect = CGRectMake(120, 40, 180,0.5);
    UILabel* carveup = [[UILabel alloc]initWithFrame:carveUpRect];
    carveup.layer.borderColor = [UIColor lightGrayColor].CGColor;
    carveup.layer.borderWidth = 0.5;

    [self addSubview:carveup];
    [self addSubview:imageView];
    [self addSubview:labelName];
    [self addSubview:labelCredit];
    [self addSubview:labelgoodtype];
    [self addSubview:labelgoodtypeCT];


    
}
@end
