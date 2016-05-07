/************************************************************
 *  * EaseMob CONFIDENTIAL
 * __________________
 * Copyright (C) 2013-2014 EaseMob Technologies. All rights reserved.
 *
 * NOTICE: All information contained herein is, and remains
 * the property of EaseMob Technologies.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from EaseMob Technologies.
 */

#import "CreateGroupViewController.h"

#import "ContactSelectionViewController.h"
#import "EMTextView.h"
#import "JZgetDownLevel_c.h"
#import "QiaokerenApplication.h"
#import "UtilsAll.h"
#import "JZgetQUserInfo_c.h"
#import "LevelRelationSelectData.h"
#import "UserSeletData.h"
@interface CreateGroupViewController ()<UITextFieldDelegate, UITextViewDelegate, EMChooseViewDelegate ,UIActionSheetDelegate>

@property (strong, nonatomic) UIView *switchView;
@property (strong, nonatomic) UIBarButtonItem *rightItem;
@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) EMTextView *textView;

@property (nonatomic) BOOL isPublic;
@property (strong, nonatomic) UILabel *groupTypeLabel;//群组类型

@property (nonatomic) BOOL isMemberOn;
@property (strong, nonatomic) UILabel *groupMemberTitleLabel;
@property (strong, nonatomic) UISwitch *groupMemberSwitch;
@property (strong, nonatomic) UILabel *groupMemberLabel;

@end

