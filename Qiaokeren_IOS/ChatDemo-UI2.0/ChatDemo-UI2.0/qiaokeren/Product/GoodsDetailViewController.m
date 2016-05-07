//
//  GoodsDetailViewController.m
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-21.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "GoodsDetailViewController.h"
#import "OrderInfoViewController.h"
#import "GoodsViewController.h"
#import "UIImageView+DispatchLoad.h"
#import "JZaccept_c.h"
#import "JZgetGoodsInfo_c.h"
#import "QiaokerenApplication.h"
#import "UtilsAll.h"
#import "JZSubmit_C.h"
#import "UserSeletData.h"
#import "JZgetQUserInfo_c.h"
#import "GoodsInfoSelectData.h"
#import "MyUpOrderViewController.h"
@interface GoodsDetailViewController ()<TwoViewDelegate, JZDataHandleDelegate>
@property (weak, nonatomic) IBOutlet UILabel *goodsTitle;
@property (weak, nonatomic) IBOutlet UIImageView *goodsImg;
@property (weak, nonatomic) IBOutlet UILabel *goodsPerPrice;
@property (weak, nonatomic) IBOutlet UILabel *goodsDescribe;
@property (weak, nonatomic) IBOutlet UITextField *ordernumber;
@property (weak, nonatomic) IBOutlet UILabel *ordeTotalRMB;
@property (weak, nonatomic) IBOutlet UIButton *btnMilus;
@property (weak, nonatomic) IBOutlet UIButton *btnPlus;
@property (weak, nonatomic) IBOutlet UIButton *btnOrder;
- (IBAction)MilusOrderAction:(id)sender;
- (IBAction)PlusOrderAction:(id)sender;
- (IBAction)orderRightNowAction:(id)sender;

@end

@implementation GoodsDetailViewController
long goodsPerPrice = 168;
NSString *myAddress;
NSString *goodsId;
UserSeletData *user;
GoodsInfoSelectData *goods;
NSMutableArray *data;
NSString * const OrderMsgSubmit_S = @"俏可人提示您：我已经下单了，请您及时查看并接受订单。";
extern NSString * const GoodsDetailOrderNumber;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getGoodsData];
    
    [_btnMilus setTitle:@""
               forState:UIControlStateNormal];
    [_btnMilus setBackgroundImage:[UIImage imageNamed: @"z_minus.png"] forState:UIControlStateNormal];
    [_btnPlus setTitle:@""
               forState:UIControlStateNormal];
    [_btnPlus setBackgroundImage:[UIImage imageNamed: @"z_plus.png"] forState:UIControlStateNormal];
    [_btnOrder setTitle:@""
               forState:UIControlStateNormal];
    [_btnOrder setBackgroundImage:[UIImage imageNamed: @"z_ordernow.png"] forState:UIControlStateNormal];
    if ([QiaokerenApplication getAccountType] == 0) {
        _btnOrder.hidden = YES;
    }
    _ordernumber.delegate =self;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_ordernumber resignFirstResponder];
    NSString *strOrderNum = _ordernumber.text;
    long num = [strOrderNum integerValue];
    long total = goodsPerPrice*num;
    _ordeTotalRMB.text = [[NSString alloc] initWithFormat:@"¥ %ld",total];
    _ordernumber.text = [[NSString alloc] initWithFormat:@"%ld",num];
    return YES;
}

-(void)getGoodsData{
    if(data == nil){
        return;
    }
    long count = [data count];
    if(count <= 0){
        return;
    }
    for (int i=0; i<count; i++) {
        GoodsInfoSelectData *goodGood = [data objectAtIndex:i];
        if([goodGood.goodsid isEqualToString:goodsId]){
            goods = goodGood;
            [self initGoodsView:goods];
            break;
        }
    }
    
}

