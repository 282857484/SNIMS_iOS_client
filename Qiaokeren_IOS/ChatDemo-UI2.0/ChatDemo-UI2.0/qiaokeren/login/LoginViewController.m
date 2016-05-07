/************************************************************
  *  * EaseMob CONFIDENTIAL 
  * __________________ 
  * Copyright (C) 2013-2014 EaseMob Technologies. All rights reserved. 
  *  
  * NOTICE: All information contained herein is, and remains 
  * the property of EaseMob Technologies.
  * Dissemination of this information or reproduction of this material 
  * is strictly forbidden unless prior written permission is obtained
  * from EaseMob Technologies.
  */

#import "LoginViewController.h"
#import "EMError.h"
#import "RegViewController.h"
#import "QiaokerenApplication.h"
#import "UtilsAll.h"
#import "JZLogin_c.h"
@interface LoginViewController ()<RegViewControllerDelegate,IChatManagerDelegate,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)doLogin:(id)sender;


@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupForDismissKeyboard];
    _usernameTextField.delegate = self;
    
//    [self initNetworkingDic];
    
    UIButton *_regButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 35)];
    [_regButton setTitle:@"注册" forState:UIControlStateNormal];
    [_regButton addTarget:self action:@selector(register) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_regButton];
}

//reg success之后
- (void)setQiaokerenID:(NSString *)value
{
//    _usernameTextField.text = value;
    NSString *msg = [[NSString alloc] initWithFormat:@"您的俏可人ID为：%@",value];

    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:msg
                          message:nil
                          delegate:nil
                          cancelButtonTitle:@"确定"
                          otherButtonTitles:nil];
    
    [alert show];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//点击登陆后的操作
- (void)loginWithUsername:(NSString *)username password:(NSString *)password
{
    [self showHudInView:self.view hint:NSLocalizedString(@"login.ongoing", @"Is Login...")];
    //异步登陆账号
    [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:username
                                                        password:password
                                                      completion:
     ^(NSDictionary *loginInfo, EMError *error) {
         [self hideHud];
         if (loginInfo && !error) {
             //设置是否自动登录
             [[EaseMob sharedInstance].chatManager setIsAutoLoginEnabled:YES];
             
             // 旧数据转换 (如果您的sdk是由2.1.2版本升级过来的，需要家这句话)
             [[EaseMob sharedInstance].chatManager importDataToNewDatabase];
             //获取数据库中数据
             [[EaseMob sharedInstance].chatManager loadDataFromDatabase];
             
             //获取群组列表
             [[EaseMob sharedInstance].chatManager asyncFetchMyGroupsList];
             
             //发送自动登陆状态通知
             [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@YES];
             
         }
         else
         {
             switch (error.errorCode)
             {
                 case EMErrorNotFound:
                     TTAlertNoTitle(error.description);
                     break;
                 case EMErrorNetworkNotConnected:
                     TTAlertNoTitle(NSLocalizedString(@"error.connectNetworkFail", @"No network connection!"));
                     break;
                 case EMErrorServerNotReachable:
                     TTAlertNoTitle(NSLocalizedString(@"error.connectServerFail", @"Connect to the server failed!"));
                     break;
                 case EMErrorServerAuthenticationFailure:
                     TTAlertNoTitle(error.description);
                     break;
                 case EMErrorServerTimeout:
                     TTAlertNoTitle(NSLocalizedString(@"error.connectServerTimeout", @"Connect to the server timed out!"));
                     break;
                 default:
                     TTAlertNoTitle(NSLocalizedString(@"login.fail", @"Login failure"));
                     break;
             }
         }
     } onQueue:nil];
}

//使用输入的用户名和用户密码登录到环信
//- (void)loginWithUsername:(NSString *)username password:(NSString *)password
//{
//    NSLog(@"-----------------",nil);
////    [self showHudInView:self.view hint:@"正在登录..."];
//    [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:username
//                                                        password:password
//                                                      completion:
//     ^(NSDictionary *loginInfo, EMError *error) {
//         [self hideHud];
////         [self showTipToUser:@"正在连接当中"];
//         if (loginInfo && !error) {
//             [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@YES];
//             EMError *error = [[EaseMob sharedInstance].chatManager importDataToNewDatabase];
//             if (!error) {
//                 error = [[EaseMob sharedInstance].chatManager loadDataFromDatabase];
//             }
//         }else {
//             switch (error.errorCode) {
//                 case EMErrorServerNotReachable:
////                     [self showTipToUser:@"连接服务器失败!"];
//                     TTAlertNoTitle(@"连接服务器失败!");
//                     NSLog(@"连接服务器失败!",nil);
//                     
//                     break;
//                 case EMErrorServerAuthenticationFailure:
////                     [self showTipToUser:@"error.description!"];
//                     TTAlertNoTitle(error.description);
//                     NSLog(@"error.description!",nil);
//                     break;
//                 case EMErrorServerTimeout:
////                     [self showTipToUser:@"连接服务器超时!"];
//                     TTAlertNoTitle(@"连接服务器超时!");
//                     NSLog(@"连接服务器超时!",nil);
//                     break;
//                 default:
////                     [self showTipToUser:@"登录失败"];
//                     TTAlertNoTitle(@"登录失败");
//                     NSLog(@"登录失败!",nil);
//                     break;
//             }
//         }
//     } onQueue:nil];
//}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if ([alertView cancelButtonIndex] != buttonIndex) {
        UITextField *nameTextField = [alertView textFieldAtIndex:0];
        if(nameTextField.text.length > 0)
        {
            [[EaseMob sharedInstance].chatManager setApnsNickname:nameTextField.text];
        }
    }
    