@implementation CreateGroupViewController
NSString *UserLevel;
@synthesize listMembers;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _isPublic = NO;
        _isMemberOn = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    listMembers = [NSMutableArray array];
    UserLevel = @"6";
    UserSeletData *user =[QiaokerenApplication getUserSelectData];
    if(user != nil){
        UserLevel = user.qlevel;
    }
    
    if(UserLevel == nil){
        [self showHint:@"信息错误，请重进系统"];
        //        [self.navigationController popViewControllerAnimated:YES];
    }
    if([UserLevel isEqualToString:@"6"]){
        [self showHint:@"信息错误，请重进系统"];
        //        [self.navigationController popViewControllerAnimated:YES];
    }
    NSLog(@"UserLevel : %@",UserLevel);
    NSLog(@"QiaoLevel : %@",[[QiaokerenApplication getUserSelectData] qlevel]);
    
    // Do any additional setup after loading the view.
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    self.title = NSLocalizedString(@"title.createGroup", @"Create a group");
    self.view.backgroundColor = [UIColor colorWithRed:0.88 green:0.88 blue:0.88 alpha:1.0];
    
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
    addButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [addButton setTitle:NSLocalizedString(@"group.create.addOccupant", @"add members") forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor colorWithRed:32 / 255.0 green:134 / 255.0 blue:158 / 255.0 alpha:1.0] forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [addButton addTarget:self action:@selector(addContacts:) forControlEvents:UIControlEventTouchUpInside];
    _rightItem = [[UIBarButtonItem alloc] initWithCustomView:addButton];
    [self.navigationItem setRightBarButtonItem:_rightItem];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [backButton setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [backButton addTarget:self.navigationController action:@selector(popViewControllerAnimated:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [self.navigationItem setLeftBarButtonItem:backItem];
    
    UIButton *btnAddDaiLi = [[UIButton alloc] initWithFrame:CGRectMake(_groupMemberSwitch.frame.origin.x , 280, 150, 35)];
    
    [btnAddDaiLi setTitle:@"添加代理成员" forState:UIControlStateNormal];
    [btnAddDaiLi addTarget:self action:@selector(selectMembers) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnAddDaiLi];
    
    [self.view addSubview:self.textField];
    [self.view addSubview:self.textView];
    [self.view addSubview:self.switchView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//添加成员对话框
- (void)selectMembers
{
    UIActionSheet *actionSheet;
    actionSheet = [[UIActionSheet alloc] initWithTitle:@"添加代理好友" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"只添加三级",@"添加我的下级",@"只添加总代",@"只添加一级",@"只添加二级",@"添加向下两级",@"添加向下三级", nil];
    
    //三级代理权限
    if([UserLevel isEqualToString:@"1"]){
        [EMAlertView showAlertWithTitle:@"提示"
                                message:@"暂未开放"
                        completionBlock:nil
                      cancelButtonTitle:NSLocalizedString(@"ok", @"OK")
                      otherButtonTitles:nil];
        return;
    }
    //二级代理权限
    else if([UserLevel isEqualToString:@"2"]){
        actionSheet = [[UIActionSheet alloc] initWithTitle:@"添加代理好友" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"只添加三级",@"添加我的下级", nil];
        
        //一级代理权限
    }else if([UserLevel isEqualToString:@"3"]){
        actionSheet = [[UIActionSheet alloc] initWithTitle:@"添加代理好友" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"只添加三级",@"添加我的下级",@"只添加二级",@"添加向下两级", nil];
    }
    //总代理权限
    else if([UserLevel isEqualToString:@"4"]){
        actionSheet = [[UIActionSheet alloc] initWithTitle:@"添加代理好友" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"只添加三级",@"添加我的下级",@"只添加二级",@"添加向下两级",@"只添加一级",@"添加向下三级", nil];
    }
    //公司权限
    else if([UserLevel isEqualToString:@"5"]){
        actionSheet = [[UIActionSheet alloc] initWithTitle:@"添加代理好友" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"只添加三级",@"添加我的下级",@"只添加二级",@"添加向下两级",@"只添加一级",@"添加向下三级",@"只添加总代", nil];
    }
    
    //其他
    else{
        //        actionSheet = [[UIActionSheet alloc] initWithTitle:@"添加代理好友" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"只添加三级",@"添加我的下级",@"只添加二级",@"添加向下两级",@"只添加一级",@"添加向下三级",@"只添加总代", nil];
        
        return;
    }
    
    [actionSheet showInView:self.view];
}

//添加相关的代理到群成员中
-(void)actionSheet:(UIActionSheet*)actionSheet
didDismissWithButtonIndex:(NSInteger)buttonIndex{
    
    if(buttonIndex == [actionSheet cancelButtonIndex]){
        return;
    }
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle initNetworkingDic];
    //添加三级
    if(buttonIndex == 0){
        NSLog(@"您点击两只添加三级");
        [self sendOneLevelUserMsg:@"1"];
        //添加我的下级
    }else if(buttonIndex == 1){
        NSLog(@"您点击两只添加我的下级");
        [self sendDownLevelMsg:@"1"];
        //添加二级
    }else if(buttonIndex == 2){
        NSLog(@"您点击两只添加二级");
        [self sendOneLevelUserMsg:@"2"];
        //添加向下两级
    }else if(buttonIndex == 3){
        NSLog(@"您点击两只添加向下两级");
        [self sendDownLevelMsg:@"2"];
        //添加一级
    }else if(buttonIndex == 4){
        NSLog(@"您点击两只添加一级");
        [self sendOneLevelUserMsg:@"3"];
        //添加向下三级
    }else if(buttonIndex == 5){
        NSLog(@"您点击两只添加向下三级");
        [self sendDownLevelMsg:@"3"];
        //添加总代
    }else if(buttonIndex == 6){
        NSLog(@"您点击两只添加总代");
        [self sendOneLevelUserMsg:@"4"];
    }
    
    [self showHudInView:self.view hint:@"正在获取..."];
    
    
}

-(void)sendDownLevelMsg:(NSString*)downLevel{
    JZgetDownLevel_c *li = [JZgetDownLevel_c Jz_initialize];
    [li initWithInfo:@"JZgetDownLevel_c" Userid:[QiaokerenApplication getAccountNumber] LevelDeep:downLevel RecognisizeNum:@"0" UserLevel:@"0" UploadTime:[UtilsAll getFormatTime]];
    NSDictionary *nsdic = [li toDictionary];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:nsdic time:@"2015" protocol:1823 label:@"JZgetDownLevel_c"];
}

-(void)sendOneLevelUserMsg:(NSString*)level{
    JZgetQUserInfo_c *li = [JZgetQUserInfo_c Jz_initialize];
    [li initWithInfo:@"JZgetQUserInfo_c" UserID:[QiaokerenApplication getAccountNumber] ThisUserID:@"0" UpUserID:@"0" Phone:@"0" WeChatID:@"0" Level:level UploadTime:[UtilsAll getFormatTime] PageSize:@"10000" PageIndex:@"0"];
    NSDictionary *nsdic = [li toDictionary];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:nsdic time:@"2015" protocol:1823 label:@"JZgetQUserInfo_c"];
}


// 处理函数
- (void)dealLabel:(NetUnit*)nUnit{
    [self hideHud];
    NSString* json = nUnit->receiveString;
    NSLog(@"json ----  %@",json);
    if ([nUnit->cLabel isEqualToString:@"JZgetDownLevel_c"]) {
        NSString* json = nUnit->receiveString;
        
        NSDictionary*dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:  NSUTF8StringEncoding ] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0 ];
        
        if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"1"]) {
            
            NSDictionary*dic;
            
            //判断是否能够组成字典
            NSString *str = [dictionary objectForKey:@"UseridList"];
            if(str.length < 20){
                return;
            }
            NSArray* array = [NSJSONSerialization JSONObjectWithData:[[dictionary objectForKey:@"UseridList"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil] ;
            
            
            //先清理原来添加的代理
            [listMembers removeAllObjects];
            for (int i=0; i<[array count]; i++) {
                dic = [array  objectAtIndex:i];
                LevelRelationSelectData *levelRel = [LevelRelationSelectData Jz_initialize];
                [levelRel initWithInfo:@"123"
                              relateid:[dic objectForKey:@"relateid"]
                                userid:[UtilsAll TOString:[dic objectForKey:@"userid"]]
                              neuserid:[UtilsAll TOString:[dic objectForKey:@"neuserid"]]
                             timestamp:[dic objectForKey:@"timestamp"]
                                status:[dic objectForKey:@"status"]];
                //                [data addObject:bill];
                
                //                NSLog(@"neuserid = %@",levelRel.neuserid);
                [listMembers addObject:levelRel.neuserid];
                //NSLog(@"count bill 123 = %d",[data count]);
            }
            //        NSLog(@"%lu",(unsigned long)[data count]);
            
            //            [_tableview reloadData];
            [self showHint:@"已添加"];
            
        }
        //获取失败
        else{
            [EMAlertView showAlertWithTitle:@"提示"
                                    message:@"获取订单失败，请重试"
                            completionBlock:nil
                          cancelButtonTitle:NSLocalizedString(@"ok", @"OK")
                          otherButtonTitles:nil];
        }
        
    }
    
    
    
    if ([nUnit->cLabel isEqualToString:@"JZgetQUserInfo_c"]) {
        
        NSString* json = nUnit->receiveString;
        //                NSLog(@"--------JZgetQUserInfo_c----------%@",json);
        NSDictionary*dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:  NSUTF8StringEncoding ] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0 ];
        
        //判断是否能够组成字典
        NSString *str = [dictionary objectForKey:@"UserSelectDataList"];
        if(str.length < 20){
            return;
        }
        
        NSArray* array = [NSJSONSerialization JSONObjectWithData:[[dictionary objectForKey:@"UserSelectDataList"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil] ;
        
        
        //先清理原来添加的代理
        [listMembers removeAllObjects];
        
        NSDictionary*dic = [[NSJSONSerialization JSONObjectWithData:[[dictionary objectForKey:@"UserSelectDataList"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0];
        if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"1"]) {
            NSString* sex ;
            if ([[dic objectForKey:@"qsex"] isEqualToString:@"1"]) {
                sex=@"男";
            }else{
                sex=@"女";
            }
            UserSeletData* personalInfo = [UserSeletData instance2];
            for (int i=0; i<[array count]; i++) {
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
                //            NSLog(@"Quserid = %@",personalInfo.quserid);
                [listMembers addObject:personalInfo.quserid];
            }
            [self showHint:@"已添加"];
        }else{
            UIAlertView * myAlert = [[UIAlertView alloc]initWithTitle:@"提示:" message:@"获取信息失败，请重试" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [myAlert show];
            
        }
        
    }
}

#pragma mark - getter

- (UITextField *)textField
{
    if (_textField == nil) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 300, 40)];
        _textField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        _textField.layer.borderWidth = 0.5;
        _textField.layer.cornerRadius = 3;
        _textField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 30)];
        _textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _textField.leftViewMode = UITextFieldViewModeAlways;
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.font = [UIFont systemFontOfSize:15.0];
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.placeholder = NSLocalizedString(@"group.create.inputName", @"please enter the group name");
        _textField.returnKeyType = UIReturnKeyDone;
        _textField.delegate = self;
    }
    
    return _textField;
}

