//
//  RegViewController.m
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-16.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "RegViewController.h"
#import "JZVaidate_c.h"
#import "QiaokerenApplication.h"
#import "UtilsAll.h"
#import "LoginViewController.h"
#import "JZRegister_C.h"
#import "JZgetQUserInfo_c.h"
@interface RegViewController ()<IChatManagerDelegate,UITextFieldDelegate>
@property (strong, nonatomic) UIColor *colorUsing;
@property (strong, nonatomic) UIButton *regButton;//立即注册按钮
@property (strong, nonatomic) UILabel *regStep1;
@property (strong, nonatomic) UILabel *regStep2;
@property (strong, nonatomic) UITextField *regUserPhone;//手机号
@property (strong, nonatomic) UIButton *btnGetCode;//获取验证码按钮
@property (strong, nonatomic) UITextField *regUserCode;//验证码输入框
@property (strong, nonatomic) UIButton *btnSendCode;//发送注册码按钮

@property (strong, nonatomic) NSString *regUserSex;
@property (strong, nonatomic) UIColor *colorSexSelecter;
@property (strong, nonatomic) UIColor *colorSexUnSelecter;
@property (strong, nonatomic) UILabel *labelSex;
@property (strong, nonatomic) UIButton *btnUserMan;
@property (strong, nonatomic) UIButton *btnUserWoMan;
@property (strong, nonatomic) UITextField *regUserUserName;
@property (strong, nonatomic) UITextField *regUserRealName;
@property (strong, nonatomic) UITextField *regUserCardId;
@property (strong, nonatomic) UITextField *regUserPassWord;
@property (strong, nonatomic) UITextField *regUserTel;
@property (strong, nonatomic) UITextField *regUserEmail;
@property (strong, nonatomic) UITextField *regUserAge;
@property (strong, nonatomic) UITextField *regUserShouQuanNum;
@property (strong, nonatomic) UITextField *regUserWeiXinId;
@property (strong, nonatomic) UITextField *regUserQQ;
@property (strong, nonatomic) UITextField *regUserInviteNum;
@property (strong, nonatomic) UITextField *regUserJingShouTotal;
@property (strong, nonatomic) UITextField *regUserJiYaTotal;
@property (strong, nonatomic) UITextField *regUserChuHuoTotal;
@end

@implementation RegViewController

