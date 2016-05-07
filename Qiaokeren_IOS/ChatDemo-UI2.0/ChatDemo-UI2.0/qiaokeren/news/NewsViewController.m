//
//  ViewController.m
//  TestIOS
//
//  Created by lenbol on 13-6-5.
//  Copyright (c) 2013年 lenbol. All rights reserved.
//

#import "NewsViewController.h"
#import "DBImageView.h"
#import "UIImageView+DispatchLoad.h"
#import "UIImageView+WebCache.h"
#import "JZgetNews_c.h"
#import "QiaokerenApplication.h"
#import "UtilsAll.h"
#import "NewsSelectData.h"
#import "WebUrlLoadViewController.h"
#import "JZgetHotNews_C.h"
#import "HotNews.h"
@interface NewsViewController ()

@end

@implementation NewsViewController
@synthesize computers;
@synthesize tvCell;
@synthesize data;
@synthesize dataHotNews;

@synthesize scrollView, slideImages;
@synthesize text;
@synthesize pageControl;
//@synthesize jzDataHandle;
int screenWidth = 300;
int hotNewsScrollViewHeight = 135;
bool HasLoadFlagNews = NO;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"资讯";
    
    screenWidth = self.view.frame.size.width;
    data = [NSMutableArray array];
    dataHotNews = [NSMutableArray array];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self sendHotNewsMsg];
    if (!HasLoadFlagNews) {
        [self showHudInView:self.view hint:@"正在加载..."];
    }
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self hideHud];
}


-(void)sendHotNewsMsg{
    NSString *level = @"0";
    if([QiaokerenApplication getUserSelectData] != nil){
        NSString* str = [QiaokerenApplication getUserSelectData].qlevel;
        if(str){
            level = str;
        }
    }
    JZgetHotNews_C *li = [JZgetHotNews_C Jz_initialize];
    [li initWithInfo:@"" UserID:[QiaokerenApplication getAccountNumber] UploadTime:[UtilsAll getFormatTime222] PubLevel:level PageSize:@"100" PageIndex:@"0"];
    NSDictionary *nsdic = [li toDictionary];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:nsdic time:@"2015" protocol:123 label:@"JZgetHotNews_C"];
}

//加载热门资讯
- (void)loadHotNews
{
    
    // 定时器 循环
    [NSTimer scheduledTimerWithTimeInterval:6 target:self selector:@selector(runTimePage) userInfo:nil repeats:YES];
    // 初始化 scrollview
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, hotNewsScrollViewHeight)];
    scrollView.bounces = YES;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    // 初始化 数组 并添加四张图片
    slideImages = [[NSMutableArray alloc] init];
    if ([dataHotNews count] <= 0) {
        return;
    }
    
    for (int q=0; q<[dataHotNews count]; q++) {
        HotNews *hot = [dataHotNews objectAtIndex:q];
        [slideImages addObject:hot.imageurl];
        
         
         UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[slideImages objectAtIndex:q]]];
         imageView.frame = CGRectMake((screenWidth * q) + screenWidth, 0, screenWidth, hotNewsScrollViewHeight);
         [scrollView addSubview:imageView]; // 首页是第0页,默认从第1页开始的。所以+320。。。
         
         //点击事件
         imageView.tag = q+10000;
         NSString *str =  [[NSString alloc] initWithFormat:@"%d",q];
         imageView.restorationIdentifier = str;
         imageView.userInteractionEnabled = YES;
         // 内容模式
         imageView.clipsToBounds = YES;
         imageView.contentMode = UIViewContentModeScaleAspectFill;
         [imageView setImageWithURL: [NSURL URLWithString: hot.imageurl] placeholderImage: [UIImage imageNamed:@"z_logindefault.png"] ];
         [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loadWebView:)] ];
        
    }
    // 初始化 pagecontrol
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(120,hotNewsScrollViewHeight-20,100,18)]; // 初始化mypagecontrol
    [pageControl setCurrentPageIndicatorTintColor:[UIColor redColor]];
    [pageControl setPageIndicatorTintColor:[UIColor blackColor]];
    pageControl.numberOfPages = [self.slideImages count];
    pageControl.currentPage = 0;
    [pageControl addTarget:self action:@selector(turnPage) forControlEvents:UIControlEventValueChanged]; // 触摸mypagecontrol触发change这个方法事件
    [self.view addSubview:pageControl];
    // 取数组最后一张图片 放在第0页
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[slideImages objectAtIndex:([slideImages count]-1)]]];
    imageView.frame = CGRectMake(0, 0, screenWidth, hotNewsScrollViewHeight); // 添加最后1页在首页 循环
    [scrollView addSubview:imageView];
    // 取数组第一张图片 放在最后1页
    imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[slideImages objectAtIndex:0]]];
    imageView.frame = CGRectMake((screenWidth * ([slideImages count] + 1)) , 0, screenWidth, hotNewsScrollViewHeight); // 添加第1页在最后 循环
    [scrollView addSubview:imageView];
    
    [scrollView setContentSize:CGSizeMake(screenWidth * ([slideImages count] + 2), hotNewsScrollViewHeight)]; //  +上第1页和第4页  原理：4-[1-2-3-4]-1
    [scrollView setContentOffset:CGPointMake(0, 0)];
    [self.scrollView scrollRectToVisible:CGRectMake(screenWidth,0,screenWidth,hotNewsScrollViewHeight) animated:NO]; // 默认从序号1位置放第1页 ，序号0位置位置放第4页
}
// scrollview 委托函数
- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    CGFloat pagewidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pagewidth/([slideImages count]+2))/pagewidth)+1;
    page --;  // 默认从第二页开始
    pageControl.currentPage = page;
}
// scrollview 委托函数
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pagewidth = self.scrollView.frame.size.width;
    int currentPage = floor((self.scrollView.contentOffset.x - pagewidth/ ([slideImages count]+2)) / pagewidth) + 1;
    //    int currentPage_ = (int)self.scrollView.contentOffset.x/320; // 和上面两行效果一样
    //    NSLog(@"currentPage_==%d",currentPage_);
    if (currentPage==0)
    {
        [self.scrollView scrollRectToVisible:CGRectMake(screenWidth * [slideImages count],0,screenWidth,hotNewsScrollViewHeight) animated:NO]; // 序号0 最后1页
    }
    else if (currentPage==([slideImages count]+1))
    {
        [self.scrollView scrollRectToVisible:CGRectMake(screenWidth,0,screenWidth,hotNewsScrollViewHeight) animated:NO]; // 最后+1,循环第1页
    }
}
// pagecontrol 选择器的方法
- (void)turnPage
{
    long page = pageControl.currentPage; // 获取当前的page
    [self.scrollView scrollRectToVisible:CGRectMake(screenWidth*(page+1),0,screenWidth,hotNewsScrollViewHeight) animated:NO]; // 触摸pagecontroller那个点点 往后翻一页 +1
}
// 定时器 绑定的方法
- (void)runTimePage
{
    long page = pageControl.currentPage; // 获取当前的page
    page++;
    page = page > 3 ? 0 : page ;
    pageControl.currentPage = page;
    [self turnPage];
}


