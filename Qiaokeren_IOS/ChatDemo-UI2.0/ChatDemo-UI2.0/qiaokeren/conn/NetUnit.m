//
//  NetUnit.m
//  ConnectTest
//
//  Created by apple on 15-1-27.
//
//

#import "NetUnit.h"

@implementation NetUnit

@synthesize tag;
@synthesize lasttime;
@synthesize p;
@synthesize sock;
@synthesize sendString;
@synthesize receiveString;
@synthesize count;
@synthesize status;
@synthesize cLabel;
@synthesize imgData;
@synthesize fileName;
@synthesize fileLength;
@synthesize fileType;


- (instancetype)init
{
    self = [super init];
    if (self) {
//        [self setTag:0];
        self.tag = 0;
        self.lasttime = @"";
        self.p = 0;
        self.sock = nil;
        self.sendString = @"";
        self.receiveString = @"";
        self.count = 0;
        self.status = 0;
        self.cLabel = @"";
        self.imgData = nil;
        self.fileName = @"";
        self.fileLength = 0;
        self.fileType = 1;
    }
    return self;
}
//-(void) OUTPUTTOSEE:(int)a
//{
//    NSLog(@"_________NETNUNIT-start__________",nil);
//    NSLog(@"tag: %ld",tag);
//    NSLog(@"lasttime %@",lasttime);
//    NSLog(@"p: %d",p);
//    NSLog(@"sock: %@",sock);
//    NSLog(@"sendString: %@",sendString);
//    NSLog(@"receiveString: %@",receiveString);
//    NSLog(@"count: %ld",count);
//    NSLog(@"status: %d",status);
//    NSLog(@"cLabel: %@",cLabel);
//    NSLog(@"cLabel: %@",imgData);
//    NSLog(@"cLabel: %@",fileName);
//    NSLog(@"cLabel: %ld",fileLength);
//    NSLog(@"cLabel: %d",fileType);
//    NSLog(@"_________NETNUNIT-end__________",nil);
//    
//}

@end
