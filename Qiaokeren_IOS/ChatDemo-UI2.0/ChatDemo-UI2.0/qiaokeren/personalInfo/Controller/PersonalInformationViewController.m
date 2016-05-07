//
//  SecondViewController.m
//  Text01
//
//  Created by 杨珺舟 on 15-1-19.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonalInformationViewController.h"
#import "UserSeletData.h"
#import "JZDialogViewController.h"
#import "JZgetQUserInfo_c.h"
#import "JZgetQUserInfo_s.h"
#import "UtilsAll.h"
#import "QiaokerenApplication.h"
#import "UIImageView+DispatchLoad.h"
#import "ASIFormDataRequest.h"
#import "SEiOSUploadFileDeal.h"
static NSString* titleLablecontents;
static long count;
static NSString* detailTextLabelcontents;
#define ORIGINAL_MAX_WIDTH 640.0f
@interface PersonalInformationViewController() <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate, iOSUploadFileCallBack, JZDataHandleDelegate>

@end
static id instance1 = nil;
@implementation PersonalInformationViewController
extern const CFStringRef kUTTypeImage                                __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
extern const CFStringRef kUTTypeJPEG                                 __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
extern const CFStringRef kUTTypeJPEG2000                             __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
extern const CFStringRef kUTTypeTIFF                                 __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
extern const CFStringRef kUTTypePICT                                 __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
extern const CFStringRef kUTTypeGIF                                  __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
extern const CFStringRef kUTTypePNG                                  __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
extern const CFStringRef kUTTypeQuickTimeImage                       __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
extern const CFStringRef kUTTypeAppleICNS                            __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
extern const CFStringRef kUTTypeBMP                                  __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
extern const CFStringRef kUTTypeICO                                  __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
extern const CFStringRef kUTTypeRawImage                             __OSX_AVAILABLE_STARTING(__MAC_10_10,__IPHONE_8_0);
extern const CFStringRef kUTTypeScalableVectorGraphics               __OSX_AVAILABLE_STARTING(__MAC_10_10,__IPHONE_8_0);
extern const CFStringRef kUTTypeAudiovisualContent                   __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
extern const CFStringRef kUTTypeMovie                                __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
extern const CFStringRef kUTTypeVideo                                __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
extern const CFStringRef kUTTypeAudio                                __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
extern const CFStringRef kUTTypeQuickTimeMovie                       __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
extern const CFStringRef kUTTypeMPEG                                 __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
extern const CFStringRef kUTTypeMPEG2Video                           __OSX_AVAILABLE_STARTING(__MAC_10_10,__IPHONE_8_0);
extern const CFStringRef kUTTypeMPEG2TransportStream                 __OSX_AVAILABLE_STARTING(__MAC_10_10,__IPHONE_8_0);
extern const CFStringRef kUTTypeMP3                                  __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
extern const CFStringRef kUTTypeMPEG4                                __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
extern const CFStringRef kUTTypeMPEG4Audio                           __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
extern const CFStringRef kUTTypeAppleProtectedMPEG4Audio             __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);
extern const CFStringRef kUTTypeAppleProtectedMPEG4Video             __OSX_AVAILABLE_STARTING(__MAC_10_10,__IPHONE_8_0);
extern const CFStringRef kUTTypeAVIMovie                             __OSX_AVAILABLE_STARTING(__MAC_10_10,__IPHONE_8_0);
extern const CFStringRef kUTTypeAudioInterchangeFileFormat           __OSX_AVAILABLE_STARTING(__MAC_10_10,__IPHONE_8_0);
extern const CFStringRef kUTTypeWaveformAudio                        __OSX_AVAILABLE_STARTING(__MAC_10_10,__IPHONE_8_0);
extern const CFStringRef kUTTypeMIDIAudio                            __OSX_AVAILABLE_STARTING(__MAC_10_10,__IPHONE_8_0);
#pragma mark - Audiovisual content types

NSMutableArray* personalInformation ;
UserSeletData *personalInfo;
UIImageView *portraitImageView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    return self;
    
}

+(id)instance1
{
    if (!instance1) {
        instance1 = [[PersonalInformationViewController alloc] initWithNibName:@"PersonalInformationViewController" bundle:[NSBundle mainBundle]];
        return instance1;
    }
    return instance1;
}

+(NSString*)titleLablecontents{
    return titleLablecontents;
}
+(void) settitleLablecontents:(NSString *)newtitleLablecontents{
    if (![titleLablecontents isEqualToString:newtitleLablecontents]) {
        titleLablecontents = newtitleLablecontents;
    }
}
+(NSString*)detailTextLabelcontents{
    return detailTextLabelcontents;
}
+(void) setdetailTextLabelcontents:(NSString *)newdetailTextLabelcontents{
    if (![detailTextLabelcontents isEqualToString:newdetailTextLabelcontents]) {
        detailTextLabelcontents = newdetailTextLabelcontents;
    }
}



