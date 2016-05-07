//
//  CGDetailViewController.m
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-17.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import "CGDetailViewController.h"
#import "CGDetailView.h"


#import "JZDataHandle.h"
#import "getCreditGood_C.h"
#import  "getCreditGood_S.h"
#import "QiaokerenApplication.h"
#import "UtilsAll.h"
#import "CreditGoodData.h"
#import "addCreditBil_C.h"
#import "addCreditBil_S.h"

#import "getUserCredit_C.h"
#import "getUserCredit_S.h"
#import "UserCreditData.h"
#import "JZgetQUserInfo_c.h"
#import "UserSeletData.h"
#import "changeUserCredit_C.h"
#import "changeUserCredit_S.h"
#import "JZTakeCreditVC.h"

#define APP_Frame_Height   [[UIScreen mainScreen] applicationFrame].size.height //应用程序的屏幕高度
#define App_Frame_Width    [[UIScreen mainScreen] applicationFrame].size.width  //应用程序的屏幕宽度
@interface CGDetailViewController ()<UIScrollViewDelegate,CGDetailViewDelegate,JZDataHandleDelegate>

@property (strong, nonatomic) UIScrollView*   bottomView;
@property (strong, nonatomic) UITextField *creatNameTF;
@property (strong, nonatomic) UITextField *lactionTF;
@property (strong, nonatomic) CreditGoodData *CGData;

@property (strong, nonatomic) NSMutableArray* data;



@end

@implementation CGDetailViewController

static CGDetailViewController *activityView;

+ (CGDetailViewController *)sharedActivityView
{
    if (!activityView) {
        activityView = [[CGDetailViewController alloc]initWithNibName:nil bundle:nil];
    }
    return activityView;
}




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    _data = [NSMutableArray array];
    
    return  self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil CreditGoodData:(CreditGoodData*)_CreditGoodData
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    self.CGData = _CreditGoodData;
    _data = [NSMutableArray array];
    
    activityView =self;
    return  self;
    
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册键盘出现与隐藏时候的通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboadWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    //添加手势，点击屏幕其他区域关闭键盘的操作
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    gesture.numberOfTapsRequired = 1;//手势敲击的次数
    [self.view addGestureRecognizer:gesture];
    [self.view addSubview: self.bottomView];
    [self sendQst];
    [self sendUserInfoMsg];
    
}


-(void)sendQst{
    [self showHudInView:self.view hint:@"正在加载..."];
    JZDataHandle*dh = [JZDataHandle initdatahandle];
    dh.JZDatadelegate = self;
    getUserCredit_C * getMsg = [getUserCredit_C Jz_initialize];
    
    //[UtilsAll getFormatTime]
    //[QiaokerenApplication getAccountNumber]
    [getMsg initWithInfo:@"获取积分列表" UserID:[QiaokerenApplication getAccountNumber] UploadTime:[UtilsAll getFormatTime] time:[UtilsAll getFormatTime]];
    
    
    [dh sendObject:[getMsg toDictionary] time:@"0" protocol:1 label:@"getUserCredit_C"];
    
    
    
}

-(void)sendUserInfoMsg{
    //     [self showHudInView:self.view hint:@"正在加载..."];
    JZgetQUserInfo_c *li = [JZgetQUserInfo_c Jz_initialize];
    [li initWithInfo:@"" UserID:[QiaokerenApplication getAccountNumber] ThisUserID:[QiaokerenApplication getAccountNumber] UpUserID:@"0" Phone:@"0" WeChatID:@"0" Level:@"0" UploadTime:[UtilsAll getFormatTime] PageSize:@"10" PageIndex:@"0"];
    NSDictionary *nsdic = [li toDictionary];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:nsdic time:@"122112" protocol:12212 label:@"JZgetQUserInfo_c"];
}



//通过环信发送推送消息
- (void)sendOrderMsgToHuanXin:(NSString*)orderMsg to:(NSString*)to{
    EMChatText *txtChat = [[EMChatText alloc] initWithText:orderMsg];
    EMTextMessageBody *body = [[EMTextMessageBody alloc] initWithChatObject:txtChat];
    
    // 生成message
    EMMessage *message = [[EMMessage alloc] initWithReceiver:@"6001" bodies:@[body]];
    message.isGroup = NO; // 设置是否是群聊
    message.to = to;
    // 发送消息
    [[EaseMob sharedInstance].chatManager asyncSendMessage:message progress:nil];
}






