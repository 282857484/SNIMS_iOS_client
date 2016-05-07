//
//  JZInvitationCodeViewController.h
//  Text01
//
//  Created by apple on 15-1-25.
//  Copyright (c) 2015年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JZInvitationCodeViewCellTableViewCell.h"
#import "ConnectTestViewController.h"

@interface JZInvitationCodeViewController : ConnectTestViewController<UITableViewDelegate, UITableViewDataSource>{
    JZInvitationCodeViewCellTableViewCell* tabcell;
   
    NSMutableArray *data;
    // referring to our xib-based UITableViewCell ('IndividualSubviewsBasedApplicationCell')
    UINib *cellNib;
}
@property (strong, nonatomic) IBOutlet JZInvitationCodeViewCellTableViewCell *tabcell;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) UINib *cellNib;
@property (nonatomic, retain) NSMutableArray *data;

@end