//    [self showHint:@"准备加载..."];
    [self loginWithUsername:_usernameTextField.text password:_passwordTextField.text];
}

//登录触发
- (IBAction)doLogin:(id)sender {
    
    if (![self isEmpty]) {
        [self.view endEditing:YES];
        if ([self.usernameTextField.text isChinese]) {
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"用户名不支持中文"
                                  message:nil
                                  delegate:nil
                                  cancelButtonTitle:@"确定"
                                  otherButtonTitles:nil];
            
            [alert show];
            
            return;
        }
//#if !TARGET_IPHONE_SIMULATOR
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"填写推送消息时使用的昵称" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//        [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
//        UITextField *nameTextField = [alert textFieldAtIndex:0];
//        nameTextField.text = self.usernameTextField.text;
//        [alert show];
//#elif TARGET_IPHONE_SIMULATOR
        
        int statue = [UtilsAll checkNetworkState];
        if (statue == 0) {
            [self showHint:@"请检查网络连接！"];
//            [self showTipToUser:@"请检查网络连接！"];
        }else{
            [self sendLoginMsg:_usernameTextField.text PWD:_passwordTextField.text];
            [self showHudInView:self.view hint:@"正在登录..."];
        }
        
//#endif
    }
}
-(void)sendLoginMsg:(NSString*)userId PWD:(NSString*)pwd{
    
    JZLogin_c *li = [JZLogin_c Jz_initialize];
    [li initWithInfo:@"JZLogin_c" Userid:@"0" Phone:userId Email:@"0" Code:pwd UploadTime:[UtilsAll getFormatTime]];
    NSDictionary *nsdic = [li toDictionary];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:nsdic time:@"2015" protocol:123 label:@"JZLogin_c"];
}

- (void)register
{
    RegViewController *regController = [[RegViewController alloc] init];
    regController.delegate = self;
    [self.navigationController pushViewController:regController animated:YES];
}


- (BOOL)isEmpty{
    BOOL ret = NO;
    NSString *username = _usernameTextField.text;
    NSString *password = _passwordTextField.text;
    if (username.length == 0 || password.length == 0) {
        ret = YES;
        [EMAlertView showAlertWithTitle:@"提示"
                                message:@"请输入账号和密码"
                        completionBlock:nil
                      cancelButtonTitle:NSLocalizedString(@"ok", @"OK")
                      otherButtonTitles:nil];
    }
    
    return ret;
}


#pragma  mark - TextFieldDelegate
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (textField == _usernameTextField) {
        _passwordTextField.text = @"";
    }
    
    return YES;
}


