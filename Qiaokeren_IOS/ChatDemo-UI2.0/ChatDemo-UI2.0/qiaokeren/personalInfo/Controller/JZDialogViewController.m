//
//  JZDialogViewController.m
//  Text01
//
//  Created by 杨珺舟 on 15-1-21.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZDialogViewController.h"
#import "PersonalInformationViewController.h"
#import "UserSeletData.h"
#import "JZChangeUserInfo_c.h"
#import "UtilsAll.h"
#import "QiaokerenApplication.h"
@interface JZDialogViewController ()<UITextFieldDelegate,UIAlertViewDelegate>
@end
static id instance = nil;
@implementation JZDialogViewController
PersonalInformationViewController* ViewController;
UserSeletData* personalInfo;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
   

    return self;
    
}

+(id)instance
{
    if (!instance) {
        instance = [[JZDialogViewController alloc] initWithNibName:@"JZDialogViewController" bundle:[NSBundle mainBundle]];
        return instance;
    }
    return instance;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     JZDialogViewController* ViewController = [JZDialogViewController instance];
     ViewController.textView.delegate=self;
    
    
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    self.diaologView.layer.cornerRadius=10;
    self.diaologView.layer.masksToBounds = YES;
    self.leftButton.layer.cornerRadius=10;
    self.leftButton.layer.masksToBounds = YES;
    self.rightButton.layer.cornerRadius=10;
    self.rightButton.layer.masksToBounds = YES;
   
    NSLog(@"%@",self.textView.text);
    NSLog(@"%@",@"viewDidLoad执行了") ;
    }

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    NSString* a = [PersonalInformationViewController titleLablecontents];
    NSString* b = [PersonalInformationViewController detailTextLabelcontents];
    self.titleLabel.text= a;
    self.textView.text = b;
//    [self.textView becomeFirstResponder];
    NSLog(@"%@",@"viewWillAppear执行了") ;
    //当该控制器控制的视图将要显示出来的时候调用。
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    NSLog(@"%@",@"viewDidAppear执行了") ;

    //当该视图控制器控制的视图已经显示出来以后调用该方法
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    NSLog(@"%@",@"viewWillDisappear执行了") ;
    //当视图管理器管理的视图要被隐藏或被移出窗口时调用该方法
}