-(void)loadWebView:(UITapGestureRecognizer *)imageTap
{
//    NSInteger abc = [imageTap.view.restorationIdentifier integerValue];
    long index = imageTap.view.tag-10000;
    HotNews *hot = [dataHotNews objectAtIndex:index];
    WebUrlLoadViewController *webUrlLoadController =  [[WebUrlLoadViewController alloc] init];
    
    [webUrlLoadController setLoadUrl:hot.linkurl];
    [self.navigationController pushViewController:webUrlLoadController animated:YES];
    

}

-(void)sendNewsMsg{
    NSString *level = @"0";
    if([QiaokerenApplication getUserSelectData] != nil){
        NSString* str = [QiaokerenApplication getUserSelectData].qlevel;
        if(str){
            level = str;
        }
    }
    JZgetNews_c *li = [JZgetNews_c Jz_initialize];
    [li initWithInfo:@"" UserID:[QiaokerenApplication getAccountNumber] UploadTime:[UtilsAll getFormatTime444] PageSize:@"100" PageIndex:@"0" UserLevel:level];
    NSDictionary *nsdic = [li toDictionary];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:nsdic time:@"2015" protocol:123 label:@"JZgetNews_c"];
}

-(void ) viewDidUnload
{
    //self.computers = nil;
    //2
    self.computers = nil;
    self.tvCell = nil;
    [super viewDidUnload];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark-
#pragma mark Table Data Source Methods
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data count];
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CustomCellIdentifier = @"CustomNewsCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier];
    if(cell ==nil)
    {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"CustomNewsCell" owner:self options:nil];
        if([nib count]>0)
        {
            cell = self.tvCell;
        }
        else{
            NSLog(@"fail load nib");
        }
    }
    NSUInteger row = [indexPath row];
    UILabel *labelAmount = (UILabel *)[cell viewWithTag:kTitleValueNewsTag];
    NewsSelectData *news = [data objectAtIndex:row];
    labelAmount.text = news.pubnewsname;
    UILabel *labelTime = (UILabel *)[cell viewWithTag:kDescribeValueNewsTag];
    labelTime.text = news.pubcontentsummary;
    DBImageView *imageView = [[DBImageView alloc] initWithFrame:(CGRect){ screenWidth - 85, 5, 80, 80 }];
    [cell.contentView addSubview:imageView];

    [imageView setImageWithPath:news.publogores];

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    NewsDetailViewController *newDetailController =  [[NewsDetailViewController alloc] init];
//     NewsSelectData *news = [data objectAtIndex:indexPath.row];
//    [newDetailController setLoadUrl:news.publinkres];
//    [self.navigationController pushViewController:newDetailController animated:YES];
    
    if ([QiaokerenApplication getAccountType] != 0) {
        WebUrlLoadViewController *webUrlLoadController =  [[WebUrlLoadViewController alloc] init];
        NewsSelectData *news = [data objectAtIndex:indexPath.row];
        [webUrlLoadController setLoadUrl:news.publinkres];
        [self.navigationController pushViewController:webUrlLoadController animated:YES];
    }
    
    

    
}

