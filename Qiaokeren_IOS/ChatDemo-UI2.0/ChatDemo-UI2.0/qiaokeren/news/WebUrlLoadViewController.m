//
//  WebUrlLoadViewController.m
//  ChatDemo-UI2.0
//
//  Created by Apple on 15-7-12.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "WebUrlLoadViewController.h"
#import "WXApi.h"
@interface WebUrlLoadViewController ()<UIActionSheetDelegate,UIWebViewDelegate,NJKWebViewProgressDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webViewLoadUrl;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@end

@implementation WebUrlLoadViewController
{
    NJKWebViewProgress *_progressProxy;
    NSArray *arrayBack;
    NSArray *arrayClose;
}
NSString *urlStr;
NSString *webTitle = @"加载中";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"加载中";
    
    //获取状态栏的高度
    CGRect rect = [[UIApplication sharedApplication] statusBarFrame];
    int statusBarHeight = rect.size.height;
    //获取导航栏的高度
    CGFloat navigationBarHeight = CGRectGetHeight(self.navigationController.navigationBar.frame);
    
    
    int progressViewY = statusBarHeight + navigationBarHeight;
    // 1. 用一个临时变量保存返回值。
    CGRect temp = _progressView.frame;
    // 2. 给这个变量赋值。因为变量都是L-Value，可以被赋值
    temp.origin.y = progressViewY;
    // 3. 修改frame的值
    _progressView.frame = temp;
    
    
    
    UIButton *shareButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [shareButton setImage:[UIImage imageNamed:@"z_webshare.png"] forState:UIControlStateNormal];
    [shareButton addTarget:self action:@selector(shareUrlToWeChat) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithCustomView:shareButton];
    self.navigationItem.rightBarButtonItem = shareItem;
    
    
    _progressProxy = [[NJKWebViewProgress alloc] init];
    _webViewLoadUrl.delegate = _progressProxy;
    _progressProxy.webViewProxyDelegate = self;
    _progressProxy.progressDelegate = self;
    
    NSURL *url =[NSURL URLWithString:[NSString stringWithFormat:@"%@",urlStr]];
    _webViewLoadUrl.backgroundColor = [UIColor clearColor];
    _webViewLoadUrl.opaque = NO;
    [_webViewLoadUrl loadRequest:[NSURLRequest requestWithURL:url]];
    
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backWebView)];
    UIBarButtonItem *closeButton = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(webLoadToUpView)];
    arrayBack = [NSArray arrayWithObjects: backButton,nil];
    arrayClose = [NSArray arrayWithObjects: backButton,closeButton,nil];
    [self.navigationItem setLeftBarButtonItems:arrayBack];
    
}

-(void)shareUrlToWeChat{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"分享"
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles: @"发送给好友",@"分享到朋友圈",@"复制链接",nil];
    [actionSheet showInView:self.view];
    
}


-(void)actionSheet:(UIActionSheet*)actionSheet
didDismissWithButtonIndex:(NSInteger)buttonIndex{
    
    if(buttonIndex == [actionSheet cancelButtonIndex]){
        return;
    }
    
    //分享给微信朋友
    if(buttonIndex == 0){
        //        [self showHint:@"发送给好友"];
        [self sendLinkContent:0];
    }
    //分享到朋友圈
    if(buttonIndex == 1){
        //        [self showHint:@"分享到朋友圈"];
        [self sendLinkContent:1];
    }
    
    if (buttonIndex == 2) {
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        pasteboard.string = _webViewLoadUrl.request.URL.absoluteString;
        [self showHint:@"链接已复制，长按可粘贴"];
    }
}

- (void) sendLinkContent:(NSInteger *)type
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = webTitle;
    message.description = webTitle;
    //    NSString *myURL = @"http://ubmcmm.baidustatic.com/media/v1/0f0005z0qh4dSM4Qwg1USf.jpg";
    //    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:myURL]]];
    //    UIImage *image = [UIImage imageNamed:@"120.png"];
    //    [message setThumbImage:image];
    
    WXWebpageObject *ext = [WXWebpageObject object];
    ext.webpageUrl = urlStr;
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    //    req.scene = WXSceneSession;//会话
    //    req.scene = WXSceneTimeline;//朋友圈
    //    req.scene = WXSceneFavorite;//收藏
    if (type == 0) {
        req.scene = WXSceneSession;//会话
    }else if ((int)type == 1){
        req.scene = WXSceneTimeline;//朋友圈
    }
    [WXApi sendReq:req];
    
}


//加载进度
#pragma mark - NJKWebViewProgressDelegate
-(void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress
{
    NSLog(@"updateProgress start");
    if (progress == 0.0) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        _progressView.progress = 0;
        [UIView animateWithDuration:0.27 animations:^{
            self->_progressView.alpha = 1.0;
        }];
    }
    if (progress == 1.0) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [UIView animateWithDuration:0.27 delay:progress - _progressView.progress options:0 animations:^{
            self->_progressView.alpha = 0.0;
        } completion:nil];
    }
    [_progressView setProgress:progress animated:YES];
    NSLog(@"updateProgress end");
}

//加载前
//- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request
// navigationType:(UIWebViewNavigationType)navigationType{
//    [self showHint:@"准备加载"];
//    return YES;
//}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidStartLoad");
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidFinishLoad start");
    webTitle = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.title = webTitle;
    //如果打开了二级以上的页面，则显示关闭的按钮
    if ([_webViewLoadUrl canGoBack]) {
        [self.navigationItem setLeftBarButtonItems:arrayClose];
    }else{
        [self.navigationItem setLeftBarButtonItems:arrayBack];
    }
    NSLog(@"webViewDidFinishLoad end");
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self showHint:@"加载失败"];
    NSLog(@"didFailLoadWithError");
}


- (void)backWebView
{
    NSLog(@"backWebView");
    if ([_webViewLoadUrl canGoBack]) {
        [_webViewLoadUrl goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)webLoadToUpView{
    NSLog(@"webLoadToUpView");
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setLoadUrl:(NSString*)url{
    urlStr = url;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end