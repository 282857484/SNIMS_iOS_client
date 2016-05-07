//
//  PersonInfoViewController.m
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-7-19.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "PersonInfoViewController.h"
#import "JZDataHandle.h"
#import "JZgetQUserInfo_c.h"
#import "UtilsAll.h"
#import "QiaokerenApplication.h"
#import "UserSeletData.h"
#import "UIImageView+DispatchLoad.h"
#import "JZDataHandle.h"
@interface PersonInfoViewController()<JZDataHandleDelegate>

@end

@implementation PersonInfoViewController{
    NSString *OtherUserId;
    UserSeletData *personalInfo;
}

-(void)setPersonUserId:(NSString*)userid{
    OtherUserId = userid;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self sendPersonDetailInfoMsg];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}



-(void)sendPersonDetailInfoMsg{
    NSString*time = [UtilsAll getFormatTime];
    //[QiaokerenApplication getAccountNumber]
    JZgetQUserInfo_c*getQuserInfo = [JZgetQUserInfo_c Jz_initialize];
    [getQuserInfo
     initWithInfo:@"请求个人信息列表"
     UserID:[QiaokerenApplication getAccountNumber]
     ThisUserID:OtherUserId
     UpUserID:@"0"
     Phone:@"0"
     WeChatID:@"0"
     Level:@"0"
     UploadTime:time
     PageSize:@"100"
     PageIndex:@"0"];
    NSDictionary * dictionary = [getQuserInfo toDictionary];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:dictionary time:time  protocol:1 label:@"JZgetQUserInfo_c"];
    [self showHudInView:self.view hint:@"正在刷新列表..."];
}

-(void)dealLabel:(NetUnit *)nUnit{
    [self hideHud];
    if ([nUnit->cLabel isEqualToString:@"JZgetQUserInfo_c"]) {
        NSString* json = nUnit->receiveString;
//                NSLog(@"JZgetQUserInfo_c------------------%@",json);
        NSDictionary*dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:  NSUTF8StringEncoding ] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0 ];
        
        if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"1"]) {
            
            NSString *str = [dictionary objectForKey:@"UserSelectDataList"];
            if(str.length < 20){
                return;
            }
            
            NSDictionary*dic = [[NSJSONSerialization JSONObjectWithData:[[dictionary objectForKey:@"UserSelectDataList"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0];
            NSString* sex ;
            if ([[dic objectForKey:@"qsex"] isEqualToString:@"1"]) {
                sex=@"男";
            }else{
                sex=@"女";
            }
            personalInfo = [UserSeletData instance2];
            [personalInfo initWithInfo:@"成功了吧"
                               quserid:[[NSString alloc] initWithFormat:@"%@",[dic objectForKey:@"quserid"]]
                             qhigherid:[dic objectForKey:@"qhigherid"]
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
            self.title = [dic objectForKey:@"qusername"];
            [self.tableView reloadData];
        }else{
            UIAlertView * myAlert = [[UIAlertView alloc]initWithTitle:@"提示:" message:@"获取信息列表失败，请检查网络状态" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [myAlert show];
            
        }
        
    }
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    //有几个表单
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{    //表单中有多少项
    // Return the number of rows in the section.
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 3;
            break;
        case 2:
            return 7;
            break;
    }
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //定义一个识别码
    //重复利用缓存池中存在的对象
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //if以内是新造，if以下算是翻新。
    //    if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] ;
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    NSString *realName = [personalInfo qrealname];
    if (realName.length > 1) {
        realName = [realName substringFromIndex:realName.length-1];
        realName = [@"*" stringByAppendingString:realName];
    }
    
    switch ([indexPath section]){
        case 0:
        {
            [cell setAccessoryType:UITableViewCellAccessoryNone];
            NSString *iid = [QiaokerenApplication getAccountNumber];
            NSString *url = [QiaokerenApplication getTouXiangUrlUserID:iid];
            UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 40, 40)];
            [cell.contentView addSubview:imageview];
            imageview.image = [UIImage imageNamed:@"z_logindefault.png"];
            [imageview setImageFromUrl:url
                            completion:^(void) {}];
            
            cell.detailTextLabel.text=[personalInfo quserid];
            return cell;
        }
            //            break;
        case 1:
            [cell setAccessoryType:UITableViewCellAccessoryNone];
            switch ([indexPath row]) {
                case 0:
                    cell.textLabel.text=@"手机号码";
                    cell.detailTextLabel.text=[personalInfo qphone];
                    return cell;
                    break;
                case 1:
                    cell.textLabel.text=@"授权号";
                    cell.detailTextLabel.text=[personalInfo qshouquannum];
                    return cell;
                    break;
                case 2:
                    cell.textLabel.text=@"性别" ;
                    cell.detailTextLabel.text=[personalInfo qsex];
                    return cell;
                    break;
                default:
                    return cell;
                    break;
            }
        case 2:
            switch ([indexPath row]) {
                    
                case 0:
                    cell.textLabel.text = @"昵称";
                    cell.detailTextLabel.text=[personalInfo qusername];
                    return cell;
                    break;
                case 1:
                    cell.textLabel.text=@"真实姓名";
                    cell.detailTextLabel.text = realName;
                    return cell;
                    break;
//                case 2:
//                    cell.textLabel.text = @"身份证";
//                    cell.detailTextLabel.text=[personalInfo qcardid];
//                    return cell;
//                    break;
                case 2:
                    cell.textLabel.text = @"微信号";
                    cell.detailTextLabel.text = [personalInfo qweixin];
                    return cell;
                    break;
                case 3:
                    cell.textLabel.text = @"QQ";
                    cell.detailTextLabel.text = [personalInfo qqq];
                    return cell;
                    break;
                case 4:
                    cell.textLabel.text = @"旺旺号";
                    cell.detailTextLabel.text = [personalInfo qwangwang];
                    return cell;
                    break;
                case 5:
                    cell.textLabel.text = @"邮箱";
                    cell.detailTextLabel.text = [personalInfo qemail];
                    return cell;
                    break;
                case 6:
                    cell.textLabel.text = @"年龄";
                    cell.detailTextLabel.text=[personalInfo qage];
                    return cell;
                    break;
//                case 7:
//                    cell.textLabel.text = @"联系电话";
//                    cell.detailTextLabel.text = [personalInfo qtel];
//                    return cell;
//                    break;
                default:
                    break;
            }
            
            
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tabelView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40.0f;
}



//每个section底部标题高度（实现这个代理方法后前面 sectionHeaderHeight 设定的高度无效）
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

//每个section头部标题高度（实现这个代理方法后前面 sectionFooterHeight 设定的高度无效）
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
