//
//  CGDetailView.m
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-16.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import "CGDetailView.h"
#import "CGDetailViewController.h"
#import "UIImageView+DispatchLoad.h"
#import "QiaokerenApplication.h"
#import "UtilsAll.h"


@implementation CGDetailView

@synthesize imageUrl; //图片路径
@synthesize needCredit; //所需要的积分
@synthesize creditGoodName; //商品的名称
@synthesize creditGoodDescribe;//商品描述

@synthesize CGname; //商品名称标签
@synthesize CGImage; //头部图片视图
@synthesize goodsDescribe; //商品描述标签
@synthesize ordernumber; //兑换数量标签
@synthesize ordeTotalCredit; //总共需要的积分标签
@synthesize btnMilus;//数量减少按钮
@synthesize btnPlus;//数量增加按钮
@synthesize btnOrder;//提交订单按钮

@synthesize address;//邮寄地址文本框
@synthesize username;//订单提交人的姓名文本框

@synthesize cliFinDelegate;


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    return self ;
    
}
-(id)initCGWithFrame:(CGRect)frame imageUrl:(NSString *)_imageUrl needCredit:(NSString *)_needCredit creditGoodName:(NSString *)_creditGoodName creditGoodDescribe:(NSString *)_creditGoodDescribe
{
    self = [super initWithFrame:frame];
    if (self) {
 
        self.imageUrl     = _imageUrl;
        self.needCredit   = _needCredit;
        self.creditGoodName  = _creditGoodName;
        self.creditGoodDescribe = _creditGoodDescribe;
        
        
        self.userInteractionEnabled = YES;//可以响应
        [self iniSubviewsWithFrame:frame];
    }
    
    
    return self;
}


-(void)iniSubviewsWithFrame:(CGRect)frame
{
        CGFloat width = frame.size.width;
//        CGFloat height = frame.size.height;
    CGRect CGimageRect = CGRectMake(0, 0, width, 125); //顶部图片区域
    CGRect CGDSRect= CGRectMake(5, 130, 80, 25);//"商品描述："
    CGRect DescribeRect = CGRectMake(90, 130, 180, 25);//商品描述的具体内容
    CGRect CGNumRect= CGRectMake(5, 160, 80, 25);//"商品数量："
    CGRect CGMiRect= CGRectMake(110, 160, 30, 25);//左边减少的按钮的位置
    CGRect CGODNumRect= CGRectMake(140, 160, 30, 25);//中间具体数量的标签
    CGRect CGPlRect= CGRectMake(170, 160, 30, 25);//右边增加的按钮的位置
    CGRect TotalNumRect = CGRectMake(5,190 , 80, 25);//"总计："
    CGRect TotalNCRect = CGRectMake(110,190 , 100, 25);//"总计内容"
    CGRect BtnOrderRect= CGRectMake(260, 190, 40, 25);//确定提交订单的按钮
    
    //  顶部图片
    CGImage = [[UIImageView alloc]initWithFrame:CGimageRect];
//    CGImage.image = [UIImage imageNamed:imageUrl];
   [CGImage setImageFromUrl:self.imageUrl completion:^(void) {}];

   //  "商品描述："
    UILabel*labelDS=[[UILabel alloc]initWithFrame:CGDSRect];
    labelDS.textAlignment = NSTextAlignmentCenter;
    labelDS.font=[UIFont systemFontOfSize:12];
    labelDS.text = @"商品描述:";
    
    //商品描述具体内容
    goodsDescribe=[[UILabel alloc]initWithFrame:DescribeRect];
    goodsDescribe.textAlignment = NSTextAlignmentCenter;
    goodsDescribe.font=[UIFont systemFontOfSize:12];
    goodsDescribe.text = self.creditGoodDescribe;
    
    //显示分割线
    CGRect carveUpRect = CGRectMake(3, 155, width-3,0.5);
    UILabel* carveup = [[UILabel alloc]initWithFrame:carveUpRect];
    carveup.layer.borderColor = [UIColor lightGrayColor].CGColor;
    carveup.layer.borderWidth = 0.5;
    

    //  "数量："
    UILabel*labelNum=[[UILabel alloc]initWithFrame:CGNumRect];
    labelNum.textAlignment = NSTextAlignmentCenter;
    labelNum.font=[UIFont systemFontOfSize:12];
    labelNum.text = @"数量:";
    
    //左边减少的按钮
    btnMilus = [[UIButton alloc] initWithFrame:CGMiRect];
    [btnMilus setTitle:@"" forState:UIControlStateNormal];
    [btnMilus setBackgroundImage:[UIImage imageNamed: @"z_minus.png"] forState:UIControlStateNormal];
    [btnMilus addTarget:self action:@selector(MilusOrderAction) forControlEvents:UIControlEventTouchUpInside];
    
    //中间数量的标签
    ordernumber=[[UILabel alloc]initWithFrame:CGODNumRect];
    ordernumber.textAlignment = NSTextAlignmentCenter;
    ordernumber.font=[UIFont systemFontOfSize:12];
    ordernumber.layer.borderColor = [UIColor lightGrayColor].CGColor;//边框颜色,要为CGColor
    ordernumber.layer.borderWidth = 1;//边框宽度
    ordernumber.layer.cornerRadius = 3;
    ordernumber.text = @"1";
    
    //右边增加数量的按钮
    btnPlus = [[UIButton alloc] initWithFrame:CGPlRect];
    [btnPlus setTitle:@"" forState:UIControlStateNormal];
    [btnPlus setBackgroundImage:[UIImage imageNamed: @"z_plus.png"] forState:UIControlStateNormal];
    [btnPlus addTarget:self action:@selector(PlusOrderAction) forControlEvents:UIControlEventTouchUpInside];
   
    //  "总计："
    UILabel*labelTotalNum=[[UILabel alloc]initWithFrame:TotalNumRect];
    labelTotalNum.textAlignment = NSTextAlignmentCenter;
    labelTotalNum.font=[UIFont systemFontOfSize:12];
    labelTotalNum.text = @"总计:";
    
    //总计内容：
    ordeTotalCredit = [[UILabel alloc]initWithFrame:TotalNCRect];
    ordeTotalCredit.textAlignment = NSTextAlignmentCenter;
    ordeTotalCredit.font=[UIFont systemFontOfSize:12];
    NSString *str = [[NSString alloc] initWithFormat:@"%@积分",self.needCredit];
    ordeTotalCredit.text = str;
    
    
    //确定完成提交订单的按钮
    btnOrder = [UIButton buttonWithType:UIButtonTypeCustom];//自定义类型
    btnOrder.frame = BtnOrderRect;
    [btnOrder setTitle:@"完成" forState:UIControlStateNormal];
     [btnOrder.titleLabel setFont:[UIFont boldSystemFontOfSize:12]];
    UIColor *color = [UIColor colorWithRed:0.0 green:0.5 blue:1.0 alpha:1.0];
     [btnOrder setTitleColor:color forState:UIControlStateNormal];
//    btnOrder.titleLabel.backgroundColor = [UIColor blueColor];
    [btnOrder.layer setMasksToBounds:YES];
    [btnOrder.layer setCornerRadius:10.0]; //设置矩形四个圆角半径
    [btnOrder.layer setBorderWidth:1.0];
     btnOrder.layer.borderColor =  [UIColor lightGrayColor].CGColor;
    [btnOrder addTarget:self action:@selector(finishOrderInfo) forControlEvents:UIControlEventTouchUpInside];
    
    //显示分割线
    CGRect bottomcarveUpRect = CGRectMake(10, 215, width-10,0.5);
    UILabel* bottomcarveup = [[UILabel alloc]initWithFrame:bottomcarveUpRect];
    bottomcarveup.layer.borderColor = [UIColor lightGrayColor].CGColor;
    bottomcarveup.layer.borderWidth = 0.5;
    
    
    [self addSubview:CGImage];
    [self addSubview:labelDS];
    [self addSubview:goodsDescribe];
    [self addSubview:carveup];
    [self addSubview:labelNum];
    [self addSubview:btnMilus];
    [self addSubview:ordernumber];
    [self addSubview:btnPlus];
    [self addSubview:labelTotalNum];
    [self addSubview:ordeTotalCredit];
    [self addSubview:btnOrder];
    [self addSubview:bottomcarveup];

}

