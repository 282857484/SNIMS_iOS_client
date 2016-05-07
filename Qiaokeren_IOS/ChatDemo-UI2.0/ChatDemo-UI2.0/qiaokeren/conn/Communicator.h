//
//  Communicator.h
//  ChatDemo-UI2.0
//
//  Created by apple on 15/3/12.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Communicator : NSObject <NSStreamDelegate> {
@public
    
    NSString *host;
    int port;
}

- (void)setup;
- (void)open;
- (void)close;
- (void)stream:(NSStream *)stream handleEvent:(NSStreamEvent)event;
- (void)readIn:(NSString *)s;
- (void)writeOut:(NSString *)s;

@end
