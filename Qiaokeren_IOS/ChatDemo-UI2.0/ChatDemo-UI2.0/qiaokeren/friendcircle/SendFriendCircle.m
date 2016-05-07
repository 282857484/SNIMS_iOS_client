//
//  ViewController.m
//  TestIOS
//
//  Created by lenbol on 13-6-5.
//  Copyright (c) 2013年 lenbol. All rights reserved.
//
#import "SendFriendCircle.h"
#import "OrderDetailViewController.h"
#import "DBImageView.h"
#import "JZgetBillInfo_c.h"
#import "QiaokerenApplication.h"
#import "UtilsAll.h"
#import "FriendsCircleSelectData.h"
#import "JZgetFriendsCircle_C.h"
#import "UIImageView+DispatchLoad.h"
#import "UIImageView+DispatchLoad.h"
#import "UIImageView+WebCache.h"
#import "MJPhotoBrowser.h"
#import "MJPhoto.h"
@interface SendFriendCircle ()<UIActionSheetDelegate>

@end

@implementation SendFriendCircle
@synthesize tvCell;
@synthesize data;
@synthesize sharephoto1;
//@synthesize jzDataHandle;
long shareIndexRow = -1;
NSMutableArray *arrayArrays;//图片的二级数组：存放每个tableview中的photoArray
int WidthCell = 0;
- (void)viewDidLoad
{
    self.title = @"编辑朋友圈";
    
    [self showHint:@"点击可分享图文到朋友圈"];
    [super viewDidLoad];
    data = [NSMutableArray array];
    arrayArrays = [NSMutableArray array];
    WidthCell = self.view.frame.size.width;
    //    [self initNetworkingDic];
    //    jzDataHandle = [JZDataHandle initdatahandle];
    //    jzDataHandle.JZDatadelegate = self;
    [self sendFriendCircleMsg];
    [self showHudInView:self.view hint:@"正在加载..."];
    
}

-(void)sendFriendCircleMsg{
    JZgetFriendsCircle_C *li = [JZgetFriendsCircle_C Jz_initialize];
    [li initWithInfo:@"JZgetFriendsCircle_C" UserID:[QiaokerenApplication getAccountNumber] UploadTime:[UtilsAll getFormatTime] PageSize:@"1000" PageIndex:@"0"];
    NSDictionary *nsdic = [li toDictionary];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:nsdic time:@"2015" protocol:1823 label:@"JZgetFriendsCircle_C"];
}

