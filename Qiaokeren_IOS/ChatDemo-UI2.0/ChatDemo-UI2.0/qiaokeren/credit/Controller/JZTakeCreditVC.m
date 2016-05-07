//
//  JZTakeCreditVC.m
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-23.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//
#import "JZTakeCreditVC.h"
#import "JZExchangeBillVIew.h"
#import "QiaokerenApplication.h"
#import "UtilsAll.h"
#import "JZDataHandle.h"


#import "CreditBillData.h"
#import "getCreditBil_C.h"
#import "getCreditBil_S.h"
#import "changeCreditBil_C.h"
#import "changeCreditBil_S.h"


#define APP_Frame_Height   [[UIScreen mainScreen] applicationFrame].size.height //应用程序的屏幕高度
#define App_Frame_Width    [[UIScreen mainScreen] applicationFrame].size.width  //应用程序的屏幕宽度

@interface JZTakeCreditVC ()<JZExchangeBillDelegate,JZDataHandleDelegate>

@property (strong, nonatomic) UITableView*   footView;
@property (strong, nonatomic) UIView*  labelView;

@property (strong, nonatomic) UIView* basicView;



@property (strong, nonatomic) NSMutableArray* data;


@end

@implementation JZTakeCreditVC


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    _data = [NSMutableArray array];
    
    return  self;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    self.footView.delegate=self;
    self.footView.dataSource=self;
    
    
    [self sendQst];
    
    [self.view addSubview:self.basicView];
    //    [self.view addSubview:self.footView];
    [self showHudInView:self.view hint:@"正在加载..."];
    
    
   }





- (void)JZExchangeBillDidClickedFInish:(NSString *)_billid billstatus:(NSString *)_billstatus{
    
    
//    [self sendQstAccpet:_billid billstatus:_billstatus];
    
}






-(void)sendQstAccpet:(NSString*)_billid billstatus:(NSString*)_billstatus{
    
    [self showHudInView:self.view hint:@"正在提交请求..."];
    JZDataHandle*dh = [JZDataHandle initdatahandle];
    dh.JZDatadelegate = self;
    
    changeCreditBil_C * changebill = [changeCreditBil_C Jz_initialize];
    [changebill initWithInfo:@"接受积分账单请求"
                      UserID:@"21"//此处测试完后 改为[QiaokerenApplication getAccountNumber]
                      billid:_billid
                  UploadTime:[UtilsAll getFormatTime]
                  billstatus:_billstatus
                    supOrsub:@"1"];
    [dh sendObject:[changebill toDictionary] time:@"0" protocol:1 label:@"changeCreditBil_C"];
    
    
}







-(void)sendQst{
    //    [self showHudInView:self.view hint:@"正在加载..."];
    [_data removeAllObjects];
    JZDataHandle*dh = [JZDataHandle initdatahandle];
    dh.JZDatadelegate = self;
    getCreditBil_C * getMsg = [getCreditBil_C Jz_initialize];
    
    //[UtilsAll getFormatTime]
    //[QiaokerenApplication getAccountNumber]
    [getMsg initWithInfo:@"下级获取积分账单"
                  UserID:[QiaokerenApplication getAccountNumber]
              UploadTime:[UtilsAll getFormatTime]
                supOrsub:@"2"
                PageSize:@"100"
               PageIndex:@"0"];
    
    
    [dh sendObject:[getMsg toDictionary] time:@"0" protocol:1 label:@"getCreditBil_C"];
    
    
    
}



-(void)dealLabel:(NetUnit *)nUnit
{
    if ([nUnit->cLabel isEqualToString:@"getCreditBil_C"]) {
        
        NSString* json = nUnit->receiveString;
        //        NSLog(@"------------------%@",json);
        NSDictionary*dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:  NSUTF8StringEncoding ] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0 ];
        if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"1"]) {
            [self hideHud];
            NSString *str = [dictionary objectForKey:@"BillSelectDataList"];
            if(str.length < 20){
                return;
            }
            
            NSDictionary*dic;
            
            NSArray* array = [NSJSONSerialization JSONObjectWithData:[[dictionary objectForKey:@"BillSelectDataList"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil] ;
            for (int i=0; i<[array count]; i++) {
                dic = [array  objectAtIndex:i];
                
                //                UserSeletData * userdata = [QiaokerenApplication getUserSelectData];
                
                CreditBillData* billdata = [CreditBillData Jz_initialize];
                [ billdata
                 initWithInfo:@"积分账单表"
                 billid:[[NSString alloc] initWithFormat:@"%@",[dic objectForKey:@"billid"]]
                 goodsid:[[NSString alloc] initWithFormat:@"%@",[dic objectForKey:@"goodsid"]]
                 userid:[[NSString alloc] initWithFormat:@"%@",[dic objectForKey:@"userid"]]
                 upmasteruserid:[[NSString alloc] initWithFormat:@"%@",[dic objectForKey:@"upmasteruserid"]]
                 hhtimestamp:[dic objectForKey:@"timestamp"]
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
                 receivegoodstime:[dic objectForKey:@"receivegoodstime"]
                 mark:[dic objectForKey:@"mark"]];
                [_data addObject:billdata];
                
                
            }
            
            //            [self.footView reloadData];
            [self.footView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
            
        }else{
            [self hideHud];
            UIAlertView * myAlert = [[UIAlertView alloc]initWithTitle:@"提示:" message:@"获取信息列表失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [myAlert show];
        }
    }
    
    
    
    if ([nUnit->cLabel isEqualToString:@"changeCreditBil_C"]) {
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
            
            //
            //
            
        }else if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"2"]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"订单提交失败"]
                                                            message:nil
                                                           delegate:nil
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil, nil];
            
            [alert show];
            
            
        }
        
        [self sendQst];
        
        
    }
    
    
    
}