-(void)dealLabel:(NetUnit *)nUnit
{
    if ([nUnit->cLabel isEqualToString:@"getUserCredit_C"]) {
        NSString* json = nUnit->receiveString;
        NSLog(@"------------------%@",json);
        NSDictionary*dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:  NSUTF8StringEncoding ] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0 ];
        if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"1"]) {
            [self hideHud];
            NSString *str = [dictionary objectForKey:@"userCreditList"];
            if(str.length < 20){
                return;
            }
            NSDictionary*dic;
            
            NSArray* array = [NSJSONSerialization JSONObjectWithData:[[dictionary objectForKey:@"userCreditList"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil] ;
            
            for (int i=0; i<[array count]; i++) {
                dic = [array  objectAtIndex:i];
                UserCreditData* CreditData = [UserCreditData Jz_initialize];
                //                [[NSString alloc] initWithFormat:@"%@",[dic objectForKey:@"goodsid"]]
                [CreditData initWithInfo:@"用户积分数据"
                                creditid:[[NSString alloc] initWithFormat:@"%@",[dic objectForKey:@"creditid"]]
                                  userid:[[NSString alloc] initWithFormat:@"%@",[dic objectForKey:@"userid"]]
                               timestamp:[dic objectForKey:@"timestamp"]
                               userlevel:[dic objectForKey:@"userlevel"]
                             monthcredit:[dic objectForKey:@"monthcredit"]
                           quartercredit:[dic objectForKey:@"quartercredit"]
                              yearcredit:[dic objectForKey:@"yearcredit"]
                                    time:[dic objectForKey:@"time"]];
                [_data addObject:CreditData];
            }
            
            //            NSLog(@"%lu++++++1111111111",(unsigned long)_data.count);
            
        }else{
            UIAlertView * myAlert = [[UIAlertView alloc]initWithTitle:@"提示:" message:@"获取信息列表失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [myAlert show];
        }
    }
    
    if ([nUnit->cLabel isEqualToString:@"JZgetQUserInfo_c"]) {
        
        NSString* json = nUnit->receiveString;
        //        NSLog(@"------------------%@",json);
        NSDictionary*dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:  NSUTF8StringEncoding ] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0 ];
        
        //判断是否能够组成字典
        NSString *str = [dictionary objectForKey:@"UserSelectDataList"];
        if(str.length < 20){
            return;
        }
        
        NSDictionary*dic = [[NSJSONSerialization JSONObjectWithData:[[dictionary objectForKey:@"UserSelectDataList"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0];
        if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"1"]) {
            
            [self hideHud];
            
            NSString* sex ;
            if ([[dic objectForKey:@"qsex"] isEqualToString:@"1"]) {
                sex=@"男";
            }else{
                sex=@"女";
            }
            UserSeletData* personalInfo = [UserSeletData instance2];
            [personalInfo initWithInfo:@"成功了吧"
                               quserid:[[NSString alloc] initWithFormat:@"%@",[dic objectForKey:@"quserid"]]
                             qhigherid:[[NSString alloc] initWithFormat:@"%@",[dic objectForKey:@"qhigherid"]]
                                qphone:[[NSString alloc] initWithFormat:@"%@",[dic objectForKey:@"qphone"]]
                             qpassword:[dic objectForKey:@"qpassword"]
                               qcardid:[dic objectForKey:@"qcardid"]
                             qusername:[dic objectForKey:@"qusername"]
                             qrealname:[dic objectForKey:@"qrealname"]
                                  qtel:[dic objectForKey:@"qtel"]
                                qemail:[dic objectForKey:@"qemail"]
                                  qsex:sex
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
            [QiaokerenApplication setUserSelectData:personalInfo];
        }else{
            //            UIAlertView * myAlert = [[UIAlertView alloc]initWithTitle:@"提示:" message:@"获取信息失败，请重进系统" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            //            [myAlert show];
            
        }
        
    }
    
    if ([nUnit->cLabel isEqualToString:@"addCreditBil_C"]) {
        NSString* json = nUnit->receiveString;
        NSLog(@"------------------%@",json);
        NSDictionary*dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:  NSUTF8StringEncoding ] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0 ];
        [self hideHud];
        if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"1"]) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"订单已提交"]
                                                            message:nil
                                                           delegate:nil
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil, nil];
            
            [alert show];
            UserSeletData * userdata = [QiaokerenApplication getUserSelectData];
            
            [self sendOrderMsgToHuanXin:@"俏可人提醒您有新的积分兑换订单，请及时回复" to:[userdata qhigherid] ];
            
        }else if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"2"]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"订单提交失败"]
                                                            message:nil
                                                           delegate:nil
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil, nil];
            
            [alert show];
            
            
        }
    }
    
    
    if ([nUnit->cLabel isEqualToString:@"changeUserCredit_C"]) {
        NSString* json = nUnit->receiveString;
        NSLog(@"------------------%@",json);
        NSDictionary*dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:  NSUTF8StringEncoding ] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0 ];
        [self hideHud];
        if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"1"]) {
            
            //            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"订单已提交"]
            //                                                            message:nil
            //                                                           delegate:nil
            //                                                  cancelButtonTitle:@"确定"
            //                                                  otherButtonTitles:nil, nil];
            //
            //            [alert show];
            
            JZTakeCreditVC* ybillvc = [[JZTakeCreditVC alloc] initWithNibName:nil bundle:nil];
            [ybillvc setTitle:@"邀赏"];
            [self.navigationController pushViewController:ybillvc animated:YES];
            
            
            
        }else if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"2"]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"修改积分列表失败"]
                                                            message:nil
                                                           delegate:nil
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil, nil];
            
            [alert show];
            
            
        }
        
        
        
    }
    
}