+(long)countContents{
    return count;
}
+(void) setCountContents:(long)newCountContents{
    if (!(count == newCountContents)) {
        count = newCountContents;
    }
}
#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self initNetworkingDic];
    NSString*time = [UtilsAll getFormatTime];
    //[QiaokerenApplication getAccountNumber]
    JZgetQUserInfo_c*getQuserInfo = [JZgetQUserInfo_c Jz_initialize];
    [getQuserInfo
     initWithInfo:@"请求个人信息列表"
     UserID:@"0"
     ThisUserID:[QiaokerenApplication getAccountNumber]
     UpUserID:@"0"
     Phone:@"0"
     WeChatID:@"0"
     Level:@"0"
     UploadTime:time
     PageSize:@"100"
     PageIndex:@"0"];
    NSDictionary * dictionary = [getQuserInfo toDictionary];
    JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
    jzDataHandle.JZDatadelegate = self;
    [jzDataHandle sendObject:dictionary time:time  protocol:1 label:@"PersonalInformationViewController"];
    [self showHudInView:self.view hint:@"正在刷新列表..."];

    //获取Documents文件夹目录
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [path objectAtIndex:0];
    //指定新建文件夹路径
    NSString *imageDocPath = [documentPath stringByAppendingPathComponent:@"ImageFile"];
    //创建ImageFile文件夹
    [[NSFileManager defaultManager] createDirectoryAtPath:imageDocPath withIntermediateDirectories:YES attributes:nil error:nil];
    
    //保存图片的路径
    self.imagePath = [imageDocPath stringByAppendingPathComponent:@"userInfoHead.png"];
    
    
 }


-(void)dealLabel:(NetUnit *)nUnit{
    [self hideHud];
    if ([nUnit->cLabel isEqualToString:@"PersonalInformationViewController"]) {
        NSString* json = nUnit->receiveString;
//        NSLog(@"------------------%@",json);
        NSDictionary*dictionary = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:  NSUTF8StringEncoding ] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0 ];
        
        if ([[dictionary objectForKey:@"Mark"]isEqualToString:@"1"]) {
            
            NSString *str = [dictionary objectForKey:@"UserSelectDataList"];
            if(str.length < 20){
                return;
            }
            
            NSDictionary*dic = [[NSJSONSerialization JSONObjectWithData:[[dictionary objectForKey:@"UserSelectDataList"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil] objectAtIndex:0];
            NSString* sex ;
            if ([[dic objectForKey:@"qsex"] isEqualToString:@"1"]) {
                sex=@"男";
            }else{
                sex=@"女";
            }
         personalInfo = [UserSeletData instance2];
        [personalInfo initWithInfo:@"成功了吧"
                           quserid:[[NSString alloc] initWithFormat:@"%@",[dic objectForKey:@"quserid"]]
                         qhigherid:[dic objectForKey:@"qhigherid"]
                            qphone:[[NSString alloc] initWithFormat:@"%@",[dic objectForKey:@"qphone"]]
                         qpassword:[dic objectForKey:@"qpassword"]
                           qcardid:[dic objectForKey:@"qcardid"]
                         qusername:[dic objectForKey:@"qusername"]
                         qrealname:[dic objectForKey:@"qrealname"]
                              qtel:[dic objectForKey:@"qtel"]
                            qemail:[dic objectForKey:@"qemail"]
                              qsex:sex
                              qage:[dic objectForKey:@"qage"]
                      qshouquannum:[dic objectForKey:@"qshouquannum"]
                           qweixin:[dic objectForKey:@"qweixin"]
                               qqq:[dic objectForKey:@"qqq"]
                        qinvitenum:[dic objectForKey:@"qinvitenum"]
                         qwangwang:[dic objectForKey:@"qwangwang"]
                           qtaobao:[dic objectForKey:@"qtaobao"]
                        qtaobaourl:[dic objectForKey:@"qtaobaourl"]
                            qstate:[dic objectForKey:@"qstate"]
                       qformattime:[dic objectForKey:@"qformattime"]
                            qlevel:[dic objectForKey:@"qlevel"]
                qvideoaccessllevel:[dic objectForKey:@"qvideoaccessllevel"]
                      qhonestlevel:[dic objectForKey:@"qhonestlevel"]
                       qreceivemsg:[dic objectForKey:@"qreceivemsg"]
                 q_group_direct_id:[dic objectForKey:@"q_group_direct_id"]
                 q_group_higher_id:[dic objectForKey:@"q_group_higher_id"]
                 q_group_public_id:[dic objectForKey:@"q_group_public_id"]
                   q_group_same_id:[dic objectForKey:@"q_group_same_id"]
                         qgoodsnum:[dic objectForKey:@"qgoodsnum"]
                     blackloggoods:[dic objectForKey:@"blackloggoods"]
                     deliverygoods:[dic objectForKey:@"deliverygoods"]];
              [self.tableView reloadData];
        }else{
            UIAlertView * myAlert = [[UIAlertView alloc]initWithTitle:@"提示:" message:@"获取信息列表失败，请检查网络状态" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [myAlert show];

        }
        
        }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    //有几个表单
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{    //表单中有多少项
    // Return the number of rows in the section.
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 3;
            break;
        case 2:
            return 9;
            break;
    }
    return 10;
    }

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //定义一个识别码
    //重复利用缓存池中存在的对象
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //if以内是新造，if以下算是翻新。
//    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] ;
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
//    }
    switch ([indexPath section]){
        case 0:
        {
            [cell setAccessoryType:UITableViewCellAccessoryNone];
            NSString *iid = [QiaokerenApplication getAccountNumber];
            NSString *url = [QiaokerenApplication getTouXiangUrlUserID:iid];
            UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 40, 40)];
            [cell.contentView addSubview:imageview];
            imageview.image = [UIImage imageNamed:@"defaultuserhaed.png"];
            [imageview setImageFromUrl:url
                                 completion:^(void) {}];
//            imageview.layer.masksToBounds =YES;
//            imageview.layer.cornerRadius =30;
            portraitImageView = imageview;
//            cell.textLabel.text = @"俏可人ID";
            cell.detailTextLabel.text=[personalInfo quserid];
            return cell;
        }
