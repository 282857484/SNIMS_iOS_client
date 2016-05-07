//
//  JZInvitationCodeViewCellTableViewCell.m
//  Text01
//
//  Created by apple on 15-1-25.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import "JZInvitationCodeViewCellTableViewCell.h"

@implementation JZInvitationCodeViewCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // [self.backgroundColor
//    NSLog(@"%@",@"这里面执行了么");
    
}

-(void)setInseInfo:(JZInviteSelectData *)inseInfo{
//    NSLog(@"%@",@"cell执行了");

    self.invitationCode.text=inseInfo.qinvitenum;
    if ([inseInfo.qusestate isEqualToString:@"1"]) {
        self.showState.text=@"已使用";
        self.user.hidden=NO;
        self.userInfo.text=inseInfo.qbeinvitedid;
        self.userInfo.hidden=NO;
    }else{
        self.showState.text=@"未使用";
        self.user.hidden=YES;
        self.userInfo.hidden=YES;
 
    }
}

@end