- (void)viewDidLoad {
    // Do any additional setup after loading the view.
    [super viewDidLoad];
    self.title = @"注册";
//    [self initNetworkingDic];
    _regUserSex = @"1";//1代表男生
    
    _regButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 35)];
    [_regButton setTitle:@"立即注册" forState:UIControlStateNormal];
    [_regButton addTarget:self action:@selector(regRightNow) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_regButton];
    _regButton.hidden = YES;
    [_regButton resignFirstResponder];
    
    int screemWidth = self.view.frame.size.width-10;
    UIColor *colorNormal = [UIColor colorWithRed:0  green:0  blue:0 alpha:1.0];
    _colorUsing = [UIColor colorWithRed:89.0f/255.0f  green:126.0f/255.0f  blue:78.0f/255.0f alpha:1.0];
    _colorSexSelecter = [UIColor colorWithRed:67.0f/255.0f  green:132.0f/255.0f  blue:243.0f/255.0f alpha:1.0];
    _colorSexUnSelecter = [UIColor colorWithRed:255.0f/255.0f  green:255.0f/255.0f  blue:255.0f/255.0f alpha:1.0];
    
    _regStep1 = [[UILabel alloc] initWithFrame:CGRectMake(5, 70, screemWidth/2-5, 30)];
    _regStep1.text = @"1 填写手机号进行验证 ->";
    _regStep1.font = [UIFont fontWithName:@"Helvetica" size:12];
    _regStep1.textColor = _colorUsing;
    
    _regStep2 = [[UILabel alloc] initWithFrame:CGRectMake(screemWidth/2+5, 70, screemWidth/2-5, 30)];
    _regStep2.text = @"2 填写其他基本信息";
    _regStep2.font = [UIFont fontWithName:@"Helvetica" size:12];
    _regStep2.textColor = colorNormal;
    [self.view addSubview:_regStep1];
    [self.view addSubview:_regStep2];
    
    _regUserPhone = [self textField:@"请输入手机号码" X:5 Y:125 W:screemWidth-120 H:40];
    _btnGetCode = [[UIButton alloc] initWithFrame:CGRectMake(screemWidth-120, 125, 160, 40)];
    [_btnGetCode setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_btnGetCode setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btnGetCode addTarget:self action:@selector(getMobileCode) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_regUserPhone];
    [self.view addSubview:_btnGetCode];
    
    _regUserCode = [self textField:@"请输入验证码" X:5 Y:170 W:screemWidth-80 H:40];
    _btnSendCode = [[UIButton alloc] initWithFrame:CGRectMake(screemWidth-80, 170, 120, 40)];
    [_btnSendCode setTitle:@"发送" forState:UIControlStateNormal];
    [_btnSendCode setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btnSendCode addTarget:self action:@selector(sendMobileCode) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_regUserCode];
    [self.view addSubview:_btnSendCode];
    _regUserCode.hidden = YES;
    _btnSendCode.hidden = YES;
    
    
    //过啦短信验证码之后的
    // 单选按钮组
    _labelSex = [[UILabel alloc] initWithFrame:CGRectMake(5, 100, 50, 20)];
    _labelSex.text = @"性别";
    _btnUserMan = [[UIButton alloc] initWithFrame:CGRectMake(65, 100, 40, 20)];
    [_btnUserMan setTitle:@"男" forState:UIControlStateNormal];
    _btnUserMan.backgroundColor = _colorSexSelecter;
    [_btnUserMan setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btnUserMan addTarget:self action:@selector(selectUserSexMan) forControlEvents:UIControlEventTouchUpInside];
    _btnUserWoMan = [[UIButton alloc] initWithFrame:CGRectMake(125, 100, 40, 20)];
    [_btnUserWoMan setTitle:@"女" forState:UIControlStateNormal];
    [_btnUserWoMan setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _btnUserWoMan.backgroundColor = _colorSexUnSelecter;
    [_btnUserWoMan addTarget:self action:@selector(selectUserSexWoMan) forControlEvents:UIControlEventTouchUpInside];
    
    _regUserUserName = [self textField:@"用户名" X:5 Y:120 W:screemWidth H:25];
    _regUserRealName = [self textField:@"真实姓名" X:5 Y:145 W:screemWidth H:25];
//    _regUserCardId = [self textField:@"身份号" X:5 Y:170 W:screemWidth H:25];
    _regUserPassWord = [self textField:@"密码" X:5 Y:170 W:screemWidth H:25];
//    _regUserTel = [self textField:@"电话" X:5 Y:220 W:screemWidth H:25];
//    _regUserEmail = [self textField:@"邮箱" X:5 Y:245 W:screemWidth H:25];
    _regUserAge = [self textField:@"年龄" X:5 Y:195 W:screemWidth H:25];
//    _regUserShouQuanNum = [self textField:@"授权号" X:5 Y:295 W:screemWidth H:25];
    _regUserWeiXinId = [self textField:@"微信号" X:5 Y:220 W:screemWidth H:25];
//    _regUserQQ = [self textField:@"qq" X:5 Y:345 W:screemWidth H:25];
    _regUserInviteNum = [self textField:@"邀请码" X:5 Y:245 W:screemWidth H:25];
//    _regUserJingShouTotal = [self textField:@"经手货物量" X:5 Y:395 W:screemWidth H:25];
//    _regUserJiYaTotal = [self textField:@"积压获取量" X:5 Y:420 W:screemWidth H:25];
//    _regUserChuHuoTotal = [self textField:@"出货量" X:5 Y:445 W:screemWidth H:25];
    [self.view addSubview:_labelSex];
    [self.view addSubview:_btnUserMan];
    [self.view addSubview:_btnUserWoMan];
    [self.view addSubview:_regUserUserName];
    [self.view addSubview:_regUserRealName];
//    [self.view addSubview:_regUserCardId];
    [self.view addSubview:_regUserPassWord];
//    [self.view addSubview:_regUserTel];
//    [self.view addSubview:_regUserEmail];
    [self.view addSubview:_regUserAge];
//    [self.view addSubview:_regUserShouQuanNum];
    [self.view addSubview:_regUserWeiXinId];
//    [self.view addSubview:_regUserQQ];
    [self.view addSubview:_regUserInviteNum];
//    [self.view addSubview:_regUserJingShouTotal];
//    [self.view addSubview:_regUserJiYaTotal];
//    [self.view addSubview:_regUserChuHuoTotal];
    _labelSex.hidden = YES;
    _btnUserMan.hidden = YES;
    _btnUserWoMan.hidden = YES;
    _regUserUserName.hidden = YES;
    _regUserRealName.hidden = YES;
    _regUserCardId.hidden = YES;
    _regUserPassWord.hidden = YES;
    _regUserTel.hidden = YES;
    _regUserEmail.hidden = YES;
    _regUserAge.hidden = YES;
    _regUserShouQuanNum.hidden = YES;
    _regUserWeiXinId.hidden = YES;
    _regUserQQ.hidden = YES;
    _regUserInviteNum.hidden = YES;
    _regUserJingShouTotal.hidden = YES;
    _regUserJiYaTotal.hidden = YES;
    _regUserChuHuoTotal.hidden = YES;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
    
}

