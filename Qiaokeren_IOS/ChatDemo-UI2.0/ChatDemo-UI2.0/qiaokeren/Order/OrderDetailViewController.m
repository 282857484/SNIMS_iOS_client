//
//  OrderDetailViewController.m
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-20.
//  Copyright (c) 2015年 Apple. All rights reserved.
//
#import "DXChatBarMoreView.h"
#import "OrderDetailViewController.h"
#import "UIImageView+DispatchLoad.h"
#import "ChatSendHelper.h"
#import "JZgetBillInfo_c.h"
#import "QiaokerenApplication.h"
#import "UtilsAll.h"
#import "BillSelectData.h"
#import "JZgetGoodsInfo_c.h"
#import "GoodsInfoSelectData.h"
#import "JZaccept_c.h"
#import "JZsendMoney_C.h"
#import "JZsendGoods_C.h"
#import "JZreceiveGoods_c.h"
#import "ASIFormDataRequest.h"
#import "SEiOSUploadFileDeal.h"
#import "WebUrlLoadViewController.h"

#import "changeUserCredit_C.h"
#import "getGoodinfoNew_C.h"
#import "NewGoodinfoData.h"
@interface OrderDetailViewController ()<UITextFieldDelegate, iOSUploadFileCallBack>
@property (weak, nonatomic) IBOutlet UIImageView *orderImg;
@property (weak, nonatomic) IBOutlet UILabel *goodsName;
@property (weak, nonatomic) IBOutlet UILabel *goodsDescribe;
@property (weak, nonatomic) IBOutlet UILabel *goodsPrice;
@property (weak, nonatomic) IBOutlet UILabel *OrderResource;
@property (weak, nonatomic) IBOutlet UILabel *OrderCommitTime;
@property (weak, nonatomic) IBOutlet UILabel *orderStatue;
@property (weak, nonatomic) IBOutlet UILabel *OrderAmount;
@property (weak, nonatomic) IBOutlet UILabel *OrderPerPrice;
@property (weak, nonatomic) IBOutlet UILabel *OrderReceiveAddress;
@property (weak, nonatomic) IBOutlet UILabel *OrderDeliveryWay;
@property (weak, nonatomic) IBOutlet UILabel *OrderDeliveryNumber;
@property (weak, nonatomic) IBOutlet UITextField *editOrderDeliveryWay;
@property (weak, nonatomic) IBOutlet UITextField *editOrderDeliveryNumber;
@property (weak, nonatomic) IBOutlet UIButton *btnSendCut;
@property (weak, nonatomic) IBOutlet UIButton *btnRefuse;
@property (weak, nonatomic) IBOutlet UIButton *btnReceive;
- (IBAction)btnSendCut:(id)sender;
- (IBAction)btnRefuse:(id)sender;
- (IBAction)btnReceive:(id)sender;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;


@property (strong, nonatomic) NSMutableArray* goodsdata;
@end

@implementation OrderDetailViewController
BOOL isUpLevel;
BOOL ifSendCutPic;
BillSelectData *bill;
GoodsInfoSelectData *goods;
NSString *statue;
NSString *billId;
//NSString *billId;
NSString *goodsId;
NSString * const OrderMsgaccept_S_OK = @"俏可人提示您：我已经接受您的订单，请您及时付款。";
NSString * const OrderMsgaccept_S_NO = @"俏可人提示您：我已经拒绝了您的订单。";
NSString * const OrderMsgsendMoney_S = @"俏可人提示您：我已经为我的订单付款了，请您及时发货。";
NSString * const OrderMsgsendGoods_S = @"俏可人提示您：我已经发货了，请您及时确认收货。";
NSString * const OrderMsgreceiveGoods_S = @"俏可人提示您：我已经确认收货。";
BOOL isUpdate;
UIButton *showWuLiu;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _goodsdata = [NSMutableArray array];
    [self sendQstforGoodinfo];
    
    int screemWidth = self.view.frame.size.width;
    CGSize size = CGSizeMake(screemWidth-0.1f, 700.0f);
    _scrollview.contentSize = size;
    
    showWuLiu = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 35)];
    [showWuLiu setTitle:@"物流信息" forState:UIControlStateNormal];
    [showWuLiu addTarget:self action:@selector(showWuLiu) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:showWuLiu];
   
    
    // Do any additional setup after loading the view from its nib.
    
    _OrderDeliveryWay.hidden = YES;
    _OrderDeliveryNumber.hidden = YES;
    _editOrderDeliveryWay.hidden = YES;
    _editOrderDeliveryNumber.hidden = YES;
    _btnSendCut.hidden = YES;
    _btnRefuse.hidden = YES;
