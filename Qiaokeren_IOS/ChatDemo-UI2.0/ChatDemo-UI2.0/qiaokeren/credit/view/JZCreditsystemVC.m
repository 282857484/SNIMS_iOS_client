//
//  JZCreditsystemVC.m
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-17.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//
#define APP_Frame_Height   [[UIScreen mainScreen] applicationFrame].size.height //应用程序的屏幕高度
#define App_Frame_Width    [[UIScreen mainScreen] applicationFrame].size.width  //应用程序的屏幕宽度
#import "JZCreditsystemVC.h"
#import "JZCreditsystemVIew.h"
#import "QiaokerenApplication.h"
#import "UtilsAll.h"
#import "getUserCredit_C.h"
#import "getUserCredit_S.h"
#import "JZDataHandle.h"
#import "UserCreditData.h"

#import "JZExchangeBillVC.h"
#import "JZTakeCreditVC.h"
#import "JZContributionVC.h"

@interface JZCreditsystemVC ()<JZDataHandleDelegate>
@property (strong, nonatomic) JZCreditsystemVIew* topview;
@property (strong, nonatomic) UIView*   headView;
@property (strong, nonatomic) UITableView*  footView;
@property (strong, nonatomic) UIView *basicView;


@property (strong, nonatomic) NSMutableArray* data;
@end

@implementation JZCreditsystemVC



static JZCreditsystemVC *activityView;

+ (JZCreditsystemVC *)sharedActivityView
{
    if (!activityView) {
        activityView = [[JZCreditsystemVC alloc]initWithNibName:nil bundle:nil];
    }
    return activityView;
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
        _data = [NSMutableArray array];
    activityView = self;
    //    _data2 = [NSMutableArray array];
    return  self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.topview = [[JZCreditsystemVIew alloc]initCGWithFrame:CGRectMake(0, 0, App_Frame_Width,165)  monthCredit:@"666" yearCredit:@"888"];

   
    [self sendQst];
    [self.view addSubview:self.basicView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



-(void)sendQst{
//    [self showHudInView:self.view hint:@"正在提交..."];
    JZDataHandle*dh = [JZDataHandle initdatahandle];
    dh.JZDatadelegate = self;
    getUserCredit_C * getMsg = [getUserCredit_C Jz_initialize];
    
    //[UtilsAll getFormatTime]
    //[QiaokerenApplication getAccountNumber]
    [getMsg initWithInfo:@"获取积分列表" UserID:[QiaokerenApplication getAccountNumber] UploadTime:[UtilsAll getFormatTime] time:[UtilsAll getFormatTime]];
    
    
    [dh sendObject:[getMsg toDictionary] time:@"0" protocol:1 label:@"getUserCredit_C"];
    
    
    
}


//[{"p":917,"UserID":"10000","UploadTime":"201507221058052","Mark":"1","Content":"SUCCESSFUL","userCreditList":"[{\"p\":14,\"creditid\":1,\"userid\":10000,\"timestamp\":\"201507221022048\",\"userlevel\":\"5\",\"monthcredit\":\"66\",\"quartercredit\":\"88\",\"yearcredit\":\"888\",\"time\":\"2015-07-22 10:55:56.0\"}]"}]


-(void)dealLabel:(NetUnit *)nUnit
{
    if ([nUnit->cLabel isEqualToString:@"getUserCredit_C"]) {
        NSString* json = nUnit->receiveString;
        NSLog(@"------------------%@",json);
         NSDictionary*dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:  NSUTF8StringEncoding ] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0 ];
        if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"1"]) {
            
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
            NSLog(@"+++++++++++%lu",(unsigned long)_data.count);
            UserCreditData* a = [_data objectAtIndex:0];
            self.topview.monthCreditLB.text = a.monthcredit;
            self.topview.BTmonthCreditLB.text =a.monthcredit;
            self.topview.yearCreditLB.text =a.yearcredit;
        }else{
            UIAlertView * myAlert = [[UIAlertView alloc]initWithTitle:@"提示:" message:@"获取信息列表失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [myAlert show];
        }
    }
}


//-(void)getMonthYear:(monthAndYear)monthYearblock{
//    
//       
//      monthYearblock([[_data objectAtIndex:0] monthCredit],[[_data objectAtIndex:0] yearCredit]);
//    
//    
//}






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
        [_basicView addSubview:self.headView];
        [_basicView addSubview:self.footView];
        
    }
    return _basicView;
    
    
    
    
    
}





-(UIView*)headView
{
    
    if (_headView == nil) {
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, App_Frame_Width, 165)];
        [_headView addSubview:self.topview];
        
    }
    return _headView;
}


-(UIView*)footView
{
    if (_footView == nil){
        _footView = [[UITableView alloc] initWithFrame:CGRectMake(0, 170, CGRectGetWidth(self.view.frame),150)];
//        _footView.backgroundColor = [UIColor lightGrayColor];
        _footView.delegate=self ;
        _footView.dataSource =self;
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
    return  3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"myCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:
               CellIdentifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];//设置点击没有效果
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;//显示右边小箭头
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text=@"战绩";
            break;
        case 1:
            cell.textLabel.text=@"邀赏";
            break;
        case 2:
            cell.textLabel.text=@"打赏";
            break;

        default:
            break;
    }
    

    return cell;
}

- (CGFloat)tableView:(UITableView *)tabelView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0f;
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
    JZExchangeBillVC* billvc = [[JZExchangeBillVC alloc]initWithNibName:nil bundle:nil];
    JZTakeCreditVC* ybillvc = [[JZTakeCreditVC alloc]initWithNibName:nil bundle:nil];
    JZContributionVC* gbillvc = [[JZContributionVC alloc]initWithNibName:nil bundle:nil];
    switch (indexPath.row) {
        case 2:
            
            [billvc setTitle:@"打赏"];
            [self.navigationController pushViewController:billvc animated:YES];
             break;
        case 1:
            
            [ybillvc setTitle:@"邀赏"];
            [self.navigationController pushViewController:ybillvc animated:YES];
            
            
            break;
            
       case 0:
            
            [gbillvc setTitle:@"战绩"];
            [self.navigationController pushViewController:gbillvc animated:YES];
            
            
            break;

        default:
            break;
    }
    

    
    
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"哈哈"]
    //                                            message:nil
    //                                            delegate:nil
    //                                cancelButtonTitle:@"确定"
    //                                otherButtonTitles:nil, nil];
    //
    //                           [alert show];
    
//    CGDetailViewController* CDDvc = [CGDetailViewController  sharedActivityView];
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





@end