-(void)initGoodsView:(GoodsInfoSelectData*)goodsinfo{
    self.title = goodsinfo.goodsname;
    [_goodsImg setImageFromUrl:goodsinfo.goodslogo
                    completion:^(void) {}];
    
    _goodsTitle.text = goodsinfo.goodsname;
    NSString *perPrice = nil;
    switch ([[[QiaokerenApplication getUserSelectData] qlevel] integerValue]) {
        case 1:
            perPrice = [[NSString alloc] initWithFormat: @"¥ %@",goodsinfo.goodstheval];
            goodsPerPrice =[goodsinfo.goodstheval integerValue];
            break;
        case 2:
            perPrice = [[NSString alloc] initWithFormat: @"¥ %@",goodsinfo.goodstwoval];
            goodsPerPrice =[goodsinfo.goodstwoval integerValue];
            break;
        case 3:
            perPrice = [[NSString alloc] initWithFormat: @"¥ %@",goodsinfo.goodsoneval];
            goodsPerPrice =[goodsinfo.goodsoneval integerValue];
            break;
        case 4:
            perPrice = [[NSString alloc] initWithFormat: @"¥ %@",goodsinfo.goodstval];
            goodsPerPrice =[goodsinfo.goodstval integerValue];
            break;
        case 5:
            perPrice = [[NSString alloc] initWithFormat: @"¥ %@",goodsinfo.goodsfacval];
            goodsPerPrice =[goodsinfo.goodsfacval integerValue];
            break;
            
        default:
            perPrice = @"168";
            break;
    }
//    NSString *perPrice = [[NSString alloc] initWithFormat: @"¥ %@",goodsinfo.goodstval];
    NSString *total = [[NSString alloc] initWithFormat: @"¥ %@",perPrice];
    NSString *Describe = [[NSString alloc] initWithFormat: @"产品描述：%@",goodsinfo.goodsdiscribe];
    _goodsPerPrice.text = perPrice;
    _ordernumber.text = @"1";
    _ordeTotalRMB.text = total;
    _goodsDescribe.text = Describe;
}

//获取产品详情
-(void)sendGoodsInfoMsg{
    JZgetGoodsInfo_c *li = [JZgetGoodsInfo_c Jz_initialize];
    [li initWithInfo:@"" UserID:[QiaokerenApplication getAccountNumber] UploadTime:[UtilsAll getFormatTime] PageSize:@"10" PageIndex:@"0"];
    NSDictionary *nsdic = [li toDictionary];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:nsdic time:@"1212" protocol:1212 label:@"JZgetGoodsInfo_c"];
}

-(void)sendCommitMsg:(GoodsInfoSelectData*)goodsinfo Number:(NSString*)number Address:(NSString*)address{
    
    user = [QiaokerenApplication getUserSelectData];
    if(user == nil){
        [self sendUserInfoMsg];
        [self showHudInView:self.view hint:@"正在获取信息..."];
        return;
    }
    
    JZSubmit_C *li = [JZSubmit_C Jz_initialize];
    NSString *level = user.qlevel;
    NSString *perval = @"168";
    if([level isEqualToString:@"4"]){
        perval = goodsinfo.goodstval;
    }else if([level isEqualToString:@"3"]){
        perval = goodsinfo.goodsoneval;
    }else if([level isEqualToString:@"2"]){
        perval = goodsinfo.goodstwoval;
    }else if([level isEqualToString:@"1"]){
        perval = goodsinfo.goodstheval;
    }
    [li initWithInfo:@"" Goodsid:goodsinfo.goodsid Userid:[QiaokerenApplication getAccountNumber] UpLevelUserid:user.qhigherid
          UploadTime:[UtilsAll getFormatTime] Billstatus:@"1" Goodsperval:perval Goodsnumber:number Location:[UtilsAll getLocation] ReceiveAddress:address];
    NSDictionary *nsdic = [li toDictionary];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:nsdic time:@"" protocol:12 label:@"JZSubmit_C"];
}

-(void)sendUserInfoMsg{
    JZgetQUserInfo_c *li = [JZgetQUserInfo_c Jz_initialize];
    [li initWithInfo:@"" UserID:[QiaokerenApplication getAccountNumber] ThisUserID:[QiaokerenApplication getAccountNumber] UpUserID:@"0" Phone:@"0" WeChatID:@"0" Level:@"0" UploadTime:[UtilsAll getFormatTime] PageSize:@"10" PageIndex:@"0"];
    NSDictionary *nsdic = [li toDictionary];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:nsdic time:@"122112" protocol:12212 label:@"JZgetQUserInfo_c"];
}