- (EMTextView *)textView
{
    if (_textView == nil) {
        _textView = [[EMTextView alloc] initWithFrame:CGRectMake(10, 70, 300, 80)];
        _textView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        _textView.layer.borderWidth = 0.5;
        _textView.layer.cornerRadius = 3;
        _textView.font = [UIFont systemFontOfSize:14.0];
        _textView.backgroundColor = [UIColor whiteColor];
        _textView.placeholder = NSLocalizedString(@"group.create.inputDescribe", @"please enter a group description");
        _textView.returnKeyType = UIReturnKeyDone;
        _textView.delegate = self;
    }
    
    return _textView;
}

- (UIView *)switchView
{
    if (_switchView == nil) {
        _switchView = [[UIView alloc] initWithFrame:CGRectMake(10, 160, 300, 90)];
        _switchView.backgroundColor = [UIColor clearColor];
        
        CGFloat oY = 0;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, oY, 100, 35)];
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont systemFontOfSize:14.0];
        label.numberOfLines = 2;
        label.text = NSLocalizedString(@"group.create.groupPermission", @"group permission");
        [_switchView addSubview:label];
        
        UISwitch *switchControl = [[UISwitch alloc] initWithFrame:CGRectMake(100, oY, 50, _switchView.frame.size.height)];
        [switchControl addTarget:self action:@selector(groupTypeChange:) forControlEvents:UIControlEventValueChanged];
        [_switchView addSubview:switchControl];
        [switchControl setOn:YES animated:NO];
        
        _groupTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(switchControl.frame.origin.x + switchControl.frame.size.width + 5, oY, 100, 35)];
        _groupTypeLabel.backgroundColor = [UIColor clearColor];
        _groupTypeLabel.font = [UIFont systemFontOfSize:12.0];
        _groupTypeLabel.textColor = [UIColor grayColor];
        _groupTypeLabel.text = NSLocalizedString(@"group.create.private", @"private group");
        _groupTypeLabel.numberOfLines = 2;
        [_switchView addSubview:_groupTypeLabel];
        
        oY += (35 + 20);
        _groupMemberTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, oY, 100, 35)];
        _groupMemberTitleLabel.font = [UIFont systemFontOfSize:14.0];
        _groupMemberTitleLabel.backgroundColor = [UIColor clearColor];
        _groupMemberTitleLabel.text = NSLocalizedString(@"group.create.occupantPermissions", @"members invite permissions");
        _groupMemberTitleLabel.numberOfLines = 2;
        [_switchView addSubview:_groupMemberTitleLabel];
        
        _groupMemberSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(100, oY, 50, 35)];
        [_groupMemberSwitch addTarget:self action:@selector(groupMemberChange:) forControlEvents:UIControlEventValueChanged];
        [_switchView addSubview:_groupMemberSwitch];
        
        _groupMemberLabel = [[UILabel alloc] initWithFrame:CGRectMake(_groupMemberSwitch.frame.origin.x + _groupMemberSwitch.frame.size.width + 5, oY, 150, 35)];
        _groupMemberLabel.backgroundColor = [UIColor clearColor];
        _groupMemberLabel.font = [UIFont systemFontOfSize:12.0];
        _groupMemberLabel.textColor = [UIColor grayColor];
        _groupMemberLabel.numberOfLines = 2;
        _groupMemberLabel.text = NSLocalizedString(@"group.create.unallowedOccupantInvite", @"don't allow group members to invite others");
        [_groupMemberSwitch setOn:YES animated:NO];
        [_switchView addSubview:_groupMemberLabel];
    }
    
    return _switchView;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - UITextViewDelegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        
        
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

