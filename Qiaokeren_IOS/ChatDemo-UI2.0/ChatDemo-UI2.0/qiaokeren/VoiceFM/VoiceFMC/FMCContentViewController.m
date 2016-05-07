//
//  FMCContentViewController.m
//  ChatDemo-UI2.0
//
//  Created by apple on 15/7/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import "FMCContentViewController.h"
#import "getLesson_C.h"
#import "LessInfoSelectData.h"
#import "LessonContentSelectData.h"
#import "getLessonContent_C.h"
#import "QiaokerenApplication.h"
#import "UtilsAll.h"
#import "UIImageView+DispatchLoad.h"
#import "DOUAudioStreamer.h"
#import "DOUAudioVisualizer.h"
#import "FMTrack.h"
#import "amrFileCodec.h"
#import "EMVoiceConverter.h"
//#import "PLAudioPlayer.h"
//#import "PLAudioPath.h"
@interface FMCContentViewController ()<NSURLConnectionDelegate>{
    DOUAudioStreamer *_streamer;
    DOUAudioVisualizer *_audioVisualizer;
    //    FMTrack * fmTrack;
    NSMutableArray *TrackList;
    //    NSMutableArray *URLList;
    //    PLAudioPlayer *audioPlayer;
    NSString *FilePath;
    //    NSURL *audioURL;
    NSMutableData *connectionData;
    NSURLConnection *connection;
    NSMutableDictionary *connectDictionary;
    BOOL isNeedConvert;
}
@property (weak, nonatomic) IBOutlet UITableView *tableview;
//@property (strong, nonatomic)PLAudioPlayer *audioPlayer;
//@property (strong, nonatomic)NSMutableArray *URLList;
@property (strong, nonatomic)NSMutableArray *TrackList;
@property (strong, nonatomic)NSMutableData *connectionData;
@property (strong, nonatomic)NSURLConnection *connection;
@property (strong, nonatomic)NSString *FilePath;
//@property (strong, nonatomic)NSURL *audioURL;
@property (strong, nonatomic)NSMutableDictionary *connectDictionary;
//@property (strong, nonatomic)FMTrack * fmTrack;
@property (nonatomic)BOOL isNeedConvert;
@end

@implementation FMCContentViewController
//@synthesize audioPlayer;
@synthesize data;
@synthesize classInfo;
@synthesize contentcell;
//@synthesize URLList;
@synthesize connection;
@synthesize connectionData;
//@synthesize audioURL;
@synthesize FilePath;
@synthesize connectDictionary;
//@synthesize fmTrack;
@synthesize isNeedConvert;
@synthesize TrackList;

- (void)viewDidLoad {
    [super viewDidLoad];
    data = [NSMutableArray array];
    TrackList = [NSMutableArray array];
    //    URLList = [NSMutableArray array];
    //    audioPlayer = [[PLAudioPlayer alloc] init];
    //    audioPlayer.isNeedConvert=YES;
    connectDictionary = [NSMutableDictionary dictionary];
    isNeedConvert = YES;
    _tableview.delegate = self;
    _tableview.dataSource = self;
    
    // 播放策略
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    // 这里设置发送请求
    // 菊花旋转起来
    [self showHudInView:self.view hint:@"正在加载..."];
    [self sendGetLessonContent_CMsg];
    
    //    [_tableView reloadData];
}