- (UITextField *)textField:(NSString *)hintStr X:(int)x Y:(int)y W:(int)w H:(int)h
{
    UITextField *_textField;
    if (_textField == nil) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(x, y, w, h)];
        _textField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        _textField.layer.borderWidth = 0.5;
        _textField.layer.cornerRadius = 3;
        _textField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 30)];
        _textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _textField.leftViewMode = UITextFieldViewModeAlways;
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.font = [UIFont systemFontOfSize:15.0];
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.placeholder = hintStr;
        _textField.returnKeyType = UIReturnKeyDone;
        _textField.delegate = self;
    }
    
    return _textField;
}


#pragma mark - action


//获取手机短信验证码
- (void)getMobileCode
{
//    _regStep2.textColor = _colorUsing;
//    [self regVisible];
    NSString* phone = _regUserPhone.text;
    if(![self isMobileNumber:phone]){
        [EMAlertView showAlertWithTitle:@"提示"
                                message:@"您输入的手机号有误"
                        completionBlock:nil
                      cancelButtonTitle:NSLocalizedString(@"ok", @"OK")
                      otherButtonTitles:nil];
        return;
    }
    
    [self sendValidatePhoneMsg:phone];
    [self showHudInView:self.view hint:@"正在获取..."];
}
///// 手机号码的有效性判断
//检测是否是手机号码
- (BOOL)isMobileNumber:(NSString *)mobileNum
{
    if(mobileNum.length <= 0 || mobileNum.length > 11){
        return NO;
    } else if ([self isPureInt:mobileNum]) {
        return YES;
    } else {
        return NO;
    }
//    /**
//     * 手机号码
//     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
//     * 联通：130,131,132,152,155,156,185,186
//     * 电信：133,1349,153,180,189
//     */
//    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
//    /**
//     10         * 中国移动：China Mobile
//     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
//     12         */
//    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
//    /**
//     15         * 中国联通：China Unicom
//     16         * 130,131,132,152,155,156,185,186
//     17         */
//    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
//    /**
//     20         * 中国电信：China Telecom
//     21         * 133,1349,153,180,189
//     22         */
//    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
//    /**
//     25         * 大陆地区固话及小灵通
//     26         * 区号：010,020,021,022,023,024,025,027,028,029
//     27         * 号码：七位或八位
//     28         */
//    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
//    NSString * NEW = @"^1\\d{10}$";
//    
//    
//    NSPredicate * regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
//    NSPredicate * regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
//    NSPredicate * regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
//    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
//    NSPredicate *regextestnew = [NSPredicate predicateWithFormat:@"name BEGINSWITH %@", NEW];
//    
//
//    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
//        || ([regextestcm evaluateWithObject:mobileNum] == YES)
//        || ([regextestct evaluateWithObject:mobileNum] == YES)
//        || ([regextestcu evaluateWithObject:mobileNum] == YES)
//        || ([regextestnew evaluateWithObject:NEW] == YES))
//    {
//        return YES;
//    }
//    else
//    {
//        return NO;
//    }
}
- (BOOL)isPureInt:(NSString *)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

