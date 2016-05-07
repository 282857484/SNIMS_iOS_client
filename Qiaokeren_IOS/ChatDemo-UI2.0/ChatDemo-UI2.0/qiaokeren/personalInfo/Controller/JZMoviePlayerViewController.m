//
//  JZMoviePlayerViewController.m
//  video
//
//  Created by 杨珺舟 on 15-1-19.
//
//

#import "JZMoviePlayerViewController.h"

@implementation JZMoviePlayerViewController
@synthesize movieURL;
@synthesize isHiddenStatus;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    loadingAni = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(140, 150, 37, 37)];
    loadingAni.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    [self.view addSubview:loadingAni];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(130, 190, 80, 40)];
    label.text = @"加载中...";
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    
    [[self view] setBackgroundColor:[UIColor blackColor]];
    
    [loadingAni startAnimating];
    [self.view addSubview:label];
}


- (void) moviePlayerLoadStateChanged:(NSNotification*)notification
{
    [loadingAni stopAnimating];
    [label removeFromSuperview];
    
    // Unless state is unknown, start playback
    if ([mpMoviePlayerController loadState] != MPMovieLoadStateUnknown)
    {
        // Remove observer
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:MPMoviePlayerLoadStateDidChangeNotification
                                                      object:nil];
        
        // When tapping movie, status bar will appear, it shows up
        // in portrait mode by default. Set orientation to landscape
        //设置横屏
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight animated:NO];
        // Rotate the view for landscape playback
        [[self view] setBounds:CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.width)];
        [[self view] setCenter:CGPointMake(self.view.frame.size.height/2,self.view.frame.size.width/2)];
        //选中当前view
        [[self view] setTransform:CGAffineTransformMakeRotation(M_PI / 2)];
        
        // Set frame of movieplayer
        [[mpMoviePlayerController view] setFrame:self.view.bounds];
        
        // Add movie player as subview
        [[self view] addSubview:[mpMoviePlayerController view]];
        [self hideStatusBar];
//        [[[self view].superview ]prefersStatusBarHidden];
        // Play the movie
        [mpMoviePlayerController play];
    }
}

//播放完成后 或者点击done后执行
- (void) moviePlayBackDidFinish:(NSNotification*)notification
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    //还原状态栏为默认状态
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
    // Remove observer
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:nil];
    NSLog(@"这里输出了么");
    [self dismissViewControllerAnimated:NO completion:nil];
    //[self dismissModalViewControllerAnimated:NO]; // 已经过时
    [mpMoviePlayerController.view removeFromSuperview];
    [self.navigationController popViewControllerAnimated:YES];
    
}

//实例化 这个controllor类时调用这个方法
- (void) readyPlayer
{
    mpMoviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:movieURL];
    NSLog(@"传入的播放路径是%@",movieURL);
    //加载完收到通知  执行设置全屏的方法
    if ([mpMoviePlayerController respondsToSelector:@selector(loadState)])
    {
        // Set movie player layout
        [mpMoviePlayerController setControlStyle:MPMovieControlStyleFullscreen]; //MPMovieControlStyleFullscreen //MPMovieControlStyleEmbedded
        //满屏
        [mpMoviePlayerController setFullscreen:YES];
        // 有助于减少延迟
        NSLog(@"%@",@"设置了全屏了");
        [mpMoviePlayerController prepareToPlay];
        NSLog(@"%@",@"视屏准备好了");
        // Register that the load state changed (movie is ready)
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(moviePlayerLoadStateChanged:) 
                                                     name:MPMoviePlayerLoadStateDidChangeNotification 
                                                   object:nil];
        [mpMoviePlayerController play];
    } 
    else 
    { 
        // Play the movie For 3.1.x devices 
        [mpMoviePlayerController play];
    } 
    
    // Register to receive a notification when the movie has finished playing.
    //注册的通知 当播放完成或者点击done时执行
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(moviePlayBackDidFinish:) 
                                                 name:MPMoviePlayerPlaybackDidFinishNotification 
                                               object:nil]; 
} 

//下面三个方法系统自动调用  用于视图旋转后取消原来的那个视图上的控制栏

- (BOOL)prefersStatusBarHidden
{
    
    return isHiddenStatus;
}
- (void)showStatusBar

{
    
    isHiddenStatus = NO;
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        
        [self prefersStatusBarHidden];
        
        [self setNeedsStatusBarAppearanceUpdate];
        
    }
    
}

- (void)hideStatusBar

{
    
    isHiddenStatus = YES;
    
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        
        [self prefersStatusBarHidden];
        
        [self setNeedsStatusBarAppearanceUpdate];
        
    }
    
}

- (void)dealloc
{
    [self showStatusBar];
    [mpMoviePlayerController release];
    [movieURL release]; 
    [loadingAni release]; 
    [label release];
    [super dealloc]; 
} 

@end