-(void ) viewDidUnload
{
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
    static NSString *CustomCellIdentifier = @"CustomFriendCircleCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier];
    if(cell ==nil)
    {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"FriendCircleCell" owner:self options:nil];
        if([nib count]>0)
        {
            cell = self.tvCell;
        }
        else{
            NSLog(@"fail load nib");
        }
    }
    NSUInteger row = [indexPath row];
    
    FriendsCircleSelectData *circle = [data objectAtIndex:row];
    
    UILabel *labelAmount = (UILabel *)[cell viewWithTag:kFriendsContentValueTag];
    UIImageView *imageview1 = (UIImageView *)[cell viewWithTag:kFriendsImage1ValueTag];
    UIImageView *imageview2 = (UIImageView *)[cell viewWithTag:kFriendsImage2ValueTag];
    UIImageView *imageview3 = (UIImageView *)[cell viewWithTag:kFriendsImage3ValueTag];
    imageview1.hidden = YES;
    imageview2.hidden = YES;
    imageview3.hidden = YES;
    NSString *contentStr = circle.fccontent;
    labelAmount.text = contentStr;
    [labelAmount setNumberOfLines:0];
    labelAmount.lineBreakMode = NSLineBreakByWordWrapping;
    labelAmount.font = [UIFont systemFontOfSize:13];
    //    UIFont *font = [UIFont fontWithName:@"Arial" size:13];
    //设置最大宽度，高度不限/////000000
    CGSize size = CGSizeMake(253, MAXFLOAT);
    CGSize labelsize = [contentStr sizeWithFont:labelAmount.font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    [labelAmount setFrame:CGRectMake(5, 5,WidthCell - 10, labelsize.height)];
    
    int ImgY = labelsize.height+10;
    
    NSString* photo = circle.photo;
    
    if(![photo isEqualToString:@"0"]){
        
        NSArray* photosArray2 = [photo componentsSeparatedByString: @"#"];
        NSMutableArray *photosArray = [NSMutableArray arrayWithArray:photosArray2];
        [photosArray removeObjectAtIndex:[photosArray count]-1];
        [arrayArrays insertObject:photosArray atIndex:row];
        
        long count = [photosArray count];
        if(count > 0){
            NSString* photo1 = [photosArray objectAtIndex:0];
            if(photo1){
                imageview1.hidden = NO;
                [imageview1 setFrame:CGRectMake(5, ImgY,60, 60)];
                //                NSLog(@"photo1 = %@",photo1);
                imageview1.tag = 0+10000;
                NSString *str =  [[NSString alloc] initWithFormat:@"%lu",(unsigned long)row];
                imageview1.restorationIdentifier = str;
                imageview1.userInteractionEnabled = YES;
                // 内容模式
                imageview1.clipsToBounds = YES;
                imageview1.contentMode = UIViewContentModeScaleAspectFill;
                
                [imageview1 setImageWithURL: [NSURL URLWithString: photo1] placeholderImage: [UIImage imageNamed:@"z_logindefault.png"] ];
                [imageview1 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showImgFromNetInCircle:)] ];
            }
        }
        if(count > 1){
            NSString* photo2 = [photosArray objectAtIndex:1];
            if(photo2){
                imageview2.hidden = NO;
                [imageview2 setFrame:CGRectMake(5+60+10, ImgY,60, 60)];
                //                NSLog(@"photo2 = %@",photo2);
                imageview2.tag = 1+10000;
                NSString *str =  [[NSString alloc] initWithFormat:@"%lu",(unsigned long)row];
                imageview2.restorationIdentifier = str;
                imageview2.userInteractionEnabled = YES;
                // 内容模式
                imageview2.clipsToBounds = YES;
                imageview2.contentMode = UIViewContentModeScaleAspectFill;
                
                [imageview2 setImageWithURL: [NSURL URLWithString: photo2] placeholderImage: [UIImage imageNamed:@"z_logindefault.png"] ];
                [imageview2 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showImgFromNetInCircle:)] ];
            }
        }
        if(count > 2){
            NSString* photo3 = [photosArray objectAtIndex:2];
            
            if(photo3){
                imageview3.hidden = NO;
                [imageview3 setFrame:CGRectMake(5+60+60+10, ImgY,60, 60)];
                //                NSLog(@"photo3 = %@",photo3);
                imageview3.tag = 2+10000;
                NSString *str =  [[NSString alloc] initWithFormat:@"%lu",(unsigned long)row];
                imageview3.restorationIdentifier = str;
                imageview3.userInteractionEnabled = YES;
                // 内容模式
                imageview3.clipsToBounds = YES;
                imageview3.contentMode = UIViewContentModeScaleAspectFill;
                
                [imageview3 setImageWithURL: [NSURL URLWithString: photo3] placeholderImage: [UIImage imageNamed:@"z_logindefault.png"] ];
                [imageview3 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showImgFromNetInCircle:)] ];
            }
        }
    }
    
    return cell;
}

-(void)showImgFromNetInCircle:(UITapGestureRecognizer *)imageTap
{
    NSInteger abc = [imageTap.view.restorationIdentifier integerValue];
    NSMutableArray *photosArray = [arrayArrays objectAtIndex:abc];
    // 1.封装图片数据
    NSMutableArray *photos = [NSMutableArray arrayWithCapacity: [photosArray count] ];
    for (int i = 0; i < [photosArray count]; i++) {
        // 替换为中等尺寸图片
        
        NSString * getImageStrUrl = [NSString stringWithFormat:@"%@", [photosArray objectAtIndex:i] ];
        MJPhoto *photo = [[MJPhoto alloc] init];
        photo.url = [NSURL URLWithString: getImageStrUrl ]; // 图片路径
        UIImageView * imageView = (UIImageView *)[self.view viewWithTag: imageTap.view.tag ];
        photo.srcImageView = imageView;
        [photos addObject:photo];
    }
    
    // 2.显示相册
    MJPhotoBrowser *browser = [[MJPhotoBrowser alloc] init];
    browser.currentPhotoIndex = imageTap.view.tag - 10000; // 弹出相册时显示的第一张图片是？
    browser.photos = photos; // 设置所有的图片
    [browser show];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    shareIndexRow = indexPath.row;
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"分享内容我的朋友圈"
                                  delegate:self
                                  cancelButtonTitle:@"取消" destructiveButtonTitle:@"立即分享" otherButtonTitles: nil];
    [actionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet*)actionSheet