//发送短信验证码
- (void)sendMobileCode
{
    
    if(_regUserCode.text.length == 0){
        [EMAlertView showAlertWithTitle:@"提示"
                                message:@"请输入验证码"
                        completionBlock:nil
                      cancelButtonTitle:NSLocalizedString(@"ok", @"OK")
                      otherButtonTitles:nil];
        return;
    }
    
    [self sendUserVerificationCodeMsg:_regUserCode.text ValidatePhone:ValidatePhone];
    [self showHudInView:self.view hint:@"正在发送..."];
}

-(void)regVisible{
    _regUserPhone.hidden = YES;
    _btnGetCode.hidden = YES;
    _regUserCode.hidden = YES;
    _btnSendCode.hidden = YES;
    _regStep2.textColor = _colorUsing;
    
    _regButton.hidden = NO;
    _labelSex.hidden = NO;
    _btnUserMan.hidden = NO;
    _btnUserWoMan.hidden = NO;
    _regUserUserName.hidden = NO;
    _regUserRealName.hidden = NO;
    _regUserCardId.hidden = NO;
    _regUserPassWord.hidden = NO;
    _regUserTel.hidden = NO;
    _regUserEmail.hidden = NO;
    _regUserAge.hidden = NO;
    _regUserShouQuanNum.hidden = NO;
    _regUserWeiXinId.hidden = NO;
    _regUserQQ.hidden = NO;
    _regUserInviteNum.hidden = NO;
    _regUserJingShouTotal.hidden = NO;
    _regUserJiYaTotal.hidden = NO;
    _regUserChuHuoTotal.hidden = NO;
}
NSString *ValidatePhone = @"";
-(void)sendValidatePhoneMsg:(NSString*)phone{
    ValidatePhone = phone;
    JZVaidate_c *li = [JZVaidate_c Jz_initialize];
    [li initWithInfo:@"" UserID:[QiaokerenApplication getAccountNumber] UploadTime:[UtilsAll getFormatTime] sendId:@"0" sendPhone:phone sendCode:@"0" sendMark:@"1"];
    NSDictionary *nsdic = [li toDictionary];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:nsdic time:@"122112" protocol:12212 label:@"JZVaidate_c"];
}

-(void)sendUserVerificationCodeMsg:(NSString*)code ValidatePhone:(NSString*)phone{
    JZVaidate_c *li = [JZVaidate_c Jz_initialize];
    [li initWithInfo:@"" UserID:phone UploadTime:[UtilsAll getFormatTime] sendId:@"0" sendPhone:phone sendCode:code sendMark:@"3"];
    NSDictionary *nsdic = [li toDictionary];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:nsdic time:@"122112" protocol:12212 label:@"JZVaidate_c"];
}

//单选按钮：性别男
- (void)selectUserSexMan
{
    _btnUserMan.backgroundColor = _colorSexSelecter;
    _btnUserWoMan.backgroundColor = _colorSexUnSelecter;
    _regUserSex = @"1";
}

//单选按钮：性别女
- (void)selectUserSexWoMan
{
    _btnUserWoMan.backgroundColor = _colorSexSelecter;
    _btnUserMan.backgroundColor = _colorSexUnSelecter;
    _regUserSex = @"2";
}