-(UIScrollView*)bottomView
{
    //[UIScrollView setContentOffset:CGPointMake(320, 0)];//默认显示的位置
    if(_bottomView==nil)
    {
        _bottomView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, App_Frame_Width,APP_Frame_Height)];
        _bottomView.backgroundColor = [UIColor whiteColor];
        _bottomView.contentSize = CGSizeMake(320, APP_Frame_Height*1.5);
        _bottomView.bounces = YES;//反弹
        _bottomView.pagingEnabled = NO;//不分页
        _bottomView.showsHorizontalScrollIndicator = NO;//不显示水平滑动轴
        _bottomView.showsVerticalScrollIndicator =NO;//不显示竖直滑动轴
        
        CGDetailView* CGDv = [[CGDetailView alloc]initCGWithFrame:CGRectMake(0, 0, App_Frame_Width,220)
                                                         imageUrl:[self.CGData goodslogo]
                                                       needCredit:[self.CGData goodsfacval]
                                                   creditGoodName:[self.CGData goodsname]
                                               creditGoodDescribe:[self.CGData goodsdiscribe]];
        CGDv.cliFinDelegate=self ;
        [_bottomView addSubview:CGDv];
        [_bottomView addSubview:self.creatNameTF];
        [_bottomView addSubview:self.lactionTF];
        _bottomView.delegate=self ;
        
    }
    
    return _bottomView;
    
}


- (UITextField *)creatNameTF
{
    if (_creatNameTF == nil) {
        _creatNameTF = [[UITextField alloc] initWithFrame:CGRectMake(20, 230, 290, 30)];
        UIColor *color = [UIColor colorWithRed:0.0 green:0.5 blue:1.0 alpha:1.0];
        _creatNameTF.layer.borderColor = [color CGColor];
        _creatNameTF.layer.borderWidth = 0.5;
        _creatNameTF.layer.cornerRadius = 6;
        _creatNameTF.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 30)];
        _creatNameTF.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _creatNameTF.leftViewMode = UITextFieldViewModeAlways;
        _creatNameTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _creatNameTF.font = [UIFont systemFontOfSize:15.0];
        _creatNameTF.backgroundColor = [UIColor whiteColor];
        _creatNameTF.placeholder =@"请输姓名";
        _creatNameTF.returnKeyType = UIReturnKeyDone;
        _creatNameTF.delegate = self;
    }
    
    return _creatNameTF;
}

- (UITextField *)lactionTF
{
    if (_lactionTF == nil) {
        _lactionTF = [[UITextField alloc] initWithFrame:CGRectMake(20, 300, 290, 30)];
        UIColor *color = [UIColor colorWithRed:0.0 green:0.5 blue:1.0 alpha:1.0];
        _lactionTF.layer.borderColor = [color CGColor];
        _lactionTF.layer.borderWidth = 0.5;
        _lactionTF.layer.cornerRadius = 6;
        _lactionTF.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 30)];
        _lactionTF.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _lactionTF.leftViewMode = UITextFieldViewModeAlways;
        _lactionTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _lactionTF.font = [UIFont systemFontOfSize:15.0];
        _lactionTF.backgroundColor = [UIColor whiteColor];
        _lactionTF.placeholder =@"请输入地址";
        _lactionTF.returnKeyType = UIReturnKeyDone;
        _lactionTF.delegate = self;
        
    }
    
    return _lactionTF;
}


//键盘出现时候调用的事件
-(void) keyboadWillShow:(NSNotification *)note{
    //      NSDictionary *info = [note userInfo];
    //        CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;//键盘的frame
    //         CGFloat offY = (460-keyboardSize.height)-myTextField.frame.size.height;//屏幕总高度-键盘高度-UITextField高度
    [UIView beginAnimations:nil context:NULL];//此处添加动画，使之变化平滑一点
    [UIView setAnimationDuration:0.3];//设置动画时间 秒为单位
    //         myTextField.frame = CGRectMake(35, offY, 250, 35);//UITextField位置的y坐标移动到offY
    [_bottomView setContentOffset:CGPointMake(0, 125)];
    [UIView commitAnimations];//开始动画效果
    
}
//键盘消失时候调用的事件
-(void)keyboardWillHide:(NSNotification *)note{
    [UIView beginAnimations:nil context:NULL];//此处添加动画，使之变化平滑一点
    [UIView setAnimationDuration:0.3];
    //         myTextField.frame = CGRectMake(35, 230, 250, 35);//UITextField位置复原
    [_bottomView setContentOffset:CGPointMake(0, -63)];
    
    [UIView commitAnimations];
}
//隐藏键盘方法
-(void)hideKeyboard{
    [_creatNameTF resignFirstResponder];
    [_lactionTF resignFirstResponder];
    
}






