//
//  accept_c.m
//  datacalss
//
//  Created by 杨珺舟 on 15-1-22.
//
//

#import "JZaccept_c.h"
#import "JZ_agreement_c.h"
@implementation JZaccept_c

@synthesize  p;
@synthesize  Billid;
@synthesize  Userid;
@synthesize  UploadTime;
@synthesize IsAccept;
+(JZaccept_c*)Jz_initialize{
    JZaccept_c* a = [[super alloc]init];
    [a Jz_setValue];
    return a;
}
-(void)Jz_setValue{
    JZ_agreement_c* a=[JZ_agreement_c Jz_initialize];
    [self setP:[a  accept_C]];


}
-(void)initWithInfo:(NSString *)saysomething Billid:(NSString *)_Billid Userid:(NSString *)_Userid UploadTime:(NSString *)_UploadTime IsAccept:(NSString *)_IsAccept{
    NSLog(@"%@",saysomething);
    [self setBillid:_Billid];
    [self setUserid:_Userid];
    [self setUploadTime:_UploadTime];
    [self setIsAccept:_IsAccept];

}

-(NSDictionary*)getValueInDictionary{
    NSDictionary* dictionary = [NSDictionary  dictionaryWithObjectsAndKeys:Billid,@"Billid",p,@"p",Userid,@"Userid",UploadTime,@"UploadTime",
                                 IsAccept,@"IsAccept", nil];
    return dictionary;
}

@end