- (void)regRightNow
{
    NSString *sex = _regUserSex;
    NSString *username = _regUserUserName.text;
    NSString *realname = _regUserRealName.text;
//    NSString *cardid = _regUserCardId.text;
    NSString *password = _regUserPassWord.text;
//    NSString *tel = _regUserTel.text;
//    NSString *email = _regUserEmail.text;
    NSString *age = _regUserAge.text;
//    NSString *shouquannum = _regUserShouQuanNum.text;
    NSString *weixinid = _regUserWeiXinId.text;
//    NSString *qq = _regUserQQ.text;
    NSString *invitenum = _regUserInviteNum.text;
//    NSString *jingshoutotal = _regUserJingShouTotal.text;
//    NSString *jiyatotal = _regUserJiYaTotal.text;
//    NSString *chuhuototal = _regUserChuHuoTotal.text;
   
    if(![self isEmpty]){
        
        JZRegister_C *li = [JZRegister_C Jz_initialize];
        [li initWithInfo:@"register"
              UploadTime:[UtilsAll getFormatTime]
                  qphone:_regUserPhone.text
               qpassword:password
                 qcardid:@"0"
               qusername:username
               qrealname:realname
                    qtel:@"0"
                  qemail:@"0"
                    qsex:sex
                    qage:age
            qshouquannum:@"0"
                 qweixin:weixinid
                     qqq:@"0"
              qinvitenum:invitenum
               qwangwang:@"0"
                 qtaobao:@"0"
              qtaobaourl:@"0"
                  qstate:@"0"
             qformattime:@"0"
                  qlevel:@"0"
      qvideoaccessllevel:@"0"
            qhonestlevel:@"0"
             qreceivemsg:@"0"
       q_group_direct_id:@"0"
       q_group_higher_id:@"0"
       q_group_public_id:@"0"
         q_group_same_id:@"0"
               qgoodsnum:@"0"
           blackloggoods:@"0"
           deliverygoods:@"0"];
        NSDictionary *nsdic = [li toDictionary];
        JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
        jzDataHandle.JZDatadelegate = self;
        [jzDataHandle sendObject:nsdic time:@"20151" protocol:123 label:@"JZRegister_C"];
        [self showHudInView:self.view hint:@"正在注册..."];
    }
}



- (BOOL)isEmpty{
    BOOL ret = NO;
    NSString *username = _regUserUserName.text;
    NSString *realname = _regUserRealName.text;
//    NSString *cardid = _regUserCardId.text;
    NSString *pqssword = _regUserPassWord.text;
//    NSString *tel = _regUserTel.text;
//    NSString *email = _regUserEmail.text;
    NSString *age = _regUserAge.text;
//    NSString *shouquannum = _regUserShouQuanNum.text;
    NSString *weixinid = _regUserWeiXinId.text;
//    NSString *qq = _regUserQQ.text;
    NSString *invitenum = _regUserInviteNum.text;
//    NSString *jingshoutotal = _regUserJingShouTotal.text;
//    NSString *jiyatotal = _regUserJiYaTotal.text;
//    NSString *chuhuototal = _regUserChuHuoTotal.text;
    if (username.length == 0 || realname.length == 0 || pqssword.length == 0
        || age.length == 0||weixinid.length == 0||invitenum.length == 0 ) {
        ret = YES;
        [EMAlertView showAlertWithTitle:@"提示"
                                message:@"请将基本信息补全"
                        completionBlock:nil
                      cancelButtonTitle:NSLocalizedString(@"ok", @"OK")
                      otherButtonTitles:nil];
    }
    
    return ret;
}

//注册到环信
- (void)regToHuanXin:(NSString*)username PWD:(NSString*)password{
    [self.view endEditing:YES];
    if ([username isChinese]) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"用户名不支持中文"
                              message:nil
                              delegate:nil
                              cancelButtonTitle:@"确定"
                              otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    
    [[EaseMob sharedInstance].chatManager asyncRegisterNewAccount:username
                                                         password:password
                                                   withCompletion:
     ^(NSString *username, NSString *password, EMError *error) {
         [self hideHud];
         if (!error) {
             //注册成功
             //请求个人信息
             [self.delegate setQiaokerenID:username];
             [self.navigationController popViewControllerAnimated:YES];
             
             
         }else{
             switch (error.errorCode) {
                 case EMErrorServerNotReachable:
                     TTAlertNoTitle(@"连接服务器失败!");
                     break;
                 case EMErrorServerDuplicatedAccount:
                     TTAlertNoTitle(@"您注册的用户已存在!");
                     break;
                 case EMErrorServerTimeout:
                     TTAlertNoTitle(@"连接服务器超时!");
                     break;
                 default:
                
                     TTAlertNoTitle(@"注册失败");
                     break;
             }
         }
     } onQueue:nil];
}

