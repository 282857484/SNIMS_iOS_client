//
//  NetUnit.h
//  ConnectTest
//
//  Created by apple on 15-1-27.
//
//

#import <Foundation/Foundation.h>
#import "AsyncSocket.h"

@interface NetUnit : NSObject
{
@public
    // packet tag
    long tag;
    // time
    NSString *lasttime;
    // protocol
    int p;
    // connect socket
    AsyncSocket *sock;
    // send string
    NSString *sendString;
    // receive string & connected string
    NSString *receiveString;
    // packet count
    long count;
    /*
     0-not status
     1-not connect
     2-connect
     3-sended & wait receive
     4-receiveing
     5-received
     */
    int status;
    NSString *cLabel;
    
    //****************
    NSData *imgData;
    NSString *fileName;
    long fileLength;
    int fileType;
    
}
@property long tag;
@property (atomic, retain)NSString * lasttime;
@property int p;
@property (atomic, retain)AsyncSocket * sock;
@property (atomic, retain)NSString *sendString;
@property (atomic, retain)NSString *receiveString;
@property long count;
@property int status;
@property (atomic, retain)NSString * cLabel;
@property (atomic, retain)NSData *imgData;
@property (atomic, retain)NSString *fileName;
@property long fileLength;
@property int fileType;

//-(void) OUTPUTTOSEE:(int)a;

@end