-(void)setSelectedGoodsId:(NSString*)str GoodsArray:(NSMutableArray *)value{
    goodsId = str;
    data = value;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)MilusOrderAction:(id)sender {
    NSString *strOrderNum = _ordernumber.text;
    long num = [strOrderNum integerValue];
    num = num-1;
    if(num < 1){
        num = 1;
    }
    long total = goodsPerPrice*num;
    _ordeTotalRMB.text = [[NSString alloc] initWithFormat:@"¥ %ld",total];
    _ordernumber.text = [[NSString alloc] initWithFormat:@"%ld",num];
}

- (IBAction)PlusOrderAction:(id)sender {
    NSString *strOrderNum = _ordernumber.text;
    long num = [strOrderNum integerValue];
    num = num+1;
    if(num < 1){
        num = 1;
    }
    long total = goodsPerPrice*num;
    _ordeTotalRMB.text = [[NSString alloc] initWithFormat:@"¥ %ld",total];
    _ordernumber.text = [[NSString alloc] initWithFormat:@"%ld",num];
}

- (IBAction)orderRightNowAction:(id)sender {
    UserSeletData *user = [QiaokerenApplication getUserSelectData];
    NSString *userid = user.qlevel;
//    int useridInt = [userid intValue];
    if([userid isEqualToString:@"5"]){
        //公司不能下单
        [self showHint:@"公司账号不能下单"];
        return;
    }
    OrderInfoViewController *dialog = [[OrderInfoViewController alloc] init];
    dialog.delegate = self;
    [dialog setOrderNumber:_ordernumber.text Name:_goodsTitle.text];
    [self.navigationController pushViewController:dialog animated:YES
     ];
    
}
- (void)changeValue:(NSString *)value
{
    myAddress = value;
//    NSLog(@"myAddress返回值是： %@",myAddress);
    [self showHudInView:self.view hint:@"正在提交..."];
    [self sendCommitMsg:goods Number:_ordernumber.text Address:myAddress];
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



// 处理函数
- (void)dealLabel:(NetUnit*)nUnit{
    if([nUnit->cLabel isEqualToString:@"JZgetGoodsInfo_c"]){
        NSString *json = nUnit->receiveString;
        NSLog(@"JZgetGoodsInfo_c:%@",json);
        
        //更新ui，解析json
        NSDictionary*dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:  NSUTF8StringEncoding ] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0 ];
        if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"1"]) {
            NSString *str = [dictionary objectForKey:@"GoodsList"];
            if(str.length < 20){
                return;
            }
            
            NSDictionary*dic = [[NSJSONSerialization JSONObjectWithData:[[dictionary objectForKey:@"GoodsList"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0];
            
            goods = [GoodsInfoSelectData Jz_initialize];
            [goods initWithInfo:@""
                        goodsid:[UtilsAll TOString:[dic objectForKey:@"goodsid"]]
                      goodsname:[dic objectForKey:@"goodsname"]
                  goodsdiscribe:[dic objectForKey:@"goodsdiscribe"]
                      goodslogo:[dic objectForKey:@"goodslogo"]
                       goodssrc:[dic objectForKey:@"goodssrc"]
                    goodsfacval:[dic objectForKey:@"goodsfacval"]
                      goodstval:[dic objectForKey:@"goodstval"]
                    goodsoneval:[dic objectForKey:@"goodsoneval"]
                    goodstwoval:[dic objectForKey:@"goodstwoval"]
                    goodstheval:[dic objectForKey:@"goodstheval"]];
            
            [self initGoodsView:goods];
            
        }else{
//            UIAlertView * myAlert = [[UIAlertView alloc]initWithTitle:@"提示:" message:@"下单失败，请重试" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//            [myAlert show];
        }
    }
    
    if ([nUnit->cLabel isEqualToString:@"JZSubmit_C"]) {
        [self hideHud];
       NSString * json = nUnit->receiveString;
//       NSLog(@"JZSubmit_C:%@",json);
        
       //更新ui，解析json
        NSDictionary*dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:  NSUTF8StringEncoding ] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0 ];
        if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"1"]) {
            [self sendOrderMsgToHuanXin:OrderMsgSubmit_S  to:[dictionary objectForKey:@"UpLevelUserid"]];
            MyUpOrderViewController *upOrderController = [[MyUpOrderViewController alloc] init];
            [self.navigationController pushViewController:upOrderController animated:YES];
        }else{
            UIAlertView * myAlert = [[UIAlertView alloc]initWithTitle:@"提示:" message:@"下单失败，请重试" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
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
}


@end