-(void)sendUserInfoMsg{
    JZgetQUserInfo_c *li = [JZgetQUserInfo_c Jz_initialize];
    [li initWithInfo:@"" UserID:[QiaokerenApplication getAccountNumber] ThisUserID:[QiaokerenApplication getAccountNumber] UpUserID:@"0" Phone:@"0" WeChatID:@"0" Level:@"0" UploadTime:[UtilsAll getFormatTime111] PageSize:@"10" PageIndex:@"0"];
    NSDictionary *nsdic = [li toDictionary];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:nsdic time:@"122112" protocol:12212 label:@"JZgetQUserInfo_c"];
    [self showHudInView:self.view hint:@"正在添加我的上级为好友..."];
}


// 处理函数
- (void)dealLabel:(NetUnit*)nUnit{
    [self hideHud];
    NSLog(@"OOXX",nil);
    NSLog(nUnit->receiveString,nil);
    NSLog(@"OOXX",nil);
    if ([nUnit->cLabel isEqualToString:@"JZVaidate_c"]) {
        
        NSString* json = nUnit->receiveString;
        //        NSLog(@"JZVaidate_c--- %@",json);
        NSDictionary*dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:  NSUTF8StringEncoding ] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0 ];
        
        NSString *mark = [dictionary objectForKey:@"Mark"];
        NSString *sendMark = [UtilsAll TOString:[dictionary objectForKey:@"sendMark"]];
        if ([mark isEqualToString:@"1"]) {
            
            if([sendMark isEqualToString:@"1"]){
                _regUserCode.hidden = NO;
                _btnSendCode.hidden = NO;
            }else if([sendMark isEqualToString:@"3"]){
                _regStep2.textColor = _colorUsing;
                [self regVisible];
//                RegNow *regController = [[RegNow alloc] init];
//                [self.navigationController pushViewController:regController animated:YES];
            }
        }
        
        if ([mark isEqualToString:@"2"]) {
            
            if([sendMark isEqualToString:@"1"]){
                
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"货物验证码错误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
                [alertView show];
            }else if([sendMark isEqualToString:@"3"]){
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"验证码错误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
                [alertView show];
            }
        }

        
        if ([mark isEqualToString:@"3"]) {
            
            if([sendMark isEqualToString:@"1"]){
                
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"该用户已注册" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
                [alertView show];
            }else if([sendMark isEqualToString:@"3"]){
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"验证码错误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
                [alertView show];
            }
        }
        
        
    }
    
    
    /***********注册********/
    if ([nUnit->cLabel isEqualToString:@"JZRegister_C"]) {
        NSLog(@"1111zhuzhenkezhuzhenke");
        NSString* json = nUnit->receiveString;
        //        NSLog(@"JZVaidate_c--- %@",json);
        NSDictionary*dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:  NSUTF8StringEncoding ] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0 ];
        
        NSString *mark = [dictionary objectForKey:@"Mark"];
        if ([mark isEqualToString:@"1"]) {
            NSLog(@"1111zhuce cg!");
            [self showHudInView:self.view hint:@"正在注册..."];
            NSString *userid =[dictionary objectForKey:@"UserID"];
            
            
            [self regToHuanXin:userid PWD:_regUserPassWord.text];
            
            
        }else {
            
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"注册失败"
                                  message:nil
                                  delegate:nil
                                  cancelButtonTitle:@"确定"
                                  otherButtonTitles:nil];
            
            [alert show];
        }
    }
    
    
    
}
@end
