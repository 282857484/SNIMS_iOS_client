//
//  JZDialogViewController.h
//  Text01
//
//  Created by 杨珺舟 on 15-1-21.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConnectTestViewController.h"
@interface JZDialogViewController : ConnectTestViewController<UIAlertViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
- (IBAction)doneButton:(id)sender;
- (IBAction)backButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *diaologView;
@property (strong, nonatomic) IBOutlet UIView *transparentView;
+(id) instance;
@end
