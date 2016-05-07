//
//  CreiditGoodViewController.m
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-13.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import "CreditGoodViewController.h"
#import "JZCreditGoodTV.h"
#import "CGDetailViewController.h"
#import  "CGDetailView.h"
#import "JZDataHandle.h"
#import "getCreditGood_C.h"
#import  "getCreditGood_S.h"
#import "QiaokerenApplication.h"
#import "UtilsAll.h"
#import "CreditGoodData.h"
#import "JZgetQUserInfo_c.h"
#import "JZgetQUserInfo_s.h"

#define APP_Frame_Height   [[UIScreen mainScreen] applicationFrame].size.height //应用程序的屏幕高度
#define App_Frame_Width    [[UIScreen mainScreen] applicationFrame].size.width  //应用程序的屏幕宽度



@interface CreditGoodViewController ()<CGDetailViewDelegate,JZDataHandleDelegate>
@property (strong, nonatomic) JZScrollview* scroll;
@property (strong, nonatomic) UIView*   headView;
@property (strong, nonatomic) UIView*   labelView;
@property (strong, nonatomic) UITableView*   footView;
@property (strong, nonatomic) UIView *basicView;

@property (strong, nonatomic) NSArray *imagesData;
@property (strong, nonatomic) NSMutableArray* data;
@property (strong, nonatomic) NSMutableArray* data2;
@end


@implementation CreditGoodViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    _data = [NSMutableArray array];
     _data2 = [NSMutableArray array];
    return  self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
  
//    self.imagesData = @[@"image1.jpg", @"image2.jpg", @"image3.jpg", @"image4.jpg", @"image5.jpg", @"image6.jpg"];
//    self.data = [NSMutableArray arrayWithObjects:@"西班牙进口红酒",@"iphone6plus",@"凯迪拉克",@"特斯拉",@"奥迪Q7",@"奔驰S500", nil];
//    self.data2 = [NSMutableArray arrayWithObjects:@"5积分",@"10积分",@"60积分",@"200积分",@"300积分",@"四百积分", nil];
    
//
    [self showHudInView:self.view hint:@"正在加载..."];

    self.footView.delegate=self;
    self.footView.dataSource=self;
//    [self.view addSubview:self.headView];
//    [self.view addSubview:self.labelView];
//    [self.view addSubview:self.footView];
   
    
    [self sendQst];
   
    
    [self.view addSubview:self.basicView];
    
    
    }


-(void)sendQst{
        JZDataHandle*dh = [JZDataHandle initdatahandle];
    dh.JZDatadelegate = self;
    getCreditGood_C * getMsg = [getCreditGood_C Jz_initialize];
    [getMsg initWithInfo:@"请求积分商品列表" UserID:[QiaokerenApplication getAccountNumber] UploadTime:[UtilsAll getFormatTime]];
    
    [dh sendObject:[getMsg toDictionary] time:@"0" protocol:1 label:@"getCreditGood_C"];
    
    
    
}






-(void)dealLabel:(NetUnit *)nUnit{
    [self hideHud];
    if ([nUnit->cLabel isEqualToString:@"getCreditGood_C"]) {
        NSString* json = nUnit->receiveString;
//                NSLog(@"------------------%@",json);
        
        NSDictionary*dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:  NSUTF8StringEncoding ] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0 ];
        if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"1"]) {
            
            NSString *str = [dictionary objectForKey:@"CreditGoodsList"];
            if(str.length < 20){
                return;
            }

            
            NSDictionary*dic;

            NSArray* array = [NSJSONSerialization JSONObjectWithData:[[dictionary objectForKey:@"CreditGoodsList"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil] ;
            //            NSLog(@"%lu",(unsigned long)[array count]);

            for (int i=0; i<[array count]; i++) {
                dic = [array  objectAtIndex:i];
                CreditGoodData* goodData = [CreditGoodData Jz_initialize];
                [goodData initWithInfo:@"积分商品信息"
                               goodsid:[[NSString alloc] initWithFormat:@"%@",[dic objectForKey:@"goodsid"]]
                             goodsname:[dic objectForKey:@"goodsname"]
                         goodsdiscribe:[dic objectForKey:@"goodsdiscribe"]
                             goodslogo:[dic objectForKey:@"goodslogo"]
                              goodssrc:[dic objectForKey:@"goodssrc"]
                           goodsfacval:[dic objectForKey:@"goodsfacval"]
                             goodstval:[dic objectForKey:@"goodstval"]
                           goodsoneval:[dic objectForKey:@"goodsoneval"]
                           goodstwoval:[dic objectForKey:@"goodstwoval"]
                           goodstheval:[dic objectForKey:@"goodstheval"]
                                  time:[dic objectForKey:@"time"]];
                [_data addObject:goodData];
            }

//             [self.footView reloadData];
             [self.footView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
            
        }else{
            UIAlertView * myAlert = [[UIAlertView alloc]initWithTitle:@"提示:" message:@"获取信息列表失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [myAlert show];
        }
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

-(UIView*)headView
{

    if (_headView == nil) {
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, App_Frame_Width, 125)];
        self.scroll = [[JZScrollview alloc]initPageViewWithFrame:CGRectMake(0, 0, App_Frame_Width,125) views:self.imagesData];
        [_headView addSubview:self.scroll];
       
    }
     return _headView;
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
        title.text=@"积分商品";
        //显示分割线
        CGRect carveUpRect = CGRectMake(3, 24, CGRectGetWidth(self.view.frame)-3,0.5);
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
     _footView = [[UITableView alloc] initWithFrame:CGRectMake(0, 25, CGRectGetWidth(self.view.frame),300)];
        
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
    if (cell==nil) {
        cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
            }
        
    JZCreditGoodTV* creditgood = [[JZCreditGoodTV alloc]
                                        initCGWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame),100)
                                            imageUrl:[[_data objectAtIndex:(indexPath.row)] goodslogo]
                                          needCredit:[[_data objectAtIndex:(indexPath.row)] goodsfacval]
                                      creditGoodName:[[_data objectAtIndex:(indexPath.row)] goodsdiscribe]
                                   creditgoodtype:[[_data objectAtIndex:(indexPath.row)] goodssrc]];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"哈哈"]
//                                            message:nil
//                                            delegate:nil
//                                cancelButtonTitle:@"确定"
//                                otherButtonTitles:nil, nil];
//                       
//                           [alert show];
    
    CGDetailViewController* CDDvc = [[CGDetailViewController alloc]initWithNibName:nil bundle:nil CreditGoodData:[_data objectAtIndex:(indexPath.row)]];
    [CDDvc setTitle:@"商品详情"];
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    //并将视图控制器添加到根视图控制器中 并显示出来
    [self.navigationController pushViewController:CDDvc animated:YES];

    
    
    
    
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
