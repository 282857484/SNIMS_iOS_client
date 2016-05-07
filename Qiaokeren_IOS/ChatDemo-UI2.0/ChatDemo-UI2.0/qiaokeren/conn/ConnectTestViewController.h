#import <UIKit/UIKit.h>
#import "AsyncSocket.h"
//#import "ConnectToServerTCPDelegate.h"
#import "NetUnit.h"
#import "JZDataHandle.h"


@interface ConnectTestViewController : UIViewController<JZDataHandleDelegate> {
@public

//    JZDataHandle * jzDataHandle;
    
}
//@property (nonatomic, strong)JZDataHandle * jzDataHandle;
// 处理接收到的信息
- (void)dealLabel:(NetUnit*)nUnit;




@end
