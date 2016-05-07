//
//  OrderInfoViewController.m
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-22.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "OrderInfoViewController.h"
#import "GoodsDetailViewController.h"
@interface OrderInfoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *orderNumber;
@property (weak, nonatomic) IBOutlet UITextField *postalCode;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *username;

@end

@implementation OrderInfoViewController
NSString *orderNumber;
NSString *goodsName;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"信息补全";
    
//    NSLog(@"您订购了： %@",orderNumber);
    NSString *str = [[NSString alloc] initWithFormat:@"订购产品：%@  数量：%@，请填写您的信息",goodsName,orderNumber];
    _orderNumber.text = str;
    UIButton *_regButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 35)];
    [_regButton setTitle:@"完成" forState:UIControlStateNormal];
    [_regButton addTarget:self action:@selector(finishOrderInfo) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_regButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)finishOrderInfo
{
    NSString *postCode = [@"邮编：" stringByAppendingString:_postalCode.text];
    NSString *address = [@" 地址：" stringByAppendingString:_address.text];
    NSString *username = [@" 收件人：" stringByAppendingString:_username.text];
    NSString *postadd = [postCode stringByAppendingString:address];
    NSString *str = [postadd stringByAppendingString:username];
    
    if (_postalCode.text.length == 0 || _address.text.length == 0 || _username.text.length == 0) {
        [EMAlertView showAlertWithTitle:@"提示"
                                message:@"请将基本信息补全"
                        completionBlock:nil
                      cancelButtonTitle:NSLocalizedString(@"ok", @"确定")
                      otherButtonTitles:nil];
        return;
    }
    
//    NSLog(@"输出：－－－%@",str);
    [self.delegate  changeValue:str];
    [self.navigationController popViewControllerAnimated:YES];
}

//传递用户订乐多少订货
- (void)setOrderNumber:(NSString*)number Name:(NSString *)name{
    orderNumber = number;
    goodsName = name;
}
@end