-(void)sendGetLessonContent_CMsg{
    getLessonContent_C * gc = [getLessonContent_C instance2];
    [gc initWithInfo:@"getLessoContent_C"
                   p:@"0"
              UserID:[[QiaokerenApplication getUserSelectData] quserid]
          UploadTime:[UtilsAll getFormatTime]
      classcontentid:@"0"
             classid:[classInfo classid]
              userid:[[QiaokerenApplication getUserSelectData] quserid]
           timestamp:[UtilsAll getFormatTime]
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

#pragma mark Table Data Source Methods
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data count];
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indexPath.row : %ld",(long)indexPath.row);
    static NSString *CustomCellIdentifier = @"CustomLessonContentCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier];
    if(cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"FMCContentCell" owner:self options:nil];
        if([nib count]>0)
        {
            cell = self.contentcell;
        }
        else{
            NSLog(@"fail load nib");
        }
    }
    UIImageView * touxiang = (UIImageView*)[cell viewWithTag:1];
    UIButton * audio = (UIButton*)[cell viewWithTag:2];
    
    LessonContentSelectData *lisd = [data objectAtIndex:indexPath.row];
    NSString *url = [QiaokerenApplication getTouXiangUrlUserID:[lisd userid]];
    touxiang.image = [UIImage imageNamed:@"z_logindefault.png"];
    [touxiang setImageFromUrl:url
                   completion:^(void) {}];
    FMTrack *thefmTrack = [[FMTrack alloc] init];
    [thefmTrack setAudioFileURL:[NSURL URLWithString:[lisd url]]];
    [TrackList addObject:thefmTrack];
    //    audioURL =[NSURL URLWithString:[lisd url]];
    //    NSLog(@"audioURL : %@",audioURL);
    //    [URLList addObject:[NSURL URLWithString:[lisd url]]];
    audio.userInteractionEnabled = YES;
    // 内容模式
    audio.clipsToBounds = YES;
    audio.contentMode = UIViewContentModeScaleAspectFill;
    audio.tag = indexPath.row + 1000;
    audio.backgroundColor = [UIColor clearColor];
    [audio addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(audioOnclickListener:)] ];
    
    
    return cell;
}
- (void) audioOnclickListener:(UITapGestureRecognizer *)Tap{
    //    [self endPlayBtAction];
    [self _cancelStreamer];
    long a =  Tap.view.tag-1000;
    //    NSURL *displayURL = [URLList objectAtIndex:a];
    //    _streamer = [DOUAudioStreamer streamerWithAudioFile:[TrackList objectAtIndex:a]];
    //    [_streamer play];
    NSLog(@"indexPath.row : %ld",a);
    NSLog(@"点击传递的url : %@",[[TrackList objectAtIndex:a] audioFileURL]);
    [self URLDownload:[[TrackList objectAtIndex:a] audioFileURL]];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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
/***********************************************************************/
#pragma mark 重写状态样式方法
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
// 处理函数
- (void)dealLabel:(NetUnit*)nUnit{
    [self hideHud];
    if ([nUnit->cLabel isEqualToString:@"getLessoContent_C"]) {
        NSString * json = nUnit->receiveString;
        NSDictionary * dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0];
        if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"1"]) {
            NSDictionary * dic;
            NSString * str = [dictionary objectForKey:@"LessonContentSelectDataList"];
            if (str.length < 20) {
                [self showHint:@"没有获取到相关数据"];
                return;
            }
            NSArray * array = [NSJSONSerialization JSONObjectWithData:[[dictionary objectForKey:@"LessonContentSelectDataList"] dataUsingEncoding:NSUTF8StringEncoding]
                                                              options:NSJSONReadingMutableContainers error:nil];
            [data removeAllObjects];
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
                [data addObject:lessonContentInfo];
            }
            
            [_tableview reloadData];
        }
    }
    
}


- (void)URLDownload:(NSURL*)url
{
    //获取Documents文件夹目录
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [path objectAtIndex:0];
    //指定新建文件夹路径
    NSString *DocPath = [documentPath stringByAppendingPathComponent:@"DownloadAudioFile"];
    //创建ImageFile文件夹
    [[NSFileManager defaultManager] createDirectoryAtPath:DocPath withIntermediateDirectories:YES attributes:nil error:nil];
    
    //保存的路径
    FilePath = [DocPath stringByAppendingPathComponent:url.lastPathComponent];
    NSFileManager * fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:FilePath]) {
        NSLog(@"文件已经存在，直接播放");
        NSLog(@"FilePath : %@", FilePath);
        [self startPlayBtAction:FilePath];
        return;
    }
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    connection = [[NSURLConnection alloc] initWithRequest:request
                                                 delegate:self
                                         startImmediately:YES];
    connectionData = [NSMutableData data];
    //    __weak NSURLConnection *con = connection;
    if (self.connection != nil){
        NSLog(@"Successfully created the connection");
    } else {
        NSLog(@"Could not create the connection");
    }
}
- (void) connection:(NSURLConnection *)connection
   didFailWithError:(NSError *)error{
    NSLog(@"An error happened");
    NSLog(@"%@", error);
}
- (void) connection:(NSURLConnection *)connection
     didReceiveData:(NSData *)rdata{
    NSLog(@"Received data");
    [self.connectionData appendData:rdata];
}
- (void) connectionDidFinishLoading:(NSURLConnection *)fconnection{
    /* 下载的数据 */
    NSLog(@"下载音频文件成功");
    //保存
    if ([[NSFileManager defaultManager] createFileAtPath:FilePath contents:connectionData attributes:nil]) {
        NSLog(@"保存音频文件成功.");
        [self startPlayBtAction:FilePath];
    } else {
        NSLog(@"保存音频文件失败.");
    }
}

