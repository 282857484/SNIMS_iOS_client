//
//  ViewController.m
//  TestIOS
//
//  Created by lenbol on 13-6-5.
//  Copyright (c) 2013年 lenbol. All rights reserved.
//

#import "GoodsViewController.h"
#import "GoodsDetailViewController.h"
#import "DBImageView.h"
#import "UIImageView+DispatchLoad.h"
#import "GoodsInfoSelectData.h"
#import "JZgetGoodsInfo_c.h"
#import "UtilsAll.h"
#import "QiaokerenApplication.h"
@interface GoodsViewController (){
    
}

@end

@implementation GoodsViewController
@synthesize computers;
@synthesize tvCell;
@synthesize data;

int screenwidth = 300;
bool HasLoadFlagGoods = NO;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"产品";
    screenwidth = self.view.frame.size.width;
    data = [NSMutableArray array];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self sendGoodsInfoMsg];
    if (!HasLoadFlagGoods) {
        [self showHudInView:self.view hint:@"正在加载..."];
    }
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self hideHud];
}

//获取产品详情
-(void)sendGoodsInfoMsg{
    JZgetGoodsInfo_c *li = [JZgetGoodsInfo_c Jz_initialize];
    [li initWithInfo:@"" UserID:[QiaokerenApplication getAccountNumber] UploadTime:[UtilsAll getFormatTime555] PageSize:@"10" PageIndex:@"0"];
    NSDictionary *nsdic = [li toDictionary];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:nsdic time:@"1212" protocol:1212 label:@"JZgetGoodsInfo_c"];
}

-(void ) viewDidUnload
{
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CustomCellIdentifier = @"CustomGoodsCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier];
    if(cell ==nil)
    {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"CustomGoodsCell" owner:self options:nil];
        if([nib count]>0)
        {
            cell = self.tvCell;
        }
        else{
            NSLog(@"fail load nib");
        }
    }
    NSUInteger row = [indexPath row];
    UILabel *labelAmount = (UILabel *)[cell viewWithTag:kTitleValueGoodsTag];
    
    GoodsInfoSelectData *goods = [data objectAtIndex:row];
    labelAmount.text = goods.goodsname;
    UILabel *labelTime = (UILabel *)[cell viewWithTag:kDescribeValueGoodsTag];
    
    labelTime.text = goods.goodsdiscribe;
    
    DBImageView *imageView = [[DBImageView alloc] initWithFrame:(CGRect){ 5, 5, 80, 80 }];
    [cell.contentView addSubview:imageView];
    
    [imageView setImageWithPath:goods.goodslogo];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([QiaokerenApplication getAccountType] != 0) { // 权限
        GoodsDetailViewController *goodsDetailController =  [[GoodsDetailViewController alloc] init];
        GoodsInfoSelectData *goods = [data objectAtIndex:indexPath.row];
        [goodsDetailController setSelectedGoodsId:goods.goodsid GoodsArray:data];
        [self.navigationController pushViewController:goodsDetailController animated:YES];
    }
}


// 处理函数
- (void)dealLabel:(NetUnit*)nUnit{
    if([nUnit->cLabel isEqualToString:@"JZgetGoodsInfo_c"]){
        
        NSString *json = nUnit->receiveString;
//        NSLog(@"JZgetGoodsInfo_c:%@",json);
        //更新ui，解析json
        NSDictionary*dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:  NSUTF8StringEncoding ] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0 ];
        if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"1"]) {
            HasLoadFlagGoods = YES;
            NSDictionary*dic;
            //判断是否能够组成字典
            NSString *str = [dictionary objectForKey:@"GoodsList"];
            if(str.length < 20){
                return;
            }
            
            NSArray* array = [NSJSONSerialization JSONObjectWithData:[[dictionary objectForKey:@"GoodsList"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil] ;
            [data removeAllObjects];
            for (int i=0; i<[array count]; i++) {
                dic = [array  objectAtIndex:i];
                GoodsInfoSelectData *goods = [GoodsInfoSelectData Jz_initialize];
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

                [data addObject:goods];
                
            }
            
            [_tableview reloadData];
            [QiaokerenApplication setGoodsArray:data];
            
        }else{
            
        }
    }
    [self hideHud];
}
@end
