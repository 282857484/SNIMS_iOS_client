//
//  JZScrollview.h
//  ChatDemo-UI2.0
//
//  Created by 杨珺舟 on 15-7-13.
//  Copyright (c) 2015年 杨珺舟. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum
{
    JZScrollViewSelecttionTypeTap = 100,  //默认的为可点击模式
    JZScrollViewSelecttionTypeNone   //不可点击的
}JZScrollViewSelecttionType;

@protocol JZScrollViewDelegate <NSObject>

@optional
- (void)scrollViewDidClickedAtPage:(NSInteger)pageNumber;

@end


@interface JZScrollview : UIView <UIScrollViewDelegate>
{
    NSTimer *timer;
    NSArray *sourceArr;
}
@property(strong,nonatomic) UIScrollView *scrollView;
@property(strong,nonatomic) UIPageControl *pageControl;
@property(assign,nonatomic) JZScrollViewSelecttionType selectionType;
@property(assign,nonatomic) id <JZScrollViewDelegate> pageViewDelegate;
- (id)initPageViewWithFrame:(CGRect)frame views:(NSArray *)views;


@end