//    _btnReceive.hidden = NO;
    _editOrderDeliveryNumber.delegate=self;
    _editOrderDeliveryWay.delegate=self;
    
    [self sendGoodsInfoMsg:goodsId];
    [self sendBillsMsg:billId];
    NSLog(@"billId:%@",billId);
    self.title = @"订单详情";
    
    ifSendCutPic = NO;
    isUpdate = NO;
    NSString *title = @"";
    if(isUpLevel){
        title = @"<下级订单";
    }else{
        title = @"<上级订单";
    }
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(popToUpView)];
    
    //获取Documents文件夹目录
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [path objectAtIndex:0];
    //指定新建文件夹路径
    NSString *imageDocPath = [documentPath stringByAppendingPathComponent:@"ImageFile"];
    //创建ImageFile文件夹
    [[NSFileManager defaultManager] createDirectoryAtPath:imageDocPath withIntermediateDirectories:YES attributes:nil error:nil];
    
    //保存图片的路径
    self.imagePath = [imageDocPath stringByAppendingPathComponent:@"billCut.png"];
}

- (void)showWuLiu
{
    
    NSString *urlStr = [[NSString alloc]  initWithFormat:@"http://m.kuaidi100.com/index_all.html?type=%@&postid=%@",bill.deliveryway,bill.deliverynumber];
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    WebUrlLoadViewController *webUrlLoadController =  [[WebUrlLoadViewController alloc] init];
    
    [webUrlLoadController setLoadUrl:urlStr];
    [self.navigationController pushViewController:webUrlLoadController animated:YES];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
    
}



//请求货物对应的名称和可以获得的积分单价
-(void)sendQstforGoodinfo{
    [_goodsdata removeAllObjects];
    JZDataHandle*dh = [JZDataHandle initdatahandle];
    dh.JZDatadelegate = self;
    getGoodinfoNew_C *getMsg = [getGoodinfoNew_C Jz_initialize];
    
    [getMsg initWithInfo:@"请求获取商品的名称和应得积分"
                  UserID:[QiaokerenApplication getAccountNumber]
              UploadTime:[UtilsAll getFormatTime]
                 goodsid:@"0"
                PageSize:@"100"
               PageIndex:@"0"];
    [dh sendObject:[getMsg toDictionary] time:@"0" protocol:1 label:@"getGoodinfoNew_C"];
    
}








//请求货物详情
-(void)sendGoodsInfoMsg:(NSString*)goodsId{
    JZgetGoodsInfo_c *li = [JZgetGoodsInfo_c Jz_initialize];
    [li initWithInfo:@"" UserID:[QiaokerenApplication getAccountNumber] UploadTime:[UtilsAll getFormatTime111] PageSize:@"10" PageIndex:@"0"];
    NSDictionary *nsdic = [li toDictionary];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:nsdic time:@"2015" protocol:1112 label:@"JZgetGoodsInfo_c"];
}
-(void)setGoodsId:(NSString*)goodsId2 AndBillId:(NSString*)billId2 IsUpOrDown:(NSString*)num{
    goodsId = goodsId2;
    billId = billId2;
    if([num isEqualToString:@"1"]){
        isUpLevel = NO;
    }else{
        isUpLevel = YES;
    }
}
//请求订单详情
-(void)sendBillsMsg:(NSString*)billId{
    JZgetBillInfo_c *li = [JZgetBillInfo_c Jz_initialize];
    [li initWithInfo:@"" UserID:[QiaokerenApplication getAccountNumber] UploadTime:[UtilsAll getFormatTime222] BillID:billId SearchUserID:[QiaokerenApplication getAccountNumber] SearchUpUserID:@"0" PageSize:@"1000" PageIndex:@"0"];
    NSDictionary *nsdic = [li toDictionary];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:nsdic time:@"2015" protocol:1112 label:@"JZgetBillInfo_c"];
}