//            break;
         case 1:
            [cell setAccessoryType:UITableViewCellAccessoryNone];
            switch ([indexPath row]) {
//               case 0:
//                   cell.textLabel.text = @"俏可人ID";
//                   cell.detailTextLabel.text=[personalInfo quserid];
//                   return cell;
//                   break;
               case 0:
                   cell.textLabel.text=@"手机号码";
                   cell.detailTextLabel.text=[personalInfo qphone];
                   return cell;
                   break;
               case 1:
                    cell.textLabel.text=@"授权号";
                    cell.detailTextLabel.text=[personalInfo qshouquannum];
                    return cell;
                    break;
               case 2:
                    cell.textLabel.text=@"性别" ;
                    cell.detailTextLabel.text=[personalInfo qsex];
                    return cell;
                    break;
                 default:
                 return cell;
            break;
              }
        case 2:
            switch ([indexPath row]) {
                
                case 0:
                    cell.textLabel.text = @"昵称";
                    cell.detailTextLabel.text=[personalInfo qusername];
                    return cell;
                    break;
                case 1:
                    cell.textLabel.text=@"真实姓名";
                    cell.detailTextLabel.text = [personalInfo qrealname];
                    return cell;
                    break;
                case 2:
                    cell.textLabel.text = @"身份证";
                    cell.detailTextLabel.text=[personalInfo qcardid];
                    return cell;
                    break;
                case 3:
                    cell.textLabel.text = @"微信号";
                    cell.detailTextLabel.text = [personalInfo qweixin];
                    return cell;
                    break;
                case 4:
                    cell.textLabel.text = @"QQ";
                    cell.detailTextLabel.text = [personalInfo qqq];
                    return cell;
                    break;
                case 5:
                    cell.textLabel.text = @"旺旺号";
                    cell.detailTextLabel.text = [personalInfo qwangwang];
                    return cell;
                    break;
                case 6:
                    cell.textLabel.text = @"邮箱";
                    cell.detailTextLabel.text = [personalInfo qemail];
                    return cell;
                    break;
                case 7:
                    cell.textLabel.text = @"年龄";
                    cell.detailTextLabel.text=[personalInfo qage];
                    return cell;
                    break;
                 case 8:
                    cell.textLabel.text = @"联系电话";
                    cell.detailTextLabel.text = [personalInfo qtel];
                    return cell;
                    break;
                    
                default:
                    break;
            }
            
            
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tabelView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40.0f;
}



//每个section底部标题高度（实现这个代理方法后前面 sectionHeaderHeight 设定的高度无效）
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

//每个section头部标题高度（实现这个代理方法后前面 sectionFooterHeight 设定的高度无效）
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

#pragma mark - Table view delegate
//应用委托 当选择一个列表项时收到通知 执行以下方法

//选中之前执行,判断选中的行（阻止选中二行）
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([indexPath section] == 1)
        return nil;
    return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
	//sudo malloc_history 50127 0x6d564f0
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([indexPath section] ==0) {
        NSLog(@"hhhasdj");
        [self editPortrait];
        
    }else
       {
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    [PersonalInformationViewController settitleLablecontents:cell.textLabel.text];
    [PersonalInformationViewController setCountContents:indexPath.row];
    [PersonalInformationViewController setdetailTextLabelcontents:cell.detailTextLabel.text];
    JZDialogViewController* ViewController = [JZDialogViewController instance];
    ViewController.textView.text = cell.detailTextLabel.text ;
    [self.view addSubview:ViewController.view];
    
    
    }
    
}


