//
//  OrderViewController.m
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-1-19.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "OrderViewController.h"

#import "ApplyViewController.h"
#import "PushNotificationViewController.h"
#import "BlackListViewController.h"
#import "DebugViewController.h"
#import "SettingsViewController.h"
#import "MyUpOrderViewController.h"
#import "MyDownOrderViewController.h"
#import "JZVideosTableViewController.h"
#import "PersonalInformationViewController.h"
#import "JZInviteSelectData.h"
#import "JZInvitationCodeViewController.h"
#import "SendFriendCircle.h"
#import "FMiOSClassViewViewController.h"
#import "CreditGoodViewController.h"
#import "JZCreditsystemVC.h"
#import "FMClessonViewController.h"
#import "QiaokerenApplication.h"
@interface OrderViewController ()

@property (strong, nonatomic) UIView *footerView;

@property (strong, nonatomic) UISwitch *autoLoginSwitch;

@property (strong, nonatomic) UISwitch *beInvitedSwitch;
@property (strong, nonatomic) UILabel *beInvitedLabel;

@end

@implementation OrderViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"订单";
    
    self.view.backgroundColor = [UIColor colorWithRed:0.88 green:0.88 blue:0.88 alpha:1.0];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.tableFooterView = self.footerView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - getter

- (UISwitch *)autoLoginSwitch
{
    if (_autoLoginSwitch == nil) {
        _autoLoginSwitch = [[UISwitch alloc] init];
        [_autoLoginSwitch addTarget:self action:@selector(autoLoginChanged:) forControlEvents:UIControlEventValueChanged];
    }
    
    return _autoLoginSwitch;
}

- (UISwitch *)beInvitedSwitch
{
    //    if (_beInvitedSwitch == nil) {
    //        _beInvitedSwitch = [[UISwitch alloc] init];
    //        [_beInvitedSwitch addTarget:self action:@selector(beInvitedChanged:) forControlEvents:UIControlEventValueChanged];
    //        BOOL autoAccept = [[EaseMob sharedInstance].chatManager autoAcceptGroupInvitation];
    //        [_beInvitedSwitch setOn:!autoAccept animated:YES];
    //    }
    
    return _beInvitedSwitch;
}

- (UILabel *)beInvitedLabel
{
    if (_beInvitedLabel == nil) {
        _beInvitedLabel = [[UILabel alloc] init];
        _beInvitedLabel.backgroundColor = [UIColor clearColor];
        _beInvitedLabel.font = [UIFont systemFontOfSize:12.0];
        _beInvitedLabel.textColor = [UIColor grayColor];
    }
    
    return _beInvitedLabel;
}

