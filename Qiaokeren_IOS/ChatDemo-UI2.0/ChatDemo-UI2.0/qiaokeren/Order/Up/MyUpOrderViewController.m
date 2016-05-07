//
//  ViewController.m
//  TestIOS
//
//  Created by lenbol on 13-6-5.
//  Copyright (c) 2013年 lenbol. All rights reserved.
//

#import "MyUpOrderViewController.h"
#import "OrderDetailViewController.h"
#import "DBImageView.h"
#import "JZgetBillInfo_c.h"
#import "QiaokerenApplication.h"
#import "UtilsAll.h"
#import "BillSelectData.h"
#import "GoodsInfoSelectData.h"
@interface MyUpOrderViewController ()<OrderDetailViewDelegate>

@end

@implementation MyUpOrderViewController
@synthesize tvCell;
@synthesize data;
//@synthesize jzDataHandle;
NSString *statue;
NSInteger ClickPosition = -1;
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"上级订单";
    [super viewDidLoad];
    data = [NSMutableArray array];
    [self sendBillsMsg];
    [self showHudInView:self.view hint:@"正在加载..."];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

-(void)sendBillsMsg{
    JZgetBillInfo_c *li = [JZgetBillInfo_c Jz_initialize];
    [li initWithInfo:@"" UserID:[QiaokerenApplication getAccountNumber] UploadTime:[UtilsAll getFormatTime] BillID:@"0" SearchUserID:[QiaokerenApplication getAccountNumber] SearchUpUserID:@"0" PageSize:@"1000" PageIndex:@"0"];
    NSDictionary *nsdic = [li toDictionary];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:nsdic time:@"2015" protocol:1823 label:@"JZgetBillInfo_c"];
//    NSLog(@"JZgetBillInfo_c123123123");
}

-(void ) viewDidUnload
{
    [super viewDidUnload];
    //self.computers = nil;
    //2
    self.computers = nil;
    self.tvCell = nil;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark-
#pragma mark Table Data Source Methods
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data count];
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CustomCellIdentifier = @"CustomUpCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier];
    if(cell ==nil)
    {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"CustomUpCell" owner:self options:nil];
        if([nib count]>0)
        {
            cell = self.tvCell;
        }
        else{
            NSLog(@"fail load nib");
        }
    }
    NSUInteger row = [indexPath row];
    
    BillSelectData *bill = [data objectAtIndex:row];
    
//    NSDictionary *rowData = [self.computers objectAtIndex:row];
//    UIImage *imgBg = (UIImage *)[cell viewWithTag:kImageValueTag];
    DBImageView *imageView = [[DBImageView alloc] initWithFrame:(CGRect){ 5, 5, 80, 80 }];
    [cell.contentView addSubview:imageView];
    
    NSMutableArray *goodsArray = [QiaokerenApplication getGoodsArray];
    if(goodsArray){
        int count = (int)[goodsArray count];
        NSLog(@"count = %d",count);
        if(count > 0){
            for(int i=0;i<count;i++){
                GoodsInfoSelectData *goods = [goodsArray objectAtIndex:i];
                NSLog(@"goods.goodslogo = %@",goods.goodslogo);
                if([goods.goodsid isEqualToString:bill.goodsid]){
                    [imageView setImageWithPath:goods.goodslogo];
                }
            }
        }
        
    }else{
        NSLog(@"count = nil ...");
    }
    
    
    UILabel *labelAmount = (UILabel *)[cell viewWithTag:kAmountValueTag];
    labelAmount.text = [[NSString alloc] initWithFormat:@"数量：%@",bill.goodsnumber];
    UILabel *labelTime = (UILabel *)[cell viewWithTag:kTimeValueTag];
    labelTime.text = [UtilsAll getNoYearChineseTime:bill.timestamp];
    UILabel *labelPerPrice = (UILabel *)[cell viewWithTag:kPerPriceValueTag];
    labelPerPrice.text =[[NSString alloc] initWithFormat:@"单价：%@",bill.goodsperval];
    UILabel *labelResource =(UILabel *)[cell viewWithTag:kResourceValueTag];
    labelResource.text =[[NSString alloc] initWithFormat:@"货物来源：%@",bill.upmasteruserid];
    UILabel *labelAction = (UILabel *)[cell viewWithTag:kActionValueTag];
    
    NSString *statue = bill.billstatus;
    
    if([statue isEqualToString:@"-1"]){
       labelAction.text = @"上级拒绝接单";
    }else if([statue isEqualToString:@"1"]){
        labelAction.text = @"等待上级接单";
    }else if([statue isEqualToString:@"2"]){
        labelAction.text = @"等待您付款";
    }else if([statue isEqualToString:@"3"]){
       labelAction.text = @"等待上级发货";
    }else if([statue isEqualToString:@"4"]){
       labelAction.text = @"等待您收货";
    }else if([statue isEqualToString:@"5"]){
        labelAction.text = @"您已收货";
    }else{
        labelAction.text = @"";
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    OrderDetailViewController *orderDetailController =  [[OrderDetailViewController alloc] init];
    
    orderDetailController.delegate = self;
    
    
    ClickPosition = indexPath.row;
    BillSelectData *bill = [data objectAtIndex:ClickPosition];
    [orderDetailController setGoodsId:bill.goodsid AndBillId:bill.billid IsUpOrDown:@"1"];
    [self.navigationController pushViewController:orderDetailController animated:YES];
    
}

