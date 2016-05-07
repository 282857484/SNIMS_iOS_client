//
//  FMClassIntroduceCellTableViewCell.m
//  ChatDemo-UI2.0
//
//  Created by apple on 15/7/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "FMClassIntroduceCellTableViewCell.h"
#import "LessInfoSelectData.h"
#import "QiaokerenApplication.h"
#import "UIImageView+DispatchLoad.h"



#define KColor(r,g,b)  [UIColor colorWithHue:r/255.0 saturation:g/255.0 brightness:b/255.0 alpha:1]
#define kStatusTableViewCellControlSpacing 10//控件间距
#define kStatusTableViewCellBackgroundColor KColor(251,251,251)
#define kStatusGrayColor KColor(50,50,50)
#define kStatusLightGrayColor KColor(120,120,120)

#define kStatusTableViewCellAvatarWidth 40 //头像宽度
#define kStatusTableViewCellAvatarHeight kStatusTableViewCellAvatarWidth
#define kStatusTableViewCellUserNameFontSize 14
#define kStatusTableViewCellMbTypeWidth 13 //会员图标宽度
#define kStatusTableViewCellMbTypeHeight kStatusTableViewCellMbTypeWidth
#define kStatusTableViewCellCreateAtFontSize 12
#define kStatusTableViewCellSourceFontSize 12
#define kStatusTableViewCellTextFontSize 14

@interface FMClassIntroduceCellTableViewCell(){
    
    UIImageView * _avatar;//头像
    //    UIImageView * _mbType;//会员类型
    UILabel * _userName;
    UILabel * _creatrAt;
    UILabel * _source;
    UILabel * _text;
    
}

@end

@implementation FMClassIntroduceCellTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubview];
    }
    return self;
}

#pragma mark 初始化视图
- (void)initSubview{
    //头像控件
    _avatar = [[UIImageView alloc]init];
    [self addSubview:_avatar];
    
    //录音主题
    _userName = [[UILabel alloc]init];
    _userName.textColor = kStatusGrayColor;
    _userName.font = [UIFont systemFontOfSize:kStatusTableViewCellUserNameFontSize];
    [self addSubview:_userName];
    
    //    //会员类型
    //    _mbType = [[UIImageView alloc]init];
    //    [self addSubview:_mbType];
    
    //日期
    _creatrAt = [[UILabel alloc]init];
    _creatrAt.textColor = kStatusLightGrayColor;
    _creatrAt.font = [UIFont systemFontOfSize:kStatusTableViewCellCreateAtFontSize];
    [self addSubview:_creatrAt];
    
    //名称
    _source = [[UILabel alloc]init];
    _source.textColor = kStatusLightGrayColor;
    _source.font = [UIFont systemFontOfSize:kStatusTableViewCellSourceFontSize];
    [self addSubview:_source];
    
    //录音介绍
    _text = [[UILabel alloc]init];
    _text.textColor = kStatusGrayColor;
    _text.font = [UIFont systemFontOfSize:kStatusTableViewCellTextFontSize];
    _text.numberOfLines = 0;
    [self addSubview:_text];
    
}
//1）.对于单行文本数据的显示调用+ (UIFont *)systemFontOfSize:(CGFloat)fontSize;方法来得到文本宽度和高度。
//2）.对于多行文本数据的显示调用- (CGRect)boundingRectWithSize:(CGSize)size options:(NSStringDrawingOptions)options attributes:(NSDictionary *)attributes context:(NSStringDrawingContext *)context ;方法来得到文本宽度和高度；同时注意在此之前需要设置文本控件的numberOfLines属性为0。
#pragma mark 设置微博
- (void)setlessonSimepleIntroduceInfo:(LessInfoSelectData *)lessonInfo{
    
    CGFloat avatarX = 10,avatarY = 10;
    CGRect avatarRect = CGRectMake(avatarX, avatarY, kStatusTableViewCellAvatarWidth, kStatusTableViewCellAvatarHeight);
    // 加载头像
    NSString *urltouxiang = [QiaokerenApplication getTouXiangUrlUserID:lessonInfo.userid];
    _avatar.image = [UIImage imageNamed:@"defaultuserhaed.png"];
    [_avatar setImageFromUrl:urltouxiang
                  completion:^(void) {}];
    _avatar.frame = avatarRect;
    
    CGFloat userNameX = CGRectGetMaxX(_avatar.frame) + kStatusTableViewCellControlSpacing;
    CGFloat userNameY = avatarY;
    CGSize userNameSize = [lessonInfo.topic sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kStatusTableViewCellUserNameFontSize]}];
    CGRect userNameRect = CGRectMake(userNameX, userNameY, userNameSize.width, userNameSize.height);
    _userName.text = lessonInfo.topic;
    _userName.frame = userNameRect;
    
    //    CGFloat mbTypeX = CGRectGetMaxX(_userName.frame) + kStatusTableViewCellControlSpacing;
    //    CGFloat mbTypeY = avatarY;
    //    CGRect mbTypeRect = CGRectMake(mbTypeX, mbTypeY, kStatusTableViewCellMbTypeWidth, kStatusTableViewCellMbTypeHeight);
    //#warning 没有会员等级的标签的相应图片
    //    _mbType.image = [UIImage imageNamed:lessonInfo.userlevel];
    //    _mbType.frame = mbTypeRect;
    
    CGSize createAtSize = [lessonInfo.timestamp sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kStatusTableViewCellCreateAtFontSize]}];
    CGFloat createAtX = userNameX;
    CGFloat createAtY = CGRectGetMaxY(_avatar.frame) - createAtSize.height;
    CGRect createAtRect = CGRectMake(createAtX, createAtY, createAtSize.width, createAtSize.height);
    _creatrAt.text = lessonInfo.timestamp;
    _creatrAt.frame = createAtRect;
    
    CGSize sourceSize = [lessonInfo.username sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kStatusTableViewCellSourceFontSize]}];
    CGFloat sourceX = CGRectGetMaxX(_creatrAt.frame) + kStatusTableViewCellControlSpacing;
    CGFloat sourceY = createAtY;
    CGRect sourceRect = CGRectMake(sourceX, sourceY, sourceSize.width, sourceSize.height);
    _source.text = lessonInfo.username;
    _source.frame = sourceRect;
    
    CGFloat textX = avatarX;
    CGFloat textY = CGRectGetMaxY(_avatar.frame) + kStatusTableViewCellControlSpacing;
    CGFloat textWidth = self.frame.size.width - 2 * kStatusTableViewCellControlSpacing;
    CGSize textSize = [lessonInfo.introduce boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kStatusTableViewCellTextFontSize]} context:nil].size;
    CGRect textRect = CGRectMake(textX, textY, textSize.width, textSize.height);
    _text.text = lessonInfo.introduce;
    _text.frame = textRect;
    
    _height = CGRectGetMaxY(_text.frame) + kStatusTableViewCellControlSpacing;
    
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
