//
//  JZVideosTableViewController.h
//  Text01
//
//  Created by 杨珺舟 on 15-1-29.
//  Copyright (c) 2015年 Allen. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ConnectTestViewController.h"
#import "JZVideosTableViewCell.h"
#import "VedioSelectData.h"


@interface JZVideosTableViewController : ConnectTestViewController<UITableViewDelegate, UITableViewDataSource>
{
    JZVideosTableViewCell* tabcell;
    
    NSMutableArray *data;
    // referring to our xib-based UITableViewCell ('IndividualSubviewsBasedApplicationCell')
    UINib *cellNib;

}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet JZVideosTableViewCell *tabcell;
@property (nonatomic, retain) UINib *cellNib;
@property (nonatomic, retain) NSMutableArray *data;
@end
