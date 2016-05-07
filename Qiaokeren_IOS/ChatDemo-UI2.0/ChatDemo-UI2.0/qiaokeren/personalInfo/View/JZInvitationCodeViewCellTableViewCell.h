//
//  JZInvitationCodeViewCellTableViewCell.h
//  Text01
//
//  Created by apple on 15-1-25.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JZInviteSelectData.h"
@interface JZInvitationCodeViewCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel* invitationCode;
@property (weak, nonatomic) IBOutlet UILabel* showState;
@property (weak, nonatomic) IBOutlet UILabel* user;
@property (weak, nonatomic) IBOutlet UILabel* userInfo;
@property(nonatomic,strong)JZInviteSelectData* inseInfo;
@end
