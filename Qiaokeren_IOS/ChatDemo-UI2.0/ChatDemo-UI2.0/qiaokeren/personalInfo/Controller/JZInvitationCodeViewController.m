//
//  JZInvitationCodeViewController.m
//  Text01
//
//  Created by apple on 15-1-25.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZInvitationCodeViewController.h"
#import "JZInviteSelectData.h"
#import "JZInvitationCodeViewCellTableViewCell.h"
#import "UtilsAll.h"
#import "QiaokerenApplication.h"
#import "JZgetInviteNum_s.h"
#import "JZgetInviteNum_c.h"
#import "JZInviteSelectData.h"
@interface JZInvitationCodeViewController ()

@end


@implementation JZInvitationCodeViewController
@synthesize tabcell,cellNib,data;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    data = [NSMutableArray array];
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
     self.cellNib = [UINib nibWithNibName:@"JZInvitationCodeViewCellTableViewCell" bundle:nil];
//    [self initNetworkingDic];
    JZgetInviteNum_c* inviteNum = [JZgetInviteNum_c Jz_initialize];
    [inviteNum initWithInfo:@"请求邀请码"
                     UserID:[QiaokerenApplication getAccountNumber]
                 UploadTime:[UtilsAll getFormatTime]
                   PageSize:@"100"
                  PageIndex:@"0"
                    NewMark:@"0"];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:[inviteNum toDictionary] time:[UtilsAll getFormatTime] protocol:1 label:@"JZInvitationCodeViewController"];
    [self showHudInView:self.view hint:@"正在刷新列表..."];

   
}
-(void)dealLabel:(NetUnit *)nUnit{
    [self hideHud];
    if ([nUnit->cLabel isEqualToString:@"JZInvitationCodeViewController"]) {
        NSString* json = nUnit->receiveString;
//        NSLog(@"------------------%@",json);
         NSDictionary*dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:  NSUTF8StringEncoding ] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0 ];
        if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"1"]) {
            NSString *str = [dictionary objectForKey:@"InviteNumList"];
            if(str.length < 20){
                return;
            }
            NSDictionary*dic;
            NSArray* array = [NSJSONSerialization JSONObjectWithData:[[dictionary objectForKey:@"InviteNumList"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil] ;
            int count = 0;
            for (int i=0; i<[array count]; i++) {
                                dic = [array  objectAtIndex:i];
                if ([[dic objectForKey:@"qusestate"]isEqualToString:@"1"]) {
                    count++;
                }
                JZInviteSelectData* selectdata = [JZInviteSelectData Jz_initialize];
                [selectdata initWithInfo:@"邀请码数据"
                               qinviteid:[[NSString alloc] initWithFormat:@"%@",[dic objectForKey:@"qinviteid"]]
                                 qinvite:[[NSString alloc] initWithFormat:@"%@",[dic objectForKey:@"qinvite"]]
                            qbeinvitedid:[[NSString alloc] initWithFormat:@"%@",[dic objectForKey:@"qbeinvitedid"]]
                              qinvitenum:[[NSString alloc] initWithFormat:@"%@",[dic objectForKey:@"qinvitenum"]]
                               qusestate:[dic objectForKey:@"qusestate"]];

                [data addObject:selectdata];
                
            }
            NSLog(@"%lu",(unsigned long)[array count]);
            NSLog(@"%d",count);
            if (([array count]-count)<=2) {
                
//                [self initNetworkingDic];
                JZgetInviteNum_c* inviteNum = [JZgetInviteNum_c Jz_initialize];
                [inviteNum initWithInfo:@"请求邀请码"
                                 UserID:[QiaokerenApplication getAccountNumber]
                             UploadTime:[UtilsAll getFormatTime]
                               PageSize:@"1000"
                              PageIndex:@"0"
                                NewMark:@"1"];
                JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
                jzDataHandle.JZDatadelegate = self;
                [jzDataHandle sendObject:[inviteNum toDictionary] time:[UtilsAll getFormatTime] protocol:1 label:@"JZInvitationCodeViewController"];
                
                
            }
        [self.tableView reloadData];
        }else{
            UIAlertView * myAlert = [[UIAlertView alloc]initWithTitle:@"提示:" message:@"获取信息列表失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [myAlert show];
            
            
            
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
//    NSLog(@"%lu",(unsigned long)data.count);
   return  data.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    static NSString *CellIdentifier = @"mycell";
    JZInvitationCodeViewCellTableViewCell *cell = (JZInvitationCodeViewCellTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        [self.cellNib instantiateWithOwner:self options:nil];
        cell=tabcell;
    }
    [cell setInseInfo:data[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tabelView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0f;
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
    
    long shareIndexRow = indexPath.row;
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    JZInviteSelectData *ss = data[shareIndexRow];
            pasteboard.string = ss.qinvitenum;
    
    UIAlertView *alert = [[UIAlertView alloc]
                             initWithTitle:@"复制邀请码到剪贴板"
                             message:nil
                             delegate:nil
                             cancelButtonTitle:@"确定"
                             otherButtonTitles:nil];
                                  
   [alert show];
//    UIActionSheet *actionSheet = [[UIActionSheet alloc]
//                                  initWithTitle:@"复制邀请码到剪贴板"
//                                  delegate:self
//                                  cancelButtonTitle:@"取消" destructiveButtonTitle:@"复制" otherButtonTitles: nil];
//    [actionSheet showInView:self.view];
    
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