-(void)startPlayBtAction:(NSString *)fileName{
    //    [audioPlayer startPlayAudioFile:[PLAudioPath recordPathOriginToAMR]
    if(![self playWithFileName:fileName isAMR:YES]){
        NSLog(@"播放失败,删除错误音频文件");
        NSFileManager *fm = [NSFileManager defaultManager];
        NSError * fileError1 = [[NSError alloc] init];
        NSError * fileError2 = [[NSError alloc] init];
        [fm removeItemAtPath:fileName error:&fileError1];
        [fm removeItemAtPath:[NSString stringWithFormat:@"%@.wav",[fileName stringByDeletingPathExtension]] error:&fileError2];
    }
}
- (void) connection:(NSURLConnection *)connection
 didReceiveResponse:(NSURLResponse *)response{
    [self.connectionData setLength:0];
}
- (void) viewDidUnload{
    [super viewDidUnload];
    [self.connection cancel];
    self.connection = nil;
    self.connectionData = nil;
}
-(BOOL)playWithFileName:(NSString *)fileName isAMR:(BOOL)isAMR{
    //    NSLog(@"-(BOOL)playWithFileName:%@ isAMR:%d",fileName,isAMR);
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:NULL];
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    if (!fileName) return NO;
    //    NSData *audiodata;
    NSURL * url = [NSURL fileURLWithPath:fileName];
    NSLog(@"fileNameURL : %@",url);
    if (isAMR) {
        NSString * wavSavePath = [NSString stringWithFormat:@"%@.wav",[fileName stringByDeletingPathExtension]];
        if (isNeedConvert) {
            NSLog(@"wavSavePath : %@",wavSavePath);
            if (![EMVoiceConverter isAMRFile:fileName])
                NSLog(@"ERROR:isAMRFile : %d",[EMVoiceConverter isAMRFile:fileName]);
            
            int isAmrToWav = [EMVoiceConverter amrToWav:fileName wavSavePath:wavSavePath];
            NSLog(@"isAmrToWav : %d",isAmrToWav);
            url = [NSURL fileURLWithPath:wavSavePath];
            FMTrack *tracktrack = [[FMTrack alloc] init];
            [tracktrack setAudioFileURL:url];
            _streamer = [DOUAudioStreamer streamerWithAudioFile:tracktrack];
            [_streamer play];
            return true;
        }else{
            return false;
        }
    }else{
        return false;
    }
}

- (void)_cancelStreamer
{
    if (_streamer != nil) {
        [_streamer pause];
        //        [_streamer stop];
        
        _streamer = nil;
    }
}
- (void)_resetStreamer
{
    [self _cancelStreamer];
    
    
    [_streamer play];
    
    
}
- (void)cellClick
{
    [self _resetStreamer];
}
- (void)_actionPlayPause:(id)sender
{
    if ([_streamer status] == DOUAudioStreamerPaused ||
        [_streamer status] == DOUAudioStreamerIdle) {
        [_streamer play];
    }
    else {
        [_streamer pause];
    }
}
- (void)_actionPause{
    [_streamer pause];
}
- (void) trackStop {
    [_streamer stop];
}
- (void)_actionStop:(id)sender
{
    [_streamer stop];
}
@end
