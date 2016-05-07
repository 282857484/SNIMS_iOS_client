//
//  JZVideosTableViewController.m
//  Text01
//
//  Created by 杨珺舟 on 15-1-29.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZVideosTableViewController.h"
#import "JZVideosTableViewCell.h"
#import "VedioSelectData.h"
#import "JZMoviePlayerViewController.h"
#import "JZgetVedioList_c.h"
#import "JZgetVedioList_s.h"
#import "UtilsAll.h"
#import "QiaokerenApplication.h"

@interface JZVideosTableViewController ()

@end

@implementation JZVideosTableViewController
@synthesize tabcell,cellNib,data;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"视频教程";
    // Do any additional setup after loading the view from its nib.
    self.cellNib = [UINib nibWithNibName:@"JZVideosTableViewCell" bundle:nil];
//    [self initNetworkingDic];
    JZgetVedioList_c* video = [JZgetVedioList_c Jz_initialize];
    [video initWithInfo:@"请求videolist"
                 UserID:[QiaokerenApplication getAccountNumber]
              UserLevel:@"5"
             UploadTime:[UtilsAll getFormatTime]
               PageSize:@"100"
              PageIndex:@"0"];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:[video toDictionary] time:[UtilsAll getFormatTime] protocol:1 label:@"JZVideosTableViewController"];
    [self showHudInView:self.view hint:@"正在刷新列表..."];
    
}

-(void)dealLabel:(NetUnit *)nUnit{
    [self hideHud];
    if ([nUnit->cLabel isEqualToString:@"JZVideosTableViewController"]) {
        NSString* json = nUnit->receiveString;
//                NSLog(@"------------------%@",json);
        
        NSDictionary*dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:  NSUTF8StringEncoding ] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0 ];
        
        if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"1"]) {
            //int i = [dictionary count];
            NSString *str = [dictionary objectForKey:@"VedioList"];
            if(str.length < 20){
                return;
            }

            NSDictionary*dic;
            NSArray* array = [NSJSONSerialization JSONObjectWithData:[[dictionary objectForKey:@"VedioList"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil] ;
//            NSLog(@"%lu",(unsigned long)[array count]);
            for (int i=0; i<[array count]; i++) {
                dic = [array  objectAtIndex:i];
                VedioSelectData* videodata = [VedioSelectData Jz_initialize];
                [videodata initWithInfo:@"视屏数据"
                                vedioid:[[NSString alloc] initWithFormat:@"%@",[dic objectForKey:@"vedioid"]]
                             vediolevel:[dic objectForKey:@"vediolevel"]
                              vediotype:[dic objectForKey:@"vediotype"]
                             vediointro:[dic objectForKey:@"vediointro"]
                          vedioresource:[dic objectForKey:@"vedioresource"]];
                [data addObject:videodata];
            }
//        NSLog(@"%lu",(unsigned long)[data count]);
          
        [self.tableView reloadData];
        }else{
            UIAlertView * myAlert = [[UIAlertView alloc]initWithTitle:@"提示:" message:@"获取信息列表失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [myAlert show];
        
        
        
        }
    }
    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    data = [NSMutableArray array];
    return self;
    
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

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
    
    return  data.count;
    }

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"myCell";
    JZVideosTableViewCell *cell = (JZVideosTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        [self.cellNib instantiateWithOwner:self options:nil];
        cell=tabcell;
    }
    [cell setvideos:data[indexPath.row]];
    VedioSelectData* a = data[indexPath.row];
    NSLog(@"%@",[a vediointro]);
    return cell;
}

- (CGFloat)tableView:(UITableView *)tabelView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0f;
}



//每个section底部标题高度（实现这个代理方法后前面 sectionHeaderHeight 设定的高度无效）
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

//每个section头部标题高度（实现这个代理方法后前面 sectionFooterHeight 设定的高度无效）
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
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
//sudo malloc_history 50127 0x6d564f0
// [PersonalInformationViewController tableView:didSelectRowAtIndexPath:]
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"%@",@"这里面执行了么  setSellected");
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    JZMoviePlayerViewController* mpMoviePlayerViewController =[[JZMoviePlayerViewController alloc]init];
    NSLog(@"###############%@",[[data objectAtIndex:(indexPath.row)] vedioresource ]);
     NSLog(@"##############%ld",(long)indexPath.row);
    mpMoviePlayerViewController.movieURL = [NSURL URLWithString:[[data objectAtIndex:(indexPath.row)] vedioresource]];
    
   
    [mpMoviePlayerViewController readyPlayer];
    //设置返回键显示出来（就是视屏播放器那个界面有titlebar上有返回键
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    //并将视图控制器添加到根视图控制器中 并显示出来
    [self.navigationController pushViewController:mpMoviePlayerViewController animated:YES];
    
    
    
    
}


@end