- (void)editPortrait {
    UIActionSheet *myActionSheet = [[UIActionSheet alloc]
                                    initWithTitle:@"更换头像"
                                    delegate:self
                                    cancelButtonTitle:@"取消"
                                    destructiveButtonTitle:nil
                                    otherButtonTitles: @"从相册选择", @"拍照",nil];
    [myActionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            //从相册选择
            [self LocalPhoto];
            
//            NSLog(@"你好  相册");
            break;
        case 1:
            //拍照
            [self takePhoto];
            
//            NSLog(@"你好  拍照");
            break;
        default:
            break;
    }
}


//拍照
-(void)takePhoto{
    //资源类型为照相机
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    //判断是否有相机
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        //设置拍照后的图片可被编辑
        picker.allowsEditing = YES;
        //资源类型为照相机
        picker.sourceType = sourceType;
//        [self presentModalViewController:picker animated:YES];
        [self presentViewController:picker animated:YES completion:nil];

    }else {
        NSLog(@"该设备无摄像头");
    }
}


//从相册选择
-(void)LocalPhoto{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    //资源类型为图片库
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = YES;
//    [self presentModalViewController:picker animated:YES];
    [self presentViewController:picker animated:YES completion:nil];

}


#pragma Delegate method UIImagePickerControllerDelegate
//图像选取器的委托方法，选完图片后回调该方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    
    //当图片不为空时显示图片并保存图片
    if (image != nil) {
        
        //图片显示在界面上
        portraitImageView.image = image;
        //以下是保存文件到沙盒路径下
        NSMutableDictionary * dic =[NSMutableDictionary dictionaryWithCapacity:3];
        NSLog(@"$$$upload value:%@ key:%@",[personalInfo quserid],[QiaokerenApplication getTouxiang]);
        [dic setValue:[personalInfo quserid] forKey:[QiaokerenApplication getTouxiang]];
        SEiOSUploadFileDeal *uploadHandler = [[SEiOSUploadFileDeal alloc] init];
        uploadHandler.resultDelegate = self;
        [uploadHandler sendImage:image compressionQuality:0.0001 sendURL:[NSURL URLWithString:[QiaokerenApplication getUploadtouxiangPhotoUrl]] saveFilePath:self.imagePath postKeyValue:dic];
        
    }
    
    //关闭相册界面
    [picker dismissModalViewControllerAnimated:YES];
}


#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
}

#pragma mark camera utility
- (BOOL) isCameraAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL) isRearCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}

- (BOOL) isFrontCameraAvailable {
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}

- (BOOL) doesCameraSupportTakingPhotos {
    return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL) isPhotoLibraryAvailable{
    return [UIImagePickerController isSourceTypeAvailable:
            UIImagePickerControllerSourceTypePhotoLibrary];
}
- (BOOL) canUserPickVideosFromPhotoLibrary{
    return [self
            cameraSupportsMedia:(__bridge NSString *)kUTTypeMovie sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}
- (BOOL) canUserPickPhotosFromPhotoLibrary{
    return [self
            cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (BOOL) cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType{
    __block BOOL result = NO;
    if ([paramMediaType length] == 0) {
        return NO;
    }
    NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:paramMediaType]){
            result = YES;
            *stop= YES;
        }
    }];
    return result;
}

#pragma mark image scale utility
- (UIImage *)imageByScalingToMaxSize:(UIImage *)sourceImage {
    if (sourceImage.size.width < ORIGINAL_MAX_WIDTH) return sourceImage;
    CGFloat btWidth = 0.0f;
    CGFloat btHeight = 0.0f;
    if (sourceImage.size.width > sourceImage.size.height) {
        btHeight = ORIGINAL_MAX_WIDTH;
        btWidth = sourceImage.size.width * (ORIGINAL_MAX_WIDTH / sourceImage.size.height);
    } else {
        btWidth = ORIGINAL_MAX_WIDTH;
        btHeight = sourceImage.size.height * (ORIGINAL_MAX_WIDTH / sourceImage.size.width);
    }
    CGSize targetSize = CGSizeMake(btWidth, btHeight);
    return [self imageByScalingAndCroppingForSourceImage:sourceImage targetSize:targetSize];
}

- (UIImage *)imageByScalingAndCroppingForSourceImage:(UIImage *)sourceImage targetSize:(CGSize)targetSize {
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else
            if (widthFactor < heightFactor)
            {
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
            }
    }
    UIGraphicsBeginImageContext(targetSize); // this will crop
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil) NSLog(@"could not scale image");
    
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark portraitImageView getter

- (void) uploadFileCallBack:(NSString*)sendMessage{
    [self showHint:sendMessage];
}

@end
