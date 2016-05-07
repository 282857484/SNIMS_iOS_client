//
//  JZMoviePlayerViewController.h
//  video
//
//  Created by 杨珺舟 on 15-1-19.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
@interface JZMoviePlayerViewController : UIViewController
{
    MPMoviePlayerController *mpMoviePlayerController;
    NSURL *movieURL; //视频地址
    UIActivityIndicatorView *loadingAni; //加载动画
    UILabel *label; //加载提醒
}
@property (nonatomic,retain) NSURL *movieURL;
@property (nonatomic) BOOL isHiddenStatus;
//准备播放
- (void)readyPlayer;

@end