#pragma mark - Table view datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0)
        {
            if ([QiaokerenApplication getAccountType]== 0) {
                cell.textLabel.text = @"职能";
                NSLog(@"right");
            }else{
                cell.textLabel.text = @"上级订单";
                NSLog(@"error");
            }
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 1){
            if ([QiaokerenApplication getAccountType]== 0) {
                cell.textLabel.text = @"数据统计";
                NSLog(@"right");
            }else{
                cell.textLabel.text = @"下级订单";
                NSLog(@"error");
            }
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 2){
            cell.textLabel.text = @"视频教程";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 3){
            cell.textLabel.text = @"编辑朋友圈";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 4){
            cell.textLabel.text = @"个人资料";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 15){
//            cell.textLabel.text = @"邀请好友";
//            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 5){
            cell.textLabel.text = @"邀请码";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 6){
            cell.textLabel.text = @"设置";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 7){
            cell.textLabel.text = @"音频课程";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 8){
            cell.textLabel.text = @"积分商品";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 9){
            cell.textLabel.text = @"我的积分";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 10){
            
        }
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.row == 0){
        if ([QiaokerenApplication getAccountType]== 0) {
            [self showHint:@"您好，您的职能为空"];
        }else{
            MyUpOrderViewController *upOrderController = [[MyUpOrderViewController alloc] init];
            [self.navigationController pushViewController:upOrderController animated:YES];
        }
    }else if (indexPath.row == 1){
        if ([QiaokerenApplication getAccountType]== 0) {
            [self showHint:@"您好，您的使用数据还未产生"];
        }else{
            MyDownOrderViewController *downOrderController = [[MyDownOrderViewController alloc] init];
            [self.navigationController pushViewController:downOrderController animated:YES];
        }
        
    }else if (indexPath.row == 2){
        JZVideosTableViewController *videosTableViewController = [[JZVideosTableViewController alloc] initWithNibName:@"JZVideosTableViewController" bundle:[NSBundle mainBundle]];
        [self.navigationController pushViewController:videosTableViewController animated:YES];
    }else if (indexPath.row == 3){
        SendFriendCircle *friendCircle = [[SendFriendCircle alloc] init];
        [self.navigationController pushViewController:friendCircle animated:YES];
    }else if (indexPath.row == 4){
        PersonalInformationViewController* ViewController =[PersonalInformationViewController instance1];
        [ViewController setTitle:@"个人资料"];
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        //并将视图控制器添加到根视图控制器中 并显示出来
        [self.navigationController pushViewController:ViewController animated:YES];
    }else if (indexPath.row == 5){
        JZInvitationCodeViewController* viewController = [[JZInvitationCodeViewController alloc] initWithNibName:@"JZInvitationCodeViewController" bundle:[NSBundle mainBundle]];
        [viewController setTitle:@"邀请码"];
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        //并将视图控制器添加到根视图控制器中 并显示出来
        [self.navigationController pushViewController:viewController animated:YES];
    }else if (indexPath.row == 6){
        SettingsViewController *settingController = [[SettingsViewController alloc] initWithStyle:UITableViewStylePlain];
        [self.navigationController pushViewController:settingController animated:YES];
    }else if(indexPath.row == 7){
        FMClessonViewController *viewController = [[FMClessonViewController alloc] init];
        [viewController setTitle:@"音频课程"];
        [self.navigationController pushViewController:viewController animated:YES];
    }else if (indexPath.row == 8){
        CreditGoodViewController *CGController = [[CreditGoodViewController alloc] init];
        [CGController setTitle:@"积分商品"];
        [self.navigationController pushViewController:CGController animated:YES];
        
    }else if (indexPath.row == 9){
        JZCreditsystemVC *CSController = [[JZCreditsystemVC alloc] init];
        [CSController setTitle:@"我的积分"];
        [self.navigationController pushViewController:CSController animated:YES];
    }
}

#pragma mark - getter

- (UIView *)footerView
{
    if (_footerView == nil) {
        _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 80)];
        _footerView.backgroundColor = [UIColor clearColor];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(10, 0, _footerView.frame.size.width - 10, 0.5)];
        line.backgroundColor = [UIColor lightGrayColor];
        [_footerView addSubview:line];
        
        
    }
    
    return _footerView;
}

#pragma mark - action

- (void)autoLoginChanged:(UISwitch *)autoSwitch
{
    [[EaseMob sharedInstance].chatManager setIsAutoLoginEnabled:autoSwitch.isOn];
}

- (void)beInvitedChanged:(UISwitch *)beInvitedSwitch
{
    //    if (beInvitedSwitch.isOn) {
    //        self.beInvitedLabel.text = @"允许选择";
    //    }
    //    else{
    //        self.beInvitedLabel.text = @"自动加入";
    //    }
    //
    //    [[EaseMob sharedInstance].chatManager setAutoAcceptGroupInvitation:!(beInvitedSwitch.isOn)];
}


- (void)refreshConfig
{
    [self.autoLoginSwitch setOn:[[EaseMob sharedInstance].chatManager isAutoLoginEnabled] animated:YES];
    
    [self.tableView reloadData];
}

@end