#pragma mark - EMChooseViewDelegate

- (BOOL)viewController:(EMChooseViewController *)viewController didFinishSelectedSources:(NSArray *)selectedSources
{
    NSInteger maxUsersCount = 200;
    if ([selectedSources count] > (maxUsersCount - 1)) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"group.maxUserCount", nil) message:nil delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"OK") otherButtonTitles:nil, nil];
        [alertView show];
        
        return NO;
    }
    
    [self showHudInView:self.view hint:NSLocalizedString(@"group.create.ongoing", @"create a group...")];
    
    NSMutableArray *source = [NSMutableArray array];
    for (EMBuddy *buddy in selectedSources) {
        [source addObject:buddy.username];
    }
    
    if([listMembers count]>0){
        for (NSString *user in listMembers) {
            [source addObject:user];
        }
    }
    EMGroupStyleSetting *setting = [[EMGroupStyleSetting alloc] init];
    setting.groupMaxUsersCount = maxUsersCount;
    
    if (_isPublic) {
        if(_isMemberOn)
        {
            setting.groupStyle = eGroupStyle_PublicOpenJoin;
        }
        else{
            setting.groupStyle = eGroupStyle_PublicJoinNeedApproval;
        }
    }
    else{
        if(_isMemberOn)
        {
            setting.groupStyle = eGroupStyle_PrivateMemberCanInvite;
        }
        else{
            setting.groupStyle = eGroupStyle_PrivateOnlyOwnerInvite;
        }
    }
    
    __weak CreateGroupViewController *weakSelf = self;
    NSDictionary *loginInfo = [[[EaseMob sharedInstance] chatManager] loginInfo];
    NSString *username = [loginInfo objectForKey:kSDKUsername];
    NSString *messageStr = [NSString stringWithFormat:NSLocalizedString(@"group.somebodyInvite", @"%@ invite you to join groups \'%@\'"), username, self.textField.text];
    [[EaseMob sharedInstance].chatManager asyncCreateGroupWithSubject:self.textField.text description:self.textView.text invitees:source initialWelcomeMessage:messageStr styleSetting:setting completion:^(EMGroup *group, EMError *error) {
        [weakSelf hideHud];
        if (group && !error) {
            [weakSelf showHint:NSLocalizedString(@"group.create.success", @"create group success")];
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }
        else{
            [weakSelf showHint:NSLocalizedString(@"group.create.fail", @"Failed to create a group, please operate again")];
        }
    } onQueue:nil];
    
    return YES;
}