-(UIView*)basicView
{
    if (_basicView == nil) {
        //获取状态栏的高度
        CGRect rect = [[UIApplication sharedApplication] statusBarFrame];
        int statusBarHeight = rect.size.height;
        //获取导航栏的高度
        CGFloat navigationBarHeight = CGRectGetHeight(self.navigationController.navigationBar.frame);
        
        
        int progressViewY = statusBarHeight + navigationBarHeight;
        _basicView = [[UIView alloc] initWithFrame:CGRectMake(0, progressViewY, CGRectGetWidth(self.view.frame),(APP_Frame_Height-progressViewY))];
        
        [_basicView addSubview:self.labelView];
        [_basicView addSubview:self.footView];
        
    }
    return _basicView;
    
    
}





-(UIView*)labelView
{
    if (_labelView==nil) {
        // 中间现实积分商品字样的View
        _labelView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame),25)];
        //显示标签
        UILabel*title =[[UILabel alloc]initWithFrame: CGRectMake(5, 5, CGRectGetWidth(self.view.frame), 15)];
        title.font=[UIFont systemFontOfSize:12];
        title.textAlignment = NSTextAlignmentLeft;//NSTextAlignmentCenter  NSTextAlignmentRight
        title.text=@"兑换账单";
        //显示分割线
        CGRect carveUpRect = CGRectMake(3, 24, CGRectGetWidth(self.view.frame)-6,0.5);
        UILabel* carveup = [[UILabel alloc]initWithFrame:carveUpRect];
        carveup.layer.borderColor = [UIColor lightGrayColor].CGColor;
        carveup.layer.borderWidth = 0.5;
        
        [_labelView addSubview:title];
        [_labelView addSubview:carveup];
        //      _labelView.backgroundColor = [UIColor greenColor];
    }
    return _labelView;
    
}





-(UIView*)footView
{
    if (_footView == nil){
        _footView = [[UITableView alloc] initWithFrame:CGRectMake(0, 25, CGRectGetWidth(self.view.frame),400)];
        
        //        _footView.backgroundColor = [UIColor lightGrayColor];
    }
    return _footView;
}



#pragma mark-
#pragma mark Table Data Source Methods
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    //有几个表单
    
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{    //表单中有多少项
    // Return the number of rows in the section.
    //    if(section==0){
    //        return 1;
    //    }
    return  _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"myCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell==nil) {
        cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
//    }
    
    
    JZExchangeBillVIew* creditgood = [[JZExchangeBillVIew alloc]
                                      initCGWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame),100)
                                      requesterName:[[_data objectAtIndex:indexPath.row]
                                                     sendaddress]
                                      requesterAdress:[[_data objectAtIndex:indexPath.row] receiveaddress]
                                      creditGoodName:[[_data objectAtIndex:indexPath.row] deliveryway]
                                      creditGoodNum:[[_data objectAtIndex:indexPath.row] goodsnumber]
                                      totalCredit: [[_data objectAtIndex:indexPath.row] hhlocation]
                                      creditgoodtype:[[_data objectAtIndex:indexPath.row] deliverynumber]
                                      creditbillstate:[[_data objectAtIndex:indexPath.row] billstatus]
                                      billid:[[_data objectAtIndex:indexPath.row] billid]
                                      subsup:@"取消"
                                      time:[[_data objectAtIndex:indexPath.row] hhtimestamp ]];
    creditgood.CFDelegate =self;
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell.contentView addSubview: creditgood];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tabelView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0f;
}



//每个section底部标题高度（实现这个代理方法后前面 sectionHeaderHeight 设定的高度无效）
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

//每个section头部标题高度（实现这个代理方法后前面 sectionFooterHeight 设定的高度无效）
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

#pragma mark - Table view delegate
//应用委托 当选择一个列表项时收到通知 执行以下方法

//选中之前执行,判断选中的行（阻止选中第一行）
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //    if ([indexPath section] == 0)
    //        return nil;
    return indexPath;
}



//- (void)reloadRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation {
//
//
//
//
//}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"哈哈"]
    //                                            message:nil
    //                                            delegate:nil
    //                                cancelButtonTitle:@"确定"
    //                                otherButtonTitles:nil, nil];
    //
    //                           [alert show];
    
    //    CGDetailViewController* CDDvc = [[CGDetailViewController alloc]initWithNibName:nil bundle:nil CreditGoodData:[_data objectAtIndex:(indexPath.row)]];
    //    [CDDvc setTitle:@"商品详情"];
    //    //    [self.navigationController setNavigationBarHidden:YES animated:NO];
    //
    //    //并将视图控制器添加到根视图控制器中 并显示出来
    //    [self.navigationController pushViewController:CDDvc animated:YES];
    
    
    
    
    
    //    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //    NSLog(@"%@",@"这里面执行了么  setSellected");
    //    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    //
    //
    //
    //
    //        //设置返回键显示出来（就是视屏播放器那个界面有titlebar上有返回键
    //    [self.navigationController setNavigationBarHidden:YES animated:NO];
    //    //并将视图控制器添加到根视图控制器中 并显示出来
    //    [self.navigationController pushViewController:mpMoviePlayerViewController animated:YES];
    //
    
    
    
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