#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

//点击完成后的block回调
-(void)getNameAdress:(nameAndAdress)nameAdressblock
{
    if(_lactionTF.text.length == 0 || _creatNameTF.text.length == 0 ){
        
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"请填写地址及姓名"]
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        
        [alert show];
        
        return;
        
    }
    [self hideKeyboard];
    nameAdressblock(_creatNameTF.text,_lactionTF.text,self.CGData.goodsid);
    
}

//点击完成后
- (void)CGDetailViewDidClickedFInish:(addCreditBil_C*)addCreData
{   addCreditBil_C* addbil;
    addbil = addCreData;
    UserCreditData* credata;
    int haveCredit= 0;
    int needCredit= 0;
    switch ([self.CGData.goodssrc intValue]) {
        case 1://需要月积分
            credata = [_data objectAtIndex:0];
            haveCredit = [credata.monthcredit intValue];
            needCredit = [[self.CGData goodsfacval] intValue]*[addbil.goodsnumber intValue];
            //              NSLog(@"haveCredit=%@",credata.monthcredit );
            //            NSLog(@"haveCredit=%d",[credata.monthcredit intValue]);
            //            NSLog(@"needCredit=%d",[[self.CGData goodsfacval] intValue]*[addbil.goodsnumber intValue]);
            //            NSLog(@"haveCredit=%d",haveCredit);
            //            NSLog(@"needCredit=%d",needCredit);
            
            
            if ((needCredit-haveCredit<0)) {
                JZDataHandle * ac = [JZDataHandle initdatahandle];
                ac.JZDatadelegate = self;
                [ac sendObject:[addbil toDictionary] time:@"0" protocol:1 label:@"addCreditBil_C"];
                [self showHudInView:self.view hint:@"正在提交..."];
                
                
                changeUserCredit_C * chuscr = [changeUserCredit_C Jz_initialize];
                [chuscr initWithInfo:@"减积分请求"
                              UserID:[QiaokerenApplication getAccountNumber]
                          UploadTime:[UtilsAll getFormatTime]
                        incOrrecflog:@"2"
                        changeCredit:[NSString stringWithFormat:@"%d",needCredit]
                          Credittype:@"1"
                                time:[UtilsAll getFormatTime]];
                [ac sendObject:[chuscr toDictionary] time:@"0" protocol:1 label:@"changeUserCredit_C"];
                
            }else{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"积分不足，加油吧，骚年！"]
                                                                message:nil
                                                               delegate:nil
                                                      cancelButtonTitle:@"确定"
                                                      otherButtonTitles:nil, nil];
                
                [alert show];
                
                
            }
            break;
        case 2://需要年积分
            credata = [_data objectAtIndex:0];
            haveCredit = [credata.yearcredit intValue];
            needCredit = [[self.CGData goodsfacval] intValue]*[addbil.goodsnumber intValue];
            NSLog(@"haveCredit=%d",haveCredit);
            NSLog(@"haveCredit=%d",haveCredit);
            addbil.deliverynumber = @"年积分";
            if ((needCredit-haveCredit<0)) {
                JZDataHandle * ac = [JZDataHandle initdatahandle];
                ac.JZDatadelegate = self;
                [ac sendObject:[addbil toDictionary] time:@"0" protocol:1 label:@"addCreditBil_C"];
                [self showHudInView:self.view hint:@"正在提交..."];
                
                changeUserCredit_C * chuscr = [changeUserCredit_C Jz_initialize];
                [chuscr initWithInfo:@"减积分请求"
                              UserID:[QiaokerenApplication getAccountNumber]
                          UploadTime:[UtilsAll getFormatTime]
                        incOrrecflog:@"2"
                        changeCredit:[NSString stringWithFormat:@"%d",needCredit]
                          Credittype:@"2"
                                time:[UtilsAll getFormatTime]];
                [ac sendObject:[chuscr toDictionary] time:@"0" protocol:1 label:@"changeUserCredit_C"];
            }else{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"积分不足，加油吧，骚年！"]
                                                                message:nil
                                                               delegate:nil
                                                      cancelButtonTitle:@"确定"
                                                      otherButtonTitles:nil, nil];
                
                [alert show];
                
                
            }
            break;
            
        default:
            break;
    }
    
    
    
    
    //    [self hideHud];  //用于取消
}


@end