/***********************************************************************/


// 处理函数
- (void)dealLabel:(NetUnit*)nUnit{
    
    if ([nUnit->cLabel isEqualToString:@"JZgetHotNews_C"]) {
        NSString * json = nUnit->receiveString;
//                 NSLog(@"已经获取到资讯到数据－－－%@",json);
        //更新ui，解析json
        
        NSDictionary*dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:  NSUTF8StringEncoding ] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0 ];
        
        if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"1"]) {
            HasLoadFlagNews = YES;
            NSDictionary*dic;
            //判断是否能够组成字典
            NSString *str = [dictionary objectForKey:@"HotNewsList"];
            if(str.length < 20){
                return;
            }
            
            NSArray* array = [NSJSONSerialization JSONObjectWithData:[[dictionary objectForKey:@"HotNewsList"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil] ;
            [dataHotNews removeAllObjects];
            
            for (int i=0; i<[array count]; i++) {
                dic = [array  objectAtIndex:i];
                HotNews* newsdata = [HotNews Jz_initialize];
                [newsdata initWithInfo:@"HotNews"
                                 hotid:[UtilsAll TOString:[dic objectForKey:@"hotid"]]
                                  type:[dic objectForKey:@"type"]
                              imageurl:[dic objectForKey:@"imageurl"]
                               linkurl:[dic objectForKey:@"linkurl"]
                                 ishot:[dic objectForKey:@"ishot"]
                                ismust:[dic objectForKey:@"ismust"]
                              publevel:[dic objectForKey:@"publevel"]
                                author:[dic objectForKey:@"author"]
                            uploadtime:[dic objectForKey:@"uploadtime"]
                                  time:[dic objectForKey:@"time"]];
                
                [dataHotNews addObject:newsdata];
                
            }
            
            [self loadHotNews];
            [self sendNewsMsg];
        }else{
            //            UIAlertView * myAlert = [[UIAlertView alloc]initWithTitle:@"提示:" message:@"获取信息列表失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            //            [myAlert show];
        }
        
    }
    
    
    if ([nUnit->cLabel isEqualToString:@"JZgetNews_c"]) {
        NSString * json = nUnit->receiveString;
//         NSLog(@"已经获取到资讯到数据－－－%@",json);
        //更新ui，解析json
        
        NSDictionary*dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:  NSUTF8StringEncoding ] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0 ];
        
        if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"1"]) {
            
            NSDictionary*dic;
            //判断是否能够组成字典
            NSString *str = [dictionary objectForKey:@"NewsList"];
            if(str.length < 20){
                return;
            }
            
            NSArray* array = [NSJSONSerialization JSONObjectWithData:[[dictionary objectForKey:@"NewsList"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil] ;
            [data removeAllObjects];
            for (int i=0; i<[array count]; i++) {
                dic = [array  objectAtIndex:i];
                NewsSelectData* newsdata = [NewsSelectData Jz_initialize];
                [newsdata initWithInfo:@"News"
                                 newsid:[UtilsAll TOString:[dic objectForKey:@"newsid"]]
                                 userid:[UtilsAll TOString:[dic objectForKey:@"userid"]]
                            pubnickname:[dic objectForKey:@"pubnickname"]
                               publevel:[dic objectForKey:@"publevel"]
                            pubnewsname:[dic objectForKey:@"pubnewsname"]
                             publogores:[dic objectForKey:@"publogores"]
                      pubcontentsummary:[dic objectForKey:@"pubcontentsummary"]
                             publinkres:[dic objectForKey:@"publinkres"]
                             uploadtime:[dic objectForKey:@"uploadtime"]];
                [data addObject:newsdata];
            }
            [_tableview reloadData];
        }else{
//            UIAlertView * myAlert = [[UIAlertView alloc]initWithTitle:@"提示:" message:@"获取信息列表失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//            [myAlert show];
        }
        
    }
    
    
    
    
    
    [self hideHud];
}
@end