//提交接受订单信息
-(void)sendAcceptOrderMsg:(NSString*)billId Receive:(BOOL)flag{
    JZaccept_c *li = [JZaccept_c Jz_initialize];
    NSString *acceptFlag = @"1";
    if(flag){
        acceptFlag = @"1";
    }else{
        acceptFlag = @"2";
    }
    [li initWithInfo:@"" Billid:billId Userid:[QiaokerenApplication getAccountNumber] UploadTime:[UtilsAll getFormatTime] IsAccept:acceptFlag];
    NSDictionary *nsdic = [li toDictionary];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:nsdic time:@"2015" protocol:1112 label:@"JZaccept_c"];
}


//提交打款信息
-(void)sendMoneyMsg:(NSString*)billId{
    if(!ifSendCutPic){
        [EMAlertView showAlertWithTitle:@"提示"
                                message:@"请先发送打款截图"
                        completionBlock:nil
                      cancelButtonTitle:NSLocalizedString(@"ok", @"确定")
                      otherButtonTitles:nil];
        return;
    }
    
    JZsendMoney_C *li = [JZsendMoney_C Jz_initialize];
    [li initWithInfo:@"" Billid:billId Userid:[QiaokerenApplication getAccountNumber] UploadTime:[UtilsAll getFormatTime] Money:@"0" CutMapRes:@"123"];
    NSDictionary *nsdic = [li toDictionary];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:nsdic time:@"2015" protocol:1112 label:@"JZsendMoney_C"];
}

//提交发货信息
-(void)sendGoodsMsg:(NSString*)billId Way:(NSString*)way Number:(NSString*)number{
    JZsendGoods_C *li = [JZsendGoods_C Jz_initialize];
    [li initWithInfo:@"" Billid:billId Userid:[QiaokerenApplication getAccountNumber] UploadTime:[UtilsAll getFormatTime] SendAddress:@"0" DeliveryNumber:number DeliveryWay:way];
    NSDictionary *nsdic = [li toDictionary];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:nsdic time:@"201512" protocol:1312 label:@"JZsendGoods_C"];
}

//提交收货信息
-(void)sendReceiveGoodsMsg:(NSString*)billId{
    JZreceiveGoods_c *li = [JZreceiveGoods_c Jz_initialize];
    [li initWithInfo:@"" Billid:billId Userid:[QiaokerenApplication getAccountNumber] UploadTime:[UtilsAll getFormatTime]];
    NSDictionary *nsdic = [li toDictionary];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:nsdic time:@"211512" protocol:1312 label:@"JZreceiveGoods_c"];
    
    
    
    
    /********************************************************/
    //    给用户加分 给用户加分 给用户加分 //
    /********************************************************/
    
    
    NSString* goodname =@"000";
    NSString* tolcredit =@"000";
    for (int i=0;i<_goodsdata.count;i++){
        NewGoodinfoData *goodinfodata = [_goodsdata objectAtIndex:i];
        NSLog(@"++++++%@",goodsId);
        NSLog(@"------%@",[goodinfodata goodsid]);
        NSLog(@"bill goodsnumber%@",[bill goodsnumber]);
        
        
        
        if ([goodsId isEqualToString:[goodinfodata goodsid]]){
            goodname = [goodinfodata goodsname];
            tolcredit =[NSString stringWithFormat:@"%d",[[goodinfodata QCredit] intValue]*[[bill goodsnumber]intValue]];
            
            
        }
        
    }
    
    
    
    
    changeUserCredit_C * chuscr = [changeUserCredit_C Jz_initialize];
    [chuscr initWithInfo:@"减积分请求"
                  UserID:[QiaokerenApplication getAccountNumber]
              UploadTime:[UtilsAll getFormatTime]
            incOrrecflog:@"1"
            changeCredit:[NSString stringWithFormat:@"%@",tolcredit]
              Credittype:@"1"
                    time:[UtilsAll getFormatTime]];
    [jzDataHandle sendObject:[chuscr toDictionary] time:@"0" protocol:1 label:@"changeUserCredit_C"];
    
}

