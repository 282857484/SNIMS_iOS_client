//
//  FMClessonViewController.m
//  ChatDemo-UI2.0
//
//  Created by apple on 15/7/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "FMClessonViewController.h"
#import "getLesson_C.h"
#import "QiaokerenApplication.h"
#import "UtilsAll.h"
#import "LessInfoSelectData.h"
#import "UIImageView+DispatchLoad.h"
#import "FMCContentViewController.h"
@interface FMClessonViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


@implementation FMClessonViewController
@synthesize tvcell;
@synthesize lessondata;
- (void)viewDidLoad {
    [super viewDidLoad];
    lessondata = [NSMutableArray array];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 这里设置发送请求
    // 菊花旋转起来
    [self showHudInView:self.view hint:@"正在加载..."];
    [self sendGetLesson_CMsg];
}

-(void)sendGetLesson_CMsg{
    getLesson_C * gc = [getLesson_C instance2];
    [gc initWithInfo:@"getLesson_C"
                   p:@"0"
              UserID:[[QiaokerenApplication getUserSelectData] quserid]
          UploadTime:[UtilsAll getFormatTime444]
             classid:@"0"
              userid:@"0"
           timestamp:@"0"
            username:@"0"
           userlevel:[[QiaokerenApplication getUserSelectData] quserid]
          classlevel:[[QiaokerenApplication getUserSelectData] quserid]
               place:[UtilsAll getLocation]
           introduce:@"0"
               topic:@"0"
                type:@"0"
                suit:@"0"
            PageSize:@"100"
           PageIndex:@"0"];
    NSDictionary * nsdic = [gc toDictionary];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:nsdic time:@"2015" protocol:123 label:@"getLesson_C"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark-
#pragma mark Table Data Source Methods
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.lessondata count];
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CustomCellIdentifier = @"CustomLessonCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier];
    if(cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"FMClessonCell" owner:self options:nil];
        if([nib count]>0)
        {
            cell = self.tvcell;
        }
        else{
            NSLog(@"fail load nib");
        }
    }
    UIImageView * touxiang = (UIImageView*)[cell viewWithTag:1];
    UILabel * topic = (UILabel*)[cell viewWithTag:2];
    UILabel * username = (UILabel*)[cell viewWithTag:3];
    UILabel * time = (UILabel*)[cell viewWithTag:4];
    UILabel * suit = (UILabel*)[cell viewWithTag:5];
    UILabel * type = (UILabel*)[cell viewWithTag:6];
    UILabel * introduce = (UILabel*)[cell viewWithTag:7];
    UILabel * place = (UILabel*)[cell viewWithTag:8];
    LessInfoSelectData *lisd = [lessondata objectAtIndex:indexPath.row];
    
    NSString *url = [QiaokerenApplication getTouXiangUrlUserID:[lisd userid]];
    touxiang.image = [UIImage imageNamed:@"z_logindefault.png"];
    [touxiang setImageFromUrl:url
                   completion:^(void) {}];
    topic.text = lisd.topic;;
    username.text = lisd.username;
    time.text = [lisd timestamp];
    suit.text = [lisd suit];
    type.text = [lisd type];
    introduce.font = [UIFont systemFontOfSize:12.0];
    introduce.numberOfLines = 0;
    introduce.backgroundColor = [UIColor clearColor];
    CGSize introduceTextSize = [[lisd introduce] sizeWithFont:[UIFont systemFontOfSize:12.0] constrainedToSize:CGSizeMake(200.0f, 200.0f) lineBreakMode:NSLineBreakByWordWrapping];
    CGRect introduceRect = introduce.frame;
    introduceRect.size = introduceTextSize;
    introduce.frame =introduceRect;
    introduce.text = [lisd introduce];
    place.text = [lisd place];
    
    //    NSLog(@"&&&&&&&&&&[lisd username]:%@",[lisd username]);
    //    NSLog(@"&&&&&&&&&&indexPath.row:%ld",(long)indexPath.row);
    //    NSLog(@"&&&&&&&&&&data.count:%lu",(unsigned long)lessondata.count);
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([QiaokerenApplication getAccountType] != 0)
    {
        FMCContentViewController * viewController = [[FMCContentViewController alloc]init];
        [viewController setClassInfo:[lessondata objectAtIndex:indexPath.row]];
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

/***********************************************************************/

// 处理函数
- (void)dealLabel:(NetUnit*)nUnit{
    if ([nUnit->cLabel isEqualToString:@"getLesson_C"]) {
        NSString * json = nUnit->receiveString;
        
        NSDictionary * dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0];
        if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"1"]) {
            NSDictionary * dic;
            NSString * str = [dictionary objectForKey:@"LessonInfoSelectDataList"];
            if (str.length < 20) {
                [self showHint:@"没有获取到相关数据"];
                return;
            }
            NSArray * arrayInfo = [NSJSONSerialization JSONObjectWithData:[[dictionary objectForKey:@"LessonInfoSelectDataList"] dataUsingEncoding:NSUTF8StringEncoding]
                                                                  options:NSJSONReadingMutableContainers error:nil];
            [lessondata removeAllObjects];
            NSMutableArray *temp = [NSMutableArray array];
            for (int i = 0; i < [arrayInfo count]; i++) {
                dic = [arrayInfo objectAtIndex:i];
                LessInfoSelectData * lessonInfo = [LessInfoSelectData instance2];
                [lessonInfo initWithInfo:@"LessInfoSelectData"
                                 classid:[UtilsAll TOString:[dic objectForKey:@"classid"]]
                                  userid:[UtilsAll TOString:[dic objectForKey:@"userid"]]
                               timestamp:[dic objectForKey:@"timestamp"]
                                username:[dic objectForKey:@"username"]
                               userlevel:[dic objectForKey:@"userlevel"]
                              classlevel:[dic objectForKey:@"classlevel"]
                                   place:[dic objectForKey:@"place"]
                               introduce:[dic objectForKey:@"introduce"]
                                   topic:[dic objectForKey:@"topic"]
                                    type:[dic objectForKey:@"type"]
                                    suit:[dic objectForKey:@"suit"]];
                //                NSLog(@"接收到dic-username:%@",[dic objectForKey:@"username"]);
                //                NSLog(@"接收到lessonInfo-username:%@",[lessonInfo username]);
                temp[i]=lessonInfo;
            }
            for (int i = 0; i < [arrayInfo count]; i++) {
                lessondata[i] = temp[[arrayInfo count] - i - 1];
            }
            [_tableView reloadData];
            
        }
    }
    [self hideHud];
}

@end
