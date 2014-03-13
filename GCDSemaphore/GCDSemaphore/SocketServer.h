//
//  SocketServer.h
//  GCDSemaphore
//
//  Created by 阿凡树 QQ：729397005 on 14-3-13.
//  Copyright (c) 2014年 ManGang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "simulateSocket.h"
@interface SocketServer : NSObject
{
    simulateSocket         *_socket;
    getBackStringBlock      _successBlock;
}
+(id)share;

-(void)sendString:(NSString*)str withSuccessBlock:(getBackStringBlock)sb andFailBlock:(getBackStringBlock)fb;
@end