-(void)popToUpView{
//    ABCViewController *orderDetailController =  [[ABCViewController alloc] init];
//    [self.navigationController pushViewController:orderDetailController animated:YES];
    
    
    if(isUpdate){
        //如果状态改变了的话
        [self.delegate  changeOrderStatue:statue];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)initGoodsView{
    if(goods == nil){
        return;
    }
//    NSString *a = @"http://img5.imgtn.bdimg.com/it/u=2440990885,3740260280&fm=21&gp=0.jpg";
//    NSLog(goods.goodslogo);
    [_orderImg setImageFromUrl:goods.goodslogo
                    completion:^(void) {}];
    _goodsName.text = goods.goodsname;
    _goodsDescribe.text = goods.goodsdiscribe;
    _goodsPrice.text = goods.goodstval;
}

- (void)initOrderDetail{
    if(bill == nil){
        return;
    }
    if([[QiaokerenApplication getAccountNumber] isEqualToString:bill.userid]){
        isUpLevel = NO;
    }else{
        isUpLevel = YES;
    }
    
    statue = bill.billstatus;
    if(!isUpLevel){//如果是下级代理
        _OrderResource.text = [@"订单来源：" stringByAppendingString:bill.userid];
    }else{
        _OrderResource.text = [@"货物来源：" stringByAppendingString:bill.upmasteruserid];
    }
    
    _OrderCommitTime.text = [@"下单时间：" stringByAppendingString:[UtilsAll getNoYearChineseTime:bill.timestamp]];
    statue = bill.billstatus;
    if(!isUpLevel){//如果是下级代理
        _btnRefuse.hidden = YES;
        if([statue isEqualToString:@"-1"]){
            _orderStatue.text = @"订单状态：上级已拒绝您的订单";
            _btnReceive.hidden = YES;
        }else if([statue isEqualToString:@"1"]){
            _orderStatue.text = @"订单状态：等待上级接受您的订单";
            _btnReceive.hidden = YES;
        }else if([statue isEqualToString:@"2"]){
            _orderStatue.text = @"订单状态：等待您付款";
            [_btnReceive setTitle:@"付款" forState:UIControlStateNormal];
        }else if([statue isEqualToString:@"3"]){
            _orderStatue.text = @"订单状态：等待上级发货";
            _btnReceive.hidden = YES;
        }else if([statue isEqualToString:@"4"]){
            _orderStatue.text = @"订单状态：等待您收货";
            [_btnReceive setTitle:@"收货" forState:UIControlStateNormal];
        }else if([statue isEqualToString:@"5"]){
            _orderStatue.text = @"订单状态：订单已经完成，您已经收货";
            _btnReceive.hidden = YES;
        }else{
            _btnReceive.hidden = YES;
        }
        
    }else{//如果是上级代理
        if([statue isEqualToString:@"-1"]){
            _orderStatue.text = @"订单状态：您已拒绝该订单";
            _btnRefuse.hidden = YES;
            _btnReceive.hidden = YES;
        }else if([statue isEqualToString:@"1"]){
            _orderStatue.text = @"订单状态：等待您接受订单";
            [_btnReceive setTitle:@"接单" forState:UIControlStateNormal];
            _btnRefuse.hidden = NO;
        }else if([statue isEqualToString:@"2"]){
            _orderStatue.text = @"订单状态：等待下级付款";
            _btnRefuse.hidden = YES;
            _btnReceive.hidden = YES;
        }else if([statue isEqualToString:@"3"]){
            _orderStatue.text = @"等待您发货";
            [_btnReceive setTitle:@"发货" forState:UIControlStateNormal];
            _btnRefuse.hidden = YES;
        }else if([statue isEqualToString:@"4"]){
            _orderStatue.text = @"订单状态：等待下级收货";
            _btnRefuse.hidden = YES;
            _btnReceive.hidden = YES;
        }else if([statue isEqualToString:@"5"]){
            _orderStatue.text = @"订单状态：订单已经完成，下级已经收货";
            _btnRefuse.hidden = YES;
            _btnReceive.hidden = YES;
        }else{
            _btnRefuse.hidden = YES;
            _btnReceive.hidden = YES;
        }
    }
    
    _OrderAmount.text = [@"订单数量：" stringByAppendingString:bill.goodsnumber];
    _OrderPerPrice.text = [@"单价：" stringByAppendingString:bill.goodsperval];
    _OrderReceiveAddress.text = [@"收货地址：" stringByAppendingString:bill.receiveaddress];
    
    NSInteger statueInt= [statue intValue];
    if(statueInt >= 4){
        _OrderDeliveryWay.text = [@"快递公司：" stringByAppendingString:bill.deliveryway];
        _OrderDeliveryNumber.text = [@"快递单号：" stringByAppendingString:bill.deliverynumber];
        _OrderDeliveryWay.hidden = NO;
        _OrderDeliveryNumber.hidden = NO;
        
        showWuLiu.hidden = NO;
    }else{
        _OrderDeliveryWay.hidden = YES;
        _OrderDeliveryNumber.hidden = YES;
        
        showWuLiu.hidden = YES;
    }
    
    if(!isUpLevel){//如果是下级代理
        _editOrderDeliveryWay.hidden = YES;
        _editOrderDeliveryNumber.hidden = YES;
        if([statue isEqualToString:@"2"]){
            _btnSendCut.hidden = NO;
        }else{
            _btnSendCut.hidden = YES;
        }
    }else{//如果是上级代理
        if([statue isEqualToString:@"3"]){
            _editOrderDeliveryWay.hidden = NO;
            _editOrderDeliveryNumber.hidden = NO;
        }else{
            _editOrderDeliveryWay.hidden = YES;
            _editOrderDeliveryNumber.hidden = YES;
        }
        _btnSendCut.hidden = YES;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//发送打款截图
- (IBAction)btnSendCut:(id)sender {
    
    NSLog(@"发送打款截图",nil);
    [self editPortrait];

}

- (void)editPortrait {
    UIActionSheet *myActionSheet = [[UIActionSheet alloc]
                                    initWithTitle:@"更换头像"
                                    delegate:self
                                    cancelButtonTitle:@"取消"
                                    destructiveButtonTitle:nil
                                    otherButtonTitles: @"从相册选择", @"拍照",nil];
    [myActionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            //从相册选择
            [self LocalPhoto];
            break;
        case 1:
            //拍照
            [self takePhoto];
            break;
        default:
            break;
    }
}


//拍照
-(void)takePhoto{
    //资源类型为照相机
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    //判断是否有相机
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        NSLog(@"picker : %@",picker);
        picker.delegate = self;
        //设置拍照后的图片可被编辑
        picker.allowsEditing = NO;
        //资源类型为照相机
        picker.sourceType = sourceType;
        //        [self presentModalViewController:picker animated:YES];
        [self presentViewController:picker animated:YES completion:nil];
        
    }else {
        NSLog(@"该设备无摄像头");
    }
}


//从相册选择
-(void)LocalPhoto{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    NSLog(@"picker : %@",picker);
    //资源类型为图片库
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = NO;
    //    [self presentModalViewController:picker animated:YES];
    [self presentViewController:picker animated:YES completion:nil];
    
}

//图像选取器的委托方法，选完图片后回调该方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    ifSendCutPic = YES;
    
    //当图片不为空时经过环信发送截图
    if (image != nil) {
        
        //图片显示在界面上
//        ImageView.image = image;
        NSString *billidPng = [[NSString alloc] initWithFormat:@"%@.png",billId];
        EMChatImage *chatImage = [[EMChatImage alloc] initWithUIImage:image displayName:billidPng];
    
        
        EMImageMessageBody *body = [[EMImageMessageBody alloc] initWithChatObject:chatImage];
        NSString *highId = [QiaokerenApplication getUserSelectData].qhigherid;
        if (highId == nil) {
            [self showHint:@"信息出错，请重进系统"];
            return;
        }
        if ([highId isEqualToString:@"0"]) {
            [self showHint:@"信息出错，请重进系统"];
            return;
        }
        
        EMMessage *msg = [[EMMessage alloc]
                          initWithReceiver:highId
                          bodies:[NSArray arrayWithObject:body]];
        
        [[EaseMob sharedInstance].chatManager sendMessage:msg
                                                 progress:nil
                                                    error:nil];
        
        //获取Documents文件夹目录
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentPath = [path objectAtIndex:0];
        //指定新建文件夹路径
        NSString *imageDocPath = [documentPath stringByAppendingPathComponent:@"ImageFile"];
        //创建ImageFile文件夹
        [[NSFileManager defaultManager] createDirectoryAtPath:imageDocPath withIntermediateDirectories:YES attributes:nil error:nil];

        //保存图片的路径
        NSString * imageFilePath = [imageDocPath stringByAppendingPathComponent:@"bill.png"];
        // 账单的上传
        [self showHint:@"正在上传..."];
        NSMutableDictionary * dic =[[NSMutableDictionary alloc]init];
        [dic setValue:billId forKey:[QiaokerenApplication getBillCut]];
        SEiOSUploadFileDeal *uploadHandler = [[SEiOSUploadFileDeal alloc] init];
        uploadHandler.resultDelegate = self;
        [uploadHandler sendImage:image compressionQuality:0.01 sendURL:[NSURL URLWithString:[QiaokerenApplication getUploadBillCutUrl]] saveFilePath:imageFilePath postKeyValue:dic];
    }
    //关闭相册界面
    [picker dismissModalViewControllerAnimated:YES];
}

- (IBAction)btnRefuse:(id)sender {
    //根据statue来显示内容
    [self sendAcceptOrderMsg:billId Receive:NO];

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

- (IBAction)btnReceive:(id)sender {
    //根据statue来
    if([statue isEqualToString:@"1"]){
        [self sendAcceptOrderMsg:billId Receive:YES];
        
    }else if([statue isEqualToString:@"2"]){
        [self sendMoneyMsg:bill.billid];
        
    }else if([statue isEqualToString:@"3"]){
        if(_editOrderDeliveryWay.text.length == 0){
            
            [EMAlertView showAlertWithTitle:@"提示"
                                    message:@"请输入快递公司"
                            completionBlock:nil
                          cancelButtonTitle:NSLocalizedString(@"ok", @"确定")
                          otherButtonTitles:nil];
            
            return;
        }
        if(_editOrderDeliveryNumber.text.length == 0){
            [EMAlertView showAlertWithTitle:@"提示"
                                    message:@"请输入快递单号"
                            completionBlock:nil
                          cancelButtonTitle:NSLocalizedString(@"ok", @"确定")
                          otherButtonTitles:nil];
            
            return;
        }
        [self sendGoodsMsg:billId Way:_editOrderDeliveryWay.text Number:_editOrderDeliveryNumber.text];
    }else if([statue isEqualToString:@"4"]){
        [self sendReceiveGoodsMsg:billId];
    }else if([statue isEqualToString:@"5"]){
        
    }
    
    [self initOrderDetail];
}

// 处理函数
- (void)dealLabel:(NetUnit*)nUnit{
    
    if ([nUnit->cLabel isEqualToString:@"JZgetBillInfo_c"]) {
        NSString* json = nUnit->receiveString;
//        [{"p":5015,"UserID":"20","UploadTime":"201501282259042","PageSize":"1000","PageIndex":"0","Mark":"1","Content":"SUCCESSFUL","BillSelectDataList":"[{\"p\":10,\"billid\":44,\"goodsid\":1,\"userid\":21,\"upmasteruserid\":20,\"timestamp\":\"201501051007567\",\"billstatus\":\"-1\",\"goodsperval\":\"3\",\"goodsnumber\":\"1\",\"location\":\"112.98857,28.24275\",\"receiveaddress\":\"邮编： 地址：410012 收件人：410012410012\",\"submittime\":\"201501051007567\",\"accepttime\":\"201501051035903\"}]"}]
         NSLog(@"JZgetBillInfo_c: %@",json);
        NSData* data = [json dataUsingEncoding:  NSUTF8StringEncoding ];
        NSArray* array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary*dictionary = [array objectAtIndex:0 ]  ;
        NSString *mark = [dictionary objectForKey:@"Mark"];
        //获取成功
        if([mark isEqualToString:@"1"]){
            
            //判断是否能够组成字典
            NSString *str = [dictionary objectForKey:@"BillSelectDataList"];
            if(str.length < 20){
                return;
            }
            
            NSDictionary*dic = [[NSJSONSerialization JSONObjectWithData:[[dictionary objectForKey:@"BillSelectDataList"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0];
            
            bill = [BillSelectData Jz_initialize];
            [bill initWithInfo:@""
                        billid:[UtilsAll TOString:[dic objectForKey:@"billid"]]
                       goodsid:[UtilsAll TOString:[dic objectForKey:@"goodsid"]]
                        userid:[UtilsAll TOString:[dic objectForKey:@"userid"]]
                upmasteruserid:[UtilsAll TOString:[dic objectForKey:@"upmasteruserid"]]
                     timestamp:[dic objectForKey:@"timestamp"]
                    billstatus:[dic objectForKey:@"billstatus"]
                   goodsperval:[dic objectForKey:@"goodsperval"]
                   goodsnumber:[dic objectForKey:@"goodsnumber"]
                      location:[dic objectForKey:@"location"]
                   sendaddress:[dic objectForKey:@"sendaddress"]
                receiveaddress:[dic objectForKey:@"receiveaddress"]
                deliverynumber:[dic objectForKey:@"deliverynumber"]
                   deliveryway:[dic objectForKey:@"deliveryway"]
                     cutmapres:[dic objectForKey:@"cutmapres"]
                    totalprice:[dic objectForKey:@"totalprice"]
                    submittime:[dic objectForKey:@"submittime"]
                    accepttime:[dic objectForKey:@"accepttime"]
                     sendmoney:[dic objectForKey:@"sendmoney"]
                 sendgoodstime:[dic objectForKey:@"sendgoodstime"]
              receivegoodstime:[dic objectForKey:@"receivegoodstime"]];
            
            //加载数据
            [self initOrderDetail];
        }
        //获取失败
        else{
            [EMAlertView showAlertWithTitle:@"提示"
                                    message:@"获取订单货物详情失败，请重试"
                            completionBlock:nil
                          cancelButtonTitle:NSLocalizedString(@"ok", @"确定")
                          otherButtonTitles:nil];
            
        }
       
    }
    
    //JZgetGoodsInfo_c获取产品详情
    if ([nUnit->cLabel isEqualToString:@"JZgetGoodsInfo_c"]) {
        NSString* json = nUnit->receiveString;
//        NSLog(@"JZgetGoodsInfo_c: %@",json);
        NSData* data = [json dataUsingEncoding:  NSUTF8StringEncoding ];
        NSArray* array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSDictionary*dictionary = [array objectAtIndex:0 ];
        NSString *mark = [dictionary objectForKey:@"Mark"];
        //获取成功
        if([mark isEqualToString:@"1"]){
            
            //判断是否能够组成字典
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
            NSLog(@"获取信息成功：%@",goods);
            [self initGoodsView];
            NSLog(@"initGoodsView run successful?",nil);
        }
        //获取失败
        else{
            [EMAlertView showAlertWithTitle:@"提示"
                                    message:@"获取订单失败，请重试"
                            completionBlock:nil
                          cancelButtonTitle:NSLocalizedString(@"ok", @"确定")
                          otherButtonTitles:nil];
            
        }

    }
    
    
    //JZaccept_c 接单
    if ([nUnit->cLabel isEqualToString:@"JZaccept_c"]) {
        NSString* json = nUnit->receiveString;
                NSLog(@"JZaccept_c: %@",json);
        NSData* data = [json dataUsingEncoding:  NSUTF8StringEncoding ];
        NSArray* array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary*dictionary = [array objectAtIndex:0 ];
        NSString *mark = [dictionary objectForKey:@"Mark"];
        //获取成功
        if([mark isEqualToString:@"1"]){
            [self sendBillsMsg:billId];
            
            statue = [dictionary objectForKey:@"Billstatus"];
            if([statue isEqualToString:@"-1"]){
                [self sendOrderMsgToHuanXin:OrderMsgaccept_S_NO to:bill.userid];
            }else{
                [self sendOrderMsgToHuanXin:OrderMsgaccept_S_OK  to:bill.userid];
            }
            isUpdate = YES;
        }
        //获取失败
        else{
            [EMAlertView showAlertWithTitle:@"提示"
                                    message:@"提交失败，请重试"
                            completionBlock:nil
                          cancelButtonTitle:NSLocalizedString(@"ok", @"确定")
                          otherButtonTitles:nil];
        }
        
    }
    
    //JZsendMoney 打款
    if ([nUnit->cLabel isEqualToString:@"JZsendMoney_C"]) {
        NSString* json = nUnit->receiveString;
                NSLog(@"JZsendMoney_C: %@",json);
        NSData* data = [json dataUsingEncoding:  NSUTF8StringEncoding ];
        NSArray* array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary*dictionary = [array objectAtIndex:0 ];
        NSString *mark = [dictionary objectForKey:@"Mark"];
        //获取成功
        if([mark isEqualToString:@"1"]){
            [self sendBillsMsg:billId];
            
            statue = [dictionary objectForKey:@"Billstatus"];
            [self sendOrderMsgToHuanXin:OrderMsgsendMoney_S to:bill.upmasteruserid];
            isUpdate = YES;
        }
        //获取失败
        else{
            [EMAlertView showAlertWithTitle:@"提示"
                                    message:@"付款失败，请重试"
                            completionBlock:nil
                          cancelButtonTitle:NSLocalizedString(@"ok", @"确定")
                          otherButtonTitles:nil];
        }
        
    }
    
    
    //JZsendGoods_C 发货
    if ([nUnit->cLabel isEqualToString:@"JZsendGoods_C"]) {
        NSString* json = nUnit->receiveString;
                NSLog(@"JZsendGoods_C: %@",json);
        NSData* data = [json dataUsingEncoding:  NSUTF8StringEncoding ];
        NSArray* array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary*dictionary = [array objectAtIndex:0 ];
        NSString *mark = [dictionary objectForKey:@"Mark"];
        //获取成功
        if([mark isEqualToString:@"1"]){
            [self sendBillsMsg:billId];
            
            statue = [dictionary objectForKey:@"Billstatus"];
            [self sendOrderMsgToHuanXin:OrderMsgsendGoods_S  to:bill.userid];
            isUpdate = YES;
            
        }
        //获取失败
        else{
            [EMAlertView showAlertWithTitle:@"提示"
                                    message:@"发货失败，请重试"
                            completionBlock:nil
                          cancelButtonTitle:NSLocalizedString(@"ok", @"确定")
                          otherButtonTitles:nil];
        }
        
    }
    
    //JZreceiveGoods_c 收货
    if ([nUnit->cLabel isEqualToString:@"JZreceiveGoods_c"]) {
        NSString* json = nUnit->receiveString;
                NSLog(@"JZreceiveGoods_c: %@",json);
        NSData* data = [json dataUsingEncoding:  NSUTF8StringEncoding ];
        NSArray* array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary*dictionary = [array objectAtIndex:0 ];
        NSString *mark = [dictionary objectForKey:@"Mark"];
        //获取成功
        if([mark isEqualToString:@"1"]){
            [self sendBillsMsg:billId];
            
            statue = [dictionary objectForKey:@"Billstatus"];
            [self sendOrderMsgToHuanXin:OrderMsgreceiveGoods_S to:bill.upmasteruserid];
            isUpdate = YES;
            
        }
        //获取失败
        else{
            [EMAlertView showAlertWithTitle:@"提示"
                                    message:@"确认收货失败，请重试"
                            completionBlock:nil
                          cancelButtonTitle:NSLocalizedString(@"ok", @"确定")
                          otherButtonTitles:nil];
        }
        
    }
    
    
    
    //获取货物对应的名称和对应的所需要的积分
    
    if ([nUnit->cLabel isEqualToString:@"getGoodinfoNew_C"]) {
        
        NSString* json = nUnit->receiveString;
//        NSLog(@"------------------%@",json);
        NSDictionary*dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:  NSUTF8StringEncoding ] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0 ];
        
        if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"1"]) {
            [self hideHud];
            NSString *str = [dictionary objectForKey:@"GoodsList"];
            if(str.length < 20){
                return;
            }
            
            NSDictionary*dic;
            
            NSArray* array = [NSJSONSerialization JSONObjectWithData:[[dictionary objectForKey:@"GoodsList"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil] ;
            for (int i=0; i<[array count]; i++) {
                dic = [array  objectAtIndex:i];
                
                NewGoodinfoData *goodinfodata = [NewGoodinfoData Jz_initialize];
                [goodinfodata initWithInfo:@"商品信息"
                                   goodsid:[[NSString alloc] initWithFormat:@"%@",[dic objectForKey:@"goodsid"]]
                                 goodsname:[dic objectForKey:@"goodsname"]
                                   QCredit:[dic objectForKey:@"QCredit"]];
                
                [_goodsdata addObject:goodinfodata];
                
            }
            
            //            NSLog(@"+++++::::::-------%lu",(unsigned long)_goodsdata.count);
            
        }
    }
    
    
    if ([nUnit->cLabel isEqualToString:@"changeUserCredit_C"]) {
        NSString* json = nUnit->receiveString;
        NSLog(@"------------------%@",json);
        NSDictionary*dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:  NSUTF8StringEncoding ] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0 ];
        [self hideHud];
        if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"1"]) {
            
            
            
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

- (void) uploadFileCallBack:(NSString*)sendMessage{
    [self showHint:sendMessage];
}

@end
