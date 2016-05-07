//
//  ViewController.m
//  TestIOS
//
//  Created by lenbol on 13-6-5.
//  Copyright (c) 2013年 lenbol. All rights reserved.
//

#import "MyDownOrderViewController.h"
#import "OrderDetailViewController.h"
#import "DBImageView.h"
#import "JZgetBillInfo_c.h"
#import "QiaokerenApplication.h"
#import "UtilsAll.h"
#import "BillSelectData.h"
#import "JZgetNews_c.h"
#import "GoodsInfoSelectData.h"
@interface MyDownOrderViewController ()<OrderDetailViewDelegate>{
    NSArray *_items;
}

@end

@implementation MyDownOrderViewController
@synthesize tvCell;
@synthesize data;
//@synthesize jzDataHandle;
NSString *statue;
NSInteger ClickPositionDown = -1;
- (void)viewDidLoad
{
    self.title = @"下级订单";
    
    data = [NSMutableArray array];
    
//    jzDataHandle = [JZDataHandle initdatahandle];
//    jzDataHandle.JZDatadelegate = self;
    [self sendBillsMsg];
    [self showHudInView:self.view hint:@"正在加载..."];
    
    statue = @"3";
    
    _items = @[@"http://siliconangle.com/files/2012/03/github_logo.jpg",
    @"https://octodex.github.com/images/octobiwan.jpg",
    @"https://octodex.github.com/images/murakamicat.png",
    @"http://pic25.nipic.com/20121111/11343727_160018335122_2.jpg",
    @"http://pic31.nipic.com/20130726/6513927_224744810000_2.jpg"];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)sendBillsMsg{
    JZgetBillInfo_c *li = [JZgetBillInfo_c Jz_initialize];
    [li initWithInfo:@"" UserID:[QiaokerenApplication getAccountNumber] UploadTime:[UtilsAll getFormatTime] BillID:@"0" SearchUserID:@"0" SearchUpUserID:[QiaokerenApplication getAccountNumber] PageSize:@"10" PageIndex:@"0"];
    NSDictionary *nsdic = [li toDictionary];
//    NSdata* data = [NSJSONSerialization JSONObjectWithData:nsdic options NSJSONReadingMutableContainers error:nil];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:nsdic time:@"2015" protocol:1823 label:@"JZgetBillInfo_c"];
    NSLog(@"JZgetBillInfo_c1231231231111111");
}


-(void ) viewDidUnload
{
    //self.computers = nil;
    //2
    self.tvCell = nil;
    [super viewDidUnload];
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
//
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //2
    static NSString *CustomCellIdentifier = @"CustomDownCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier];
    if(cell ==nil)
    {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"CustomDownCell" owner:self options:nil];
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
        
    }
    
    UILabel *labelAmount = (UILabel *)[cell viewWithTag:kAmountDownValueTag];
    labelAmount.text = [[NSString alloc] initWithFormat:@"数量：%@",bill.goodsnumber];
    UILabel *labelTime = (UILabel *)[cell viewWithTag:kTimeDownValueTag];
    labelTime.text = [UtilsAll getNoYearChineseTime:bill.timestamp];
    UILabel *labelPerPrice = (UILabel *)[cell viewWithTag:kPerPriceDownValueTag];
    labelPerPrice.text =[[NSString alloc] initWithFormat:@"单价：%@",bill.goodsperval];
    UILabel *labelResource =(UILabel *)[cell viewWithTag:kResourceDownValueTag];
    labelResource.text =[[NSString alloc] initWithFormat:@"订单来源：%@",bill.upmasteruserid];
    UILabel *labelAction = (UILabel *)[cell viewWithTag:kActionDownValueTag];
    NSString *statue = bill.billstatus;
    if([statue isEqualToString:@"-1"]){
        labelAction.text = @"您已拒绝";
    }else if([statue isEqualToString:@"1"]){
        labelAction.text = @"等待您接单";
    }else if([statue isEqualToString:@"2"]){
        labelAction.text = @"等待下级付款";
    }else if([statue isEqualToString:@"3"]){
        labelAction.text = @"等待您发货";
    }else if([statue isEqualToString:@"4"]){
        labelAction.text = @"等待下级收货";
    }else if([statue isEqualToString:@"5"]){
        labelAction.text = @"下级已收货";
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
    BillSelectData *bill = [data objectAtIndex:indexPath.row];
    ClickPositionDown = indexPath.row;
    [orderDetailController setGoodsId:bill.goodsid AndBillId:bill.billid IsUpOrDown:@"2"];
    
    orderDetailController.delegate = self;
    [self.navigationController pushViewController:orderDetailController animated:YES];
    
}


//订单状态改变之后
- (void)changeOrderStatue:(NSString *)value
{
    statue = value;
    if(ClickPositionDown != -1){
        BillSelectData *bill = [data objectAtIndex:ClickPositionDown];
        bill.billstatus = statue;
        int abc = (int)ClickPositionDown;
        [data removeObject:[NSNumber numberWithInt:abc]];
        [data insertObject:bill atIndex:ClickPositionDown];
    }
    
    [_tableview reloadData];
}


/***********************************************************************/


// 处理函数
- (void)dealLabel:(NetUnit*)nUnit{
    [self hideHud];
    if ([nUnit->cLabel isEqualToString:@"JZgetBillInfo_c"]) {
        NSString * json = nUnit->receiveString;
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
                
//                NSLog(@"count bill 123 = %d",(int)[data count]);
            }
            //        NSLog(@"%lu",(unsigned long)[data count]);
            
            [_tableview reloadData];
            
        }
        //获取失败
        else{
            
        }
        
    }
    
}


@end
