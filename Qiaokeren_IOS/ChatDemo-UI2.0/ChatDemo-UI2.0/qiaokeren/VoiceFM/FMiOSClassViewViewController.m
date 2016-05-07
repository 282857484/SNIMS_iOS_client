//
//  FMiOSClassViewViewController.m
//  ChatDemo-UI2.0
//
//  Created by apple on 15/7/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "FMiOSClassViewViewController.h"
#import "LessInfoSelectData.h"
#import "FMClassIntroduceCellTableViewCell.h"
#import "JZDataHandle.h"
#import "getLesson_C.h"
#import "QiaokerenApplication.h"
#import "UtilsAll.h"
#import "FMiOSLessonContentView.h"

@interface FMiOSClassViewViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate,JZDataHandleDelegate>{
    
    UITableView * _tableView;
    NSMutableArray * _data;
    NSMutableArray * _cellList;
    BOOL _tableIsExistInView;
}

@end

@implementation FMiOSClassViewViewController

static NSString * identifier = @"LessonCell";

- (void)viewDidLoad {
    
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _data = [[NSMutableArray alloc] init];
    _cellList = [[NSMutableArray alloc] init];
    _tableIsExistInView = false;
    
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
            PageSize:@"1000"
           PageIndex:@"0"];
    NSDictionary * nsdic = [gc toDictionary];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:nsdic time:@"2015" protocol:123 label:@"getLesson_C"];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 跳转至课程详情
    LessInfoSelectData * lessonInfo = [_data objectAtIndex:[indexPath row]];
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    FMiOSLessonContentView * fmLessonContentViewController = [[FMiOSLessonContentView alloc] init];
    [fmLessonContentViewController sendClassBaseInfo:lessonInfo];
    [self.navigationController pushViewController:fmLessonContentViewController animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FMClassIntroduceCellTableViewCell * cell;
    cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[FMClassIntroduceCellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    LessInfoSelectData * lessonInfo = [_data objectAtIndex:[indexPath row]];
    // 设置信息后布局也确定了，高度也会被算出来。
    [cell setlessonSimepleIntroduceInfo:lessonInfo];
    [_cellList addObject:cell];
    return cell;
}

#pragma mark - 代理方法
#pragma mark 重新设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    FMClassIntroduceCellTableViewCell * cell = _cellList[indexPath.row];
    return cell.height;
}

#pragma mark 重写状态样式方法
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/***********************************************************************/

// 处理函数
- (void)dealLabel:(NetUnit*)nUnit{
    if ([nUnit->cLabel isEqualToString:@"getLesson_C"]) {
        NSString * json = nUnit->receiveString;
        NSDictionary * dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0];
        if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"1"]) {
            NSDictionary * dic;
            NSString * str = [dic objectForKey:@"LessonInfoSelectDataList"];
            if (str.length < 20) {
                [self showHint:@"没有获取到相关数据"];
                return;
            }
            NSArray * array = [NSJSONSerialization JSONObjectWithData:[[dictionary objectForKey:@"LessonInfoSelectDataList"] dataUsingEncoding:NSUTF8StringEncoding]
                                                              options:NSJSONReadingMutableContainers error:nil];
            [_data removeAllObjects];
            for (int i = 0; i < [array count]; i++) {
                dic = [array objectAtIndex:i];
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
                [_data addObject:lessonInfo];
            }
            if (!_tableIsExistInView) {
                [self.view addSubview:_tableView];
                _tableIsExistInView = true;
            }
            else
            {
                [_tableView reloadData];
            }
        }
    }
    [self hideHud];
}

@end
