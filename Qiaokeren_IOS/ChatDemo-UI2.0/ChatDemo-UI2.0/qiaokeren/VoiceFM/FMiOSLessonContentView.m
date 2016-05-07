//
//  FMiOSLessonContentView.m
//  ChatDemo-UI2.0
//
//  Created by apple on 15/7/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "FMiOSLessonContentView.h"

#import "JZDataHandle.h"
#import "getLessonContent_C.h"
#import "QiaokerenApplication.h"
#import "UtilsAll.h"
#import "FMLessonContentOtherStyleCellTableViewCell.h"
#import "FMLessonClassInfoCell.h"

@interface FMiOSLessonContentView ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate,JZDataHandleDelegate>
{
    LessInfoSelectData * _classInfo;
    UITableView * _tableView;
    NSMutableArray * _data;
    NSMutableArray * _cellList;
    BOOL _tableIsExistInView;
}
@end

@implementation FMiOSLessonContentView
static NSString * classInfoItemIdentifier = @"classInfoCell";
static NSString * lessonContentItemIdentifier = @"lessonContentCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _data = [[NSMutableArray alloc] init];
    _cellList = [[NSMutableArray alloc] init];
    _tableIsExistInView = false;
}
- (void)viewWillAppear:(BOOL)animated{
    [self viewWillAppear:YES];
    // 这里设置发送请求
    // 菊花旋转起来
    [self showHudInView:self.view hint:@"正在加载..."];
    [self sendGetLessonContent_CMsg];
}

-(void)sendGetLessonContent_CMsg{
    getLessonContent_C * gc = [getLessonContent_C instance2];
    [gc initWithInfo:@"getLessoContent_C"
                   p:@"0"
              UserID:[[QiaokerenApplication getUserSelectData] quserid]
          UploadTime:[UtilsAll getFormatTime444]
      classcontentid:@"0"
             classid:[_classInfo classid]
              userid:[[QiaokerenApplication getUserSelectData] quserid]
           timestamp:[UtilsAll getFormatTime444]
            username:@"0"
               place:[UtilsAll getLocation]
        contentclass:@"0"
             content:@"0"
                 url:@"0"
                 tip:@"0"
            PageSize:@"1000"
           PageIndex:@"0"];
    NSDictionary * nsdic = [gc toDictionary];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:nsdic time:@"2015" protocol:123 label:@"getLessoContent_C"];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 加载网络文件并进行播放
    if ([indexPath row] > 0) {
        // 开始播放
        for (int i = 1; i < _cellList.count; i++) {
            FMLessonContentOtherStyleCellTableViewCell * otherCell;
            otherCell = [_cellList objectAtIndex:i];
            [otherCell trackStop];
        }
        FMLessonContentOtherStyleCellTableViewCell * cell;
        cell = [_cellList objectAtIndex:[indexPath row]];
        [cell cellClick];
    } else {
        // 点击第一个class条目
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count + 1; // 一个课程信息，n个课程内容条
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if([indexPath row] == 0){
        FMLessonClassInfoCell * cell;
        cell = [tableView dequeueReusableCellWithIdentifier:classInfoItemIdentifier];
        if (!cell) {
            cell = [[FMLessonClassInfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:classInfoItemIdentifier];
            [cell loadView];
        }
        LessInfoSelectData * lessonInfo = [_data objectAtIndex:[indexPath row]];
        // 设置信息后布局也确定了，高度也会被算出来。
        [cell setLessonSimepleIntroduceInfo:lessonInfo];
        [_cellList addObject:cell];
        return cell;
    }
    else
    {
        FMLessonContentOtherStyleCellTableViewCell * cell;
        cell = [tableView dequeueReusableCellWithIdentifier:lessonContentItemIdentifier];
        if (!cell) {
            cell = [[FMLessonContentOtherStyleCellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:lessonContentItemIdentifier];
            [cell loadView];
        }
        LessonContentSelectData * lessonInfo = [_data objectAtIndex:[indexPath row]];
        // 设置信息后布局也确定了，高度也会被算出来。
        [cell setLessonContentInfo:lessonInfo];
        [_cellList addObject:cell];
        return cell;
    }
}

#pragma mark - 代理方法
#pragma mark 重新设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    FMClassSimpleIntroduceCell * cell = _cellList[indexPath.row];
    
    if ([indexPath row] == 0) {
        FMLessonClassInfoCell * cell = _cellList[indexPath.row];
        return cell.height;
    }
    else
    {
        FMLessonContentOtherStyleCellTableViewCell * cell = _cellList[indexPath.row];
        return cell.height;
    }
    
    
    
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
    if ([nUnit->cLabel isEqualToString:@"getLessoContent_C"]) {
        NSString * json = nUnit->receiveString;
        NSDictionary * dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0];
        if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"1"]) {
            NSDictionary * dic;
            NSString * str = [dic objectForKey:@"LessonContentSelectDataList"];
            if (str.length < 20) {
                [self showHint:@"没有获取到相关数据"];
                return;
            }
            NSArray * array = [NSJSONSerialization JSONObjectWithData:[[dictionary objectForKey:@"LessonInfoSelectDataList"] dataUsingEncoding:NSUTF8StringEncoding]
                                                              options:NSJSONReadingMutableContainers error:nil];
            [_data removeAllObjects];
            for (int i = 0; i < [array count]; i++) {
                dic = [array objectAtIndex:i];
                LessonContentSelectData * lessonContentInfo = [LessonContentSelectData instance2];
                [lessonContentInfo initWithInfo:@"LessonContentSelectData"
                                 classcontentid:[UtilsAll TOString:[dic objectForKey:@"classcontentid"]]
                                        classid:[UtilsAll TOString:[dic objectForKey:@"classid"]]
                                         userid:[UtilsAll TOString:[dic objectForKey:@"userid"]]
                                      timestamp:[dic objectForKey:@"timestamp"]
                                       username:[dic objectForKey:@"username"]
                                          place:[dic objectForKey:@"place"]
                                   contentclass:[dic objectForKey:@"contentclass"]
                                        content:[dic objectForKey:@"content"]
                                            url:[dic objectForKey:@"url"]
                                            tip:[dic objectForKey:@"tip"]];
                [_data addObject:lessonContentInfo];
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

-(void)sendClassBaseInfo:(LessInfoSelectData*)classBaseInfo
{
    _classInfo = classBaseInfo;
}
@end