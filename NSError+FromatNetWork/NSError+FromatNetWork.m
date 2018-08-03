//
//  NSError+AFNErrorResole.m
//  liqiang365SaaS
//
//  Created by John on 2018/5/29.
//  Copyright © 2018年 BeiJing BoRuiSiYuan Network Technology Co., Ltd. All rights reserved.
//

#import "NSError+FromatNetWork.h"

@implementation NSError (FromatNetWork)

- (NSString *)description {
    NSError *underError = self.userInfo[@"NSUnderlyingError"];
    NSString *errorURLStr = underError.userInfo[@"NSErrorFailingURLKey"];
    NSString *errorCode =  underError.userInfo[@"NSLocalizedDescription"];
    NSData *responseData = underError.userInfo[@"com.alamofire.serialization.response.error.data"];
    NSString *errorResult = [[NSString alloc] initWithData:responseData  encoding:NSUTF8StringEncoding];
    
    return [NSString stringWithFormat:@"\n --- 错误连接:\n%@\n --- 错误码:\n%@\n --- 错误信息:\n%@\n", errorURLStr, errorCode, errorResult];
}

@end