didDismissWithButtonIndex:(NSInteger)buttonIndex{
    
    if(buttonIndex == [actionSheet cancelButtonIndex]){
        return;
    }
    if(shareIndexRow == -1){
        return;
    }
    //开始分享
    if(buttonIndex == 0){
        //要分享的信息
        FriendsCircleSelectData *friend = [data objectAtIndex:shareIndexRow];
        [self share:friend];
    }
}


-(void)share:(FriendsCircleSelectData*)friend{
    //复制字符串到剪贴板
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = friend.fccontent;
    
    [self showHint:@"内容已复制，长按可粘贴"];
    [self showHudInView:self.view hint:@"正在下载..."];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // 处理耗时操作的代码块...
        NSString * photo = friend.photo;
        if (![photo isEqualToString:@"0"]) {
            
            NSArray* photosArray3 = [photo componentsSeparatedByString: @"#"];
            NSMutableArray *array = [NSMutableArray arrayWithArray:photosArray3];
            [array removeObjectAtIndex:[array count]-1];
            NSUInteger photoCount = [array count];
            for (int i = 0; i < photoCount; i++) {
                //                NSLog(@"image path : %@",[array objectAtIndex:i]);
                UIImage * image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[array objectAtIndex:i]]]];
                UIImageWriteToSavedPhotosAlbum(image, self, @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:), nil);
            }
            
        }
        //通知主线程刷新//回调或者说是通知主线程刷新，
        dispatch_async(dispatch_get_main_queue(), ^{
            [self showHint:@"下载完成，打开朋友圈即可分享"];
            [self hideHud];
        });
        
    });
    
}

- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSString *message = @"呵呵";
    if (!error) {
        message = @"成功保存到相册";
    }else
    {
        message = [error description];
    }
    NSLog(@"message is %@",message);
}

/***********************************************************************/

// 处理函数
- (void)dealLabel:(NetUnit*)nUnit{
    if ([nUnit->cLabel isEqualToString:@"JZgetFriendsCircle_C"]) {
        [self hideHud];
        NSString* json = nUnit->receiveString;
        
        NSDictionary*dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:  NSUTF8StringEncoding ] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0 ];
        
        if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"1"]) {
            
            NSDictionary*dic;
            
            //判断是否能够组成字典
            NSString *str = [dictionary objectForKey:@"FriendsCircleList"];
            if(str.length < 20){
                return;
            }
            NSArray* array = [NSJSONSerialization JSONObjectWithData:[[dictionary objectForKey:@"FriendsCircleList"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil] ;
            //            NSLog(@"%lu",(unsigned long)[array count]);
            for (int i=0; i<[array count]; i++) {
                dic = [array  objectAtIndex:i];
                FriendsCircleSelectData *circle = [FriendsCircleSelectData Jz_initialize];
                [circle initWithInfo:@"friendscircle"
                                fcid:[UtilsAll TOString:[dic objectForKey:@"fcid"]]
                              userid:[UtilsAll TOString:[dic objectForKey:@"userid"]] timestamp:[dic objectForKey:@"timestamp"]
                               level:[dic objectForKey:@"level"] fccontent:[dic objectForKey:@"fccontent"]
                               photo:[dic objectForKey:@"photo"] time:[dic objectForKey:@"time"]];
                [data addObject:circle];
                
                //                NSLog(@"count bill 123 = %d",[data count]);
            }
            
            [_tableview reloadData];
            
        }
        //获取失败
        else{
            
        }
        
    }
    
}

@end