-(void)viewWDidisappear:(BOOL)animated{
    [super viewDidDisappear:YES];
    NSLog(@"%@",@"viewWDidisappear执行了") ;
    //当视图管理器管理的视图被隐藏或被移出窗口时调用该方法
    
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

- (IBAction)doneButton:(id)sender {
//   [self initNetworkingDic];
   [ self.textView resignFirstResponder];
    NSString*time = [UtilsAll getFormatTime];
    JZChangeUserInfo_c* changeUserInfo = [JZChangeUserInfo_c Jz_initialize];
    ViewController =[PersonalInformationViewController instance1];
    personalInfo = [UserSeletData instance2];
    long b =[PersonalInformationViewController countContents];
    NSString* n= self.textView.text;
    NSDictionary*dictionary;
    NSString* objectid = [QiaokerenApplication getAccountNumber];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    switch (b) {
        case 0:
            [personalInfo setQusername:n];
            [changeUserInfo initWithInfo:nil UserID:objectid UploadTime:time qphone:@"0" qpassword:@"0" qcardid:@"0" qusername:n  qrealname:@"0" qtel:@"0" qemail:@"0" qsex:@"0" qage:@"0" qshouquannum:@"0" qweixin:@"0" qqq:@"0" qwangwang:@"0" qtaobao:@"0" qtaobaourl:@"0" qstate:@"0" qlevel:@"0" qvideoaccessllevel:@"0" qhonestlevel:@"0" qreceivemsg:@"0"];
            dictionary = [changeUserInfo toDictionary];
            [jzDataHandle sendObject:dictionary time:time protocol:rand() label:@"JZDialogViewController"];
            break;
        case 1:
            [personalInfo setQrealname:n];
            [changeUserInfo initWithInfo:nil UserID:objectid UploadTime:time qphone:@"0" qpassword:@"0" qcardid:@"0" qusername:@"0"  qrealname:n  qtel:@"0" qemail:@"0" qsex:@"0" qage:@"0" qshouquannum:@"0" qweixin:@"0" qqq:@"0" qwangwang:@"0" qtaobao:@"0" qtaobaourl:@"0" qstate:@"0" qlevel:@"0" qvideoaccessllevel:@"0" qhonestlevel:@"0" qreceivemsg:@"0"];
            dictionary = [changeUserInfo toDictionary];
            [jzDataHandle sendObject:dictionary time:time protocol:rand() label:@"JZDialogViewController"];
           
            break;
        case 2:
            [personalInfo setQcardid:n];
            [changeUserInfo initWithInfo:nil UserID:objectid UploadTime:time qphone:@"0" qpassword:@"0" qcardid:n qusername:@"0"  qrealname:@"0" qtel:@"0" qemail:@"0" qsex:@"0" qage:@"0" qshouquannum:@"0" qweixin:@"0" qqq:@"0" qwangwang:@"0" qtaobao:@"0" qtaobaourl:@"0" qstate:@"0" qlevel:@"0" qvideoaccessllevel:@"0" qhonestlevel:@"0" qreceivemsg:@"0"];
            dictionary = [changeUserInfo toDictionary];
            [jzDataHandle sendObject:dictionary time:time protocol:rand() label:@"JZDialogViewController"];
            break;
        case 3:
            [personalInfo setQweixin:n];
            [changeUserInfo initWithInfo:nil UserID:objectid UploadTime:time qphone:@"0" qpassword:@"0" qcardid:@"0" qusername:@"0"  qrealname:@"0" qtel:@"0" qemail:@"0" qsex:@"0" qage:@"0" qshouquannum:@"0" qweixin:n qqq:@"0" qwangwang:@"0" qtaobao:@"0" qtaobaourl:@"0" qstate:@"0" qlevel:@"0" qvideoaccessllevel:@"0" qhonestlevel:@"0" qreceivemsg:@"0"];
            dictionary = [changeUserInfo toDictionary];
            [jzDataHandle sendObject:dictionary time:time protocol:rand() label:@"JZDialogViewController"];
            break;
        case 4:
            [personalInfo setQqq:n];
            [changeUserInfo initWithInfo:nil UserID:objectid UploadTime:time qphone:@"0" qpassword:@"0" qcardid:@"0" qusername:@"0"  qrealname:@"0" qtel:@"0" qemail:@"0" qsex:@"0" qage:@"0" qshouquannum:@"0" qweixin:@"0" qqq:n qwangwang:@"0" qtaobao:@"0" qtaobaourl:@"0" qstate:@"0" qlevel:@"0" qvideoaccessllevel:@"0" qhonestlevel:@"0" qreceivemsg:@"0"];
            dictionary = [changeUserInfo toDictionary];
            [jzDataHandle sendObject:dictionary time:time protocol:rand() label:@"JZDialogViewController"];
            
            break;
        case 5:
            [personalInfo setQwangwang:n];
            [changeUserInfo initWithInfo:nil UserID:objectid UploadTime:time qphone:@"0" qpassword:@"0" qcardid:@"0" qusername:@"0"  qrealname:@"0" qtel:@"0" qemail:@"0" qsex:@"0" qage:@"0" qshouquannum:@"0" qweixin:@"0" qqq:@"0" qwangwang:n qtaobao:@"0" qtaobaourl:@"0" qstate:@"0" qlevel:@"0" qvideoaccessllevel:@"0" qhonestlevel:@"0" qreceivemsg:@"0"];
            dictionary = [changeUserInfo toDictionary];
            [jzDataHandle sendObject:dictionary time:time protocol:rand() label:@"JZDialogViewController"];
            
            break;
        case 6:
            [personalInfo setQemail:n];
            [changeUserInfo initWithInfo:nil UserID:objectid UploadTime:time qphone:@"0" qpassword:@"0" qcardid:@"0" qusername:@"0"  qrealname:@"0" qtel:@"0" qemail:n qsex:@"0" qage:@"0" qshouquannum:@"0" qweixin:@"0" qqq:@"0" qwangwang:@"0" qtaobao:@"0" qtaobaourl:@"0" qstate:@"0" qlevel:@"0" qvideoaccessllevel:@"0" qhonestlevel:@"0" qreceivemsg:@"0"];
            dictionary = [changeUserInfo toDictionary];
            [jzDataHandle sendObject:dictionary time:time protocol:rand() label:@"JZDialogViewController"];
            
            break;
        case 7:
            [personalInfo setQage:n];
            [changeUserInfo initWithInfo:nil UserID:objectid UploadTime:time qphone:@"0" qpassword:@"0" qcardid:@"0" qusername:@"0"  qrealname:@"0" qtel:@"0" qemail:@"0" qsex:@"0" qage:n qshouquannum:@"0" qweixin:@"0" qqq:@"0" qwangwang:@"0" qtaobao:@"0" qtaobaourl:@"0" qstate:@"0" qlevel:@"0" qvideoaccessllevel:@"0" qhonestlevel:@"0" qreceivemsg:@"0"];
            dictionary = [changeUserInfo toDictionary];
            [jzDataHandle sendObject:dictionary time:time protocol:rand() label:@"JZDialogViewController"];
            
            break;
        case 8:
            [personalInfo setQtel:n];
            [changeUserInfo initWithInfo:nil UserID:objectid UploadTime:time qphone:@"0" qpassword:@"0" qcardid:@"0" qusername:@"0"  qrealname:@"0" qtel:n qemail:@"0" qsex:@"0" qage:@"0" qshouquannum:@"0" qweixin:@"0" qqq:@"0" qwangwang:@"0" qtaobao:@"0" qtaobaourl:@"0" qstate:@"0" qlevel:@"0" qvideoaccessllevel:@"0" qhonestlevel:@"0" qreceivemsg:@"0"];
            dictionary = [changeUserInfo toDictionary];
            [jzDataHandle sendObject:dictionary time:time protocol:rand() label:@"JZDialogViewController"];
            
            break;
        default:
            break;
    }
    [ViewController.tableView reloadData];
    [self.view removeFromSuperview];
    }

- (IBAction)backButton:(id)sender {
    [ self.textView resignFirstResponder];
//    PersonalInformationViewController* ViewController =[PersonalInformationViewController instance1];
    [self.view removeFromSuperview];
    
    //JZDialogViewController* ViewController = [JZDialogViewController instance];
    
}

#pragma mark - UITextField Delegate Method
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"%@",@"执行了隐藏键盘");
    [textField resignFirstResponder];
    return YES;
    
}
-(void)dealLabel:(NetUnit *)nUnit{
    if ([nUnit->cLabel  isEqualToString:@"JZDialogViewController"]) {
        NSString* json = nUnit->receiveString;
//        NSLog(@"***************%@",json);
        
//[{"p":5017,"UserID":"22","UploadTime":"201501291052019","Mark":"1","Content":"SUCCESSFUL"}]
//        NSData* data = [json dataUsingEncoding:  NSUTF8StringEncoding ];
//        NSArray* array = [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:  NSUTF8StringEncoding ] options:NSJSONReadingMutableContainers error:nil];
         NSDictionary*dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:  NSUTF8StringEncoding ] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0 ];
        if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"1"]) {
            UIAlertView * myAlert = [[UIAlertView alloc]initWithTitle:@"提示:" message:@"信息上传成功！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [myAlert show];
        }else{
            UIAlertView * myAlert = [[UIAlertView alloc]initWithTitle:@"提示:" message:@"信息上传失败，请检查网络状态" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [myAlert show];
        
        }
        
    }
    


}

-(void)dealloc
{
    //self.textView.delegate=nil;
}
@end
