
#import "ConnectTestViewController.h"
#import "QiaokerenApplication.h"



//  这里应该是各种监听事件的回调

@implementation ConnectTestViewController

//@synthesize label = _label;
//@synthesize jzDataHandle;

- (void)viewDidLoad
{
    [super viewDidLoad];
//    jzDataHandle = [JZDataHandle initdatahandle];
//    jzDataHandle.JZDatadelegate = self;
    
}

- (IBAction)send_some_shit:(id)sender{
//    self.changeLabel.text = @"this";
//    NSString * StringToSend = [NSString stringWithFormat:@"[{\"BillID\":\"0\",\"PageIndex\":\"0\",\"PageSize\":\"10\",\"SearchUpUserID\":\"0\",\"SearchUserID\":\"21\",\"UploadTime\":\"201501032335700\",\"UserID\":\"21\",\"p\":1015}]"];
//    NSThread * thread = [[NSThread alloc] initWithTarget:[ConnectToServerTCPDelegate alloc] selector:@selector(run:) object:StringToSend];
//    [thread start];
    NSString * x = @"abc";
    
    for (int count = 0; count < 10 ; count++ ) {
//        [JZDataHandle sendString:x time:x protocol:1 label:x];
        JZDataHandle * jzDataHandle = [JZDataHandle initdatahandle];
        jzDataHandle.JZDatadelegate = self;
        [jzDataHandle sendString:x time:x protocol:1 label:x];
    }
}



// 处理函数
- (void)dealLabel:(NetUnit*)nUnit{
//    if ([nUnit->cLabel isEqualToString:@"REG1"]) {
//        NSString * rs = nUnit->receiveString;
//        
//        //更新ui，解析json
//    }
    
}

+(NSData *) LongToNSData:(long long)data
{
    Byte *buf = (Byte*)malloc(8);
    for (int i=7; i>=0; i--) {
        buf[i] = data & 0x00000000000000ff;
        data = data >> 8;
    }
    
    NSData *result =[NSData dataWithBytes:buf length:8];
    return result;
}

//unsigned
+(uint32_t) NSDataToUInt:(NSData * )data
{
    unsigned char bytes[4];
    [data getBytes:bytes length:4];
    uint32_t n = (int)bytes[0] << 24;
    n |= (int)bytes[1] << 16;
    n |= (int)bytes[2] << 8;
    n |= (int)bytes[3];
    return n;
}

//十六進位字串轉bytes，可以設定size，padding在左邊
+(NSData *) hexStrToNSData:(NSString *)data withSize:(NSInteger)size
{
    long add = size*2 - data.length;
    
    if (add > 0) {
        NSString* tmp = [[NSString string] stringByPaddingToLength:add withString:@"0" startingAtIndex:0];
        data = [tmp stringByAppendingString:data];
    }
    
    return [self hexStrToNSData:data];
}

//十六進位字串轉bytes
+(NSData *) hexStrToNSData:(NSString *)hexStr
{
    NSMutableData* data = [NSMutableData data];
    int idx;
    for (idx = 0; idx+2 <= hexStr.length; idx+=2) {
        NSRange range = NSMakeRange(idx, 2);
        NSString* ch = [hexStr substringWithRange:range];
        NSScanner* scanner = [NSScanner scannerWithString:ch];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        [data appendBytes:&intValue length:1];
    }
    return data;
}

//bytes轉十六進位字串，不是base64哦，別搞混了
+(NSString *) NSDataToHexString:(NSData *)data
{
    if (data == nil) {
        return nil;
    }
    NSMutableString* hexString = [NSMutableString string];
    const unsigned char *p = [data bytes];
    for (int i=0; i < [data length]; i++) {
        [hexString appendFormat:@"%02x", *p++];
    }
    return hexString;
}

@end