- (void)MilusOrderAction
{
    NSString *strOrderNum = ordernumber.text;
    long num = [strOrderNum integerValue];
    num = num-1;
    if(num < 1){
        num = 1;
    }
    long total = [self.needCredit integerValue]*num;
    ordeTotalCredit.text = [[NSString alloc] initWithFormat:@"%ld积分",total];
    ordernumber.text = [[NSString alloc] initWithFormat:@"%ld",num];
}

- (void)PlusOrderAction
{
    NSString *strOrderNum = ordernumber.text;
    long num = [strOrderNum integerValue];
    num = num+1;
    if(num < 1){
        num = 1;
    }
    long total = [self.needCredit integerValue]*num;
    ordeTotalCredit.text = [[NSString alloc] initWithFormat:@"%ld积分",total];
    ordernumber.text = [[NSString alloc] initWithFormat:@"%ld",num];
}

-(void)finishOrderInfo
{
   __block  NSString* n = nil;
   __block  NSString* a = nil;
    __block  NSString* gd = nil;
    [[CGDetailViewController sharedActivityView] getNameAdress:^(NSString *name, NSString *adress, NSString *gi) {
        n = name;
        a = adress;
        gd = gi;
    }
     
    ];
    if (n && a && gd &&cliFinDelegate && [cliFinDelegate respondsToSelector:@selector(CGDetailViewDidClickedFInish:)]) {
        addCreditBil_C * CreBil = [addCreditBil_C Jz_initialize];
        UserSeletData * userdata = [QiaokerenApplication getUserSelectData];
//        NSLog(@"%@+_+_+_+_+_+_+_+_+_+_+",[userdata qhigherid]);
         NSString* totalCredit = [NSString stringWithFormat:@"%d", ([self.needCredit  intValue]*[self.ordernumber.text intValue])];
        
         [CreBil  initWithInfo:@"创建账单"
                   UserID:[QiaokerenApplication getAccountNumber]
               UploadTime:[UtilsAll getFormatTime]
                  goodsid:gd
           upmasteruserid:[userdata qhigherid]
                timestamp:[UtilsAll getFormatTime]
               billstatus:@"1"
              goodsperval:self.needCredit
              goodsnumber:self.ordernumber.text
                 location:totalCredit
              sendaddress:n  //姓名
           receiveaddress:a  //地址
           deliverynumber:@"月积分"
              deliveryway:self.creditGoodName
                cutmapres:@"0"
               totalprice:@"0"
               submittime:[UtilsAll getFormatTime]
               accepttime:@"0"
                sendmoney:@"0"
            sendgoodstime:@"0"
         receivegoodstime:@"0"
                     mark:@"0"
                     time:[UtilsAll getFormatTime]];
        [self.cliFinDelegate CGDetailViewDidClickedFInish:CreBil];

    }
    
}

@end
