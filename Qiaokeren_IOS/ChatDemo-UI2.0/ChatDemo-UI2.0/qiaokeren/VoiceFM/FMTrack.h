//
//  FMTrack.h
//  ChatDemo-UI2.0
//
//  Created by apple on 15/7/17.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DOUAudioFile.h"

@interface FMTrack : NSObject <DOUAudioFile>

@property (nonatomic, strong) NSURL *audioFileURL;

@end