#pragma mark - action

- (void)groupTypeChange:(UISwitch *)control
{
    _isPublic = control.isOn;
    
    [_groupMemberSwitch setOn:NO animated:NO];
    [self groupMemberChange:_groupMemberSwitch];
    
    if (control.isOn) {
        _groupTypeLabel.text = NSLocalizedString(@"group.create.public", @"public group");
    }
    else{
        _groupTypeLabel.text = NSLocalizedString(@"group.create.private", @"private group");
    }
}

- (void)groupMemberChange:(UISwitch *)control
{
    if (_isPublic) {
        _groupMemberTitleLabel.text = NSLocalizedString(@"group.create.occupantJoinPermissions", @"members join permissions");
        if(control.isOn)
        {
            _groupMemberLabel.text = NSLocalizedString(@"group.create.open", @"random join");
        }
        else{
            _groupMemberLabel.text = NSLocalizedString(@"group.create.needApply", @"you need administrator agreed to join the group");
        }
    }
    else{
        _groupMemberTitleLabel.text = NSLocalizedString(@"group.create.occupantPermissions", @"members invite permissions");
        if(control.isOn)
        {
            _groupMemberLabel.text = NSLocalizedString(@"group.create.allowedOccupantInvite", @"allows group members to invite others");
        }
        else{
            _groupMemberLabel.text = NSLocalizedString(@"group.create.unallowedOccupantInvite", @"don't allow group members to invite others");
        }
    }
    
    _isMemberOn = control.isOn;
}

- (void)addContacts:(id)sender
{
    if (self.textField.text.length == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"prompt", @"Prompt") message:NSLocalizedString(@"group.create.inputName", @"please enter the group name") delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"OK") otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }
    
    [self.view endEditing:YES];
    
    ContactSelectionViewController *selectionController = [[ContactSelectionViewController alloc] init];
    selectionController.delegate = self;
    [self.navigationController pushViewController:selectionController animated:YES];
}

@end