//订单状态改变之后
- (void)changeOrderStatue:(NSString *)value
{
    statue = value;
    if(ClickPosition != -1){
        BillSelectData *bill = [data objectAtIndex:ClickPosition];
        bill.billstatus = statue;
        [data removeObject:[NSNumber numberWithInt:ClickPosition]];
        [data insertObject:bill atIndex:ClickPosition];
    }
    [_tableview reloadData];
}

/***********************************************************************/

// 处理函数
- (void)dealLabel:(NetUnit*)nUnit{
//    NSLog(@"dealLabeldealLabel---JZgetBillInfo_c");
    [self hideHud];
    if ([nUnit->cLabel isEqualToString:@"JZgetBillInfo_c"]) {
        NSString* json = nUnit->receiveString;
        
        [self hideHud];
        //        [{"p":5015,"UserID":"20","UploadTime":"201501282259042","PageSize":"1000","PageIndex":"0","Mark":"1","Content":"SUCCESSFUL","BillSelectDataList":"[{\"p\":10,\"billid\":44,\"goodsid\":1,\"userid\":21,\"upmasteruserid\":20,\"timestamp\":\"201501051007567\",\"billstatus\":\"-1\",\"goodsperval\":\"3\",\"goodsnumber\":\"1\",\"location\":\"112.98857,28.24275\",\"receiveaddress\":\"邮编： 地址：410012 收件人：410012410012\",\"submittime\":\"201501051007567\",\"accepttime\":\"201501051035903\"}]"}]
        NSDictionary*dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:  NSUTF8StringEncoding ] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0 ];
        
        if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"1"]) {
            
            NSDictionary*dic;
            
            //判断是否能够组成字典
            NSString *str = [dictionary objectForKey:@"BillSelectDataList"];
            if(str.length < 20){
                return;
            }
            NSArray* array = [NSJSONSerialization JSONObjectWithData:[[dictionary objectForKey:@"BillSelectDataList"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil] ;
            //            NSLog(@"%lu",(unsigned long)[array count]);
            for (int i=0; i<[array count]; i++) {
                dic = [array  objectAtIndex:i];
                BillSelectData *bill = [BillSelectData Jz_initialize];
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
                [data addObject:bill];
                
//                NSLog(@"count bill 123 = %d",[data count]);
            }
            //        NSLog(@"%lu",(unsigned long)[data count]);
            
            [_tableview reloadData];
            
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
    
}

@end