// 处理函数
- (void)dealLabel:(NetUnit*)nUnit{
    [self hideHud];
//    NSLog(@"hideHubhideHub......");
    if ([nUnit->cLabel isEqualToString:@"JZLogin_c"]) {
        NSString * json = nUnit->receiveString;
//                 NSLog(@"JZLogin_c－－－%@",json);
        //更新ui，解析json
        
        NSDictionary*dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:  NSUTF8StringEncoding ] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0 ];
        NSLog(@"$$$Content : %@",[dictionary objectForKey:@"Content"]);
        if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"1"]) {
//            NSString *userid = [[NSString alloc] initWithFormat:@"%@",[dictionary objectForKey:@"Userid"]];
//            
//            [self loginWithUsername:userid password:_passwordTextField.text];
            
            NSDictionary*dic;
            
            //判断是否能够组成字典
            NSString *str = [dictionary objectForKey:@"UserSelectDataToJSON"];
            if(str.length < 20){
                return;
            }
            
            NSArray* array = [NSJSONSerialization JSONObjectWithData:[[dictionary objectForKey:@"UserSelectDataToJSON"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil] ;
            //            NSLog(@"%lu",(unsigned long)[array count]);
            
            for (int i=0; i<[array count]; i++) {
                dic = [array  objectAtIndex:i];
                UserSeletData * usersdata = [UserSeletData instance2];
                [usersdata initWithInfo:@"成功了吧"
                                quserid:[[NSString alloc] initWithFormat:@"%@",[dic objectForKey:@"quserid"]]
                              qhigherid:[[NSString alloc] initWithFormat:@"%@",[dic objectForKey:@"qhigherid"]]
                                 qphone:[[NSString alloc] initWithFormat:@"%@",[dic objectForKey:@"qphone"]]
                              qpassword:[dic objectForKey:@"qpassword"]
                                qcardid:[dic objectForKey:@"qcardid"]
                              qusername:[dic objectForKey:@"qusername"]
                              qrealname:[dic objectForKey:@"qrealname"]
                                   qtel:[dic objectForKey:@"qtel"]
                                 qemail:[dic objectForKey:@"qemail"]
                                   qsex:[dic objectForKey:@"qsex"]
                                   qage:[dic objectForKey:@"qage"]
                           qshouquannum:[dic objectForKey:@"qshouquannum"]
                                qweixin:[dic objectForKey:@"qweixin"]
                                    qqq:[dic objectForKey:@"qqq"]
                             qinvitenum:[dic objectForKey:@"qinvitenum"]
                              qwangwang:[dic objectForKey:@"qwangwang"]
                                qtaobao:[dic objectForKey:@"qtaobao"]
                             qtaobaourl:[dic objectForKey:@"qtaobaourl"]
                                 qstate:[dic objectForKey:@"qstate"]
                            qformattime:[dic objectForKey:@"qformattime"]
                                 qlevel:[dic objectForKey:@"qlevel"]
                     qvideoaccessllevel:[dic objectForKey:@"qvideoaccessllevel"]
                           qhonestlevel:[dic objectForKey:@"qhonestlevel"]
                            qreceivemsg:[dic objectForKey:@"qreceivemsg"]
                      q_group_direct_id:[dic objectForKey:@"q_group_direct_id"]
                      q_group_higher_id:[dic objectForKey:@"q_group_higher_id"]
                      q_group_public_id:[dic objectForKey:@"q_group_public_id"]
                        q_group_same_id:[dic objectForKey:@"q_group_same_id"]
                              qgoodsnum:[dic objectForKey:@"qgoodsnum"]
                          blackloggoods:[dic objectForKey:@"blackloggoods"]
                          deliverygoods:[dic objectForKey:@"deliverygoods"]];
                //                NSLog(@"count123 = %d",[data count]);
                [QiaokerenApplication setUserSelectData:usersdata];
                [self loginWithUsername:[usersdata quserid] password:_passwordTextField.text];
            }
        }else{
            NSLog(@"手机号或密码错误start",nil);
            [self showHint:@"手机号或密码错误"];
//            [self showTipToUser:@"手机号或密码错误2"];
//            [self showMessage:@"手机号或密码错误3"];
            NSLog(@"手机号或密码错误end",nil);
//            [self showOkayCancelAlert:@"手机号或密码错误"];
            _passwordTextField.text = @"";
        }
    }
    
}

-(void)showMessage:(NSString *)message
{
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    UIView *showview =  [[UIView alloc]init];
    showview.backgroundColor = [UIColor blackColor];
    showview.frame = CGRectMake(1, 1, 1, 1);
    showview.alpha = 1.0f;
    showview.layer.cornerRadius = 5.0f;
    showview.layer.masksToBounds = YES;
    [window addSubview:showview];
    
    UILabel *label = [[UILabel alloc]init];
    //    CGSize LabelSize = [message sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:CGSizeMake(290, 9000)];
    
    NSDictionary *temattribute = @{NSFontAttributeName: [UIFont systemFontOfSize:13]};
    CGSize LabelSize = [message boundingRectWithSize:CGSizeMake(290, 9000) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:temattribute context:nil].size;
    label.frame = CGRectMake(10, 5, LabelSize.width, LabelSize.height);
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = 1;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:15];
    [showview addSubview:label];
    CGRect r = [ UIScreen mainScreen ].applicationFrame;
    CGFloat SCREEN_WIDTH = r.size.width;
    CGFloat SCREEN_HEIGHT = r.size.height;
    showview.frame = CGRectMake((SCREEN_WIDTH - LabelSize.width - 20)/2, SCREEN_HEIGHT - 100, LabelSize.width+20, LabelSize.height+10);
    [UIView animateWithDuration:1.5 animations:^{
        showview.alpha = 0;
    } completion:^(BOOL finished) {
        [showview removeFromSuperview];
    }];
}

@end
