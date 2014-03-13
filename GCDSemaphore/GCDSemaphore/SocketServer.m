//
//  SocketServer.m
//  GCDSemaphore
//
//  Created by 阿凡树 QQ：729397005 on 14-3-13.
//  Copyright (c) 2014年 ManGang. All rights reserved.
//

#import "SocketServer.h"
static SocketServer *_socketServer = nil;
@interface SocketServer ()
{
    dispatch_queue_t          _sendQueue;
    dispatch_semaphore_t      _sema;
}
@end
@implementation SocketServer
+(id)share
{
    if (_socketServer == nil) {
        _socketServer = [[SocketServer alloc] init];
    }
    return _socketServer;
}
-(id)init
{
    if (self = [super init]) {
        _socket = [[simulateSocket alloc] initWithDelegate:self];
        _sendQueue = dispatch_queue_create("socketServer", NULL);
        _sema = dispatch_semaphore_create(1);
    }
    return self;
}
-(void)sendString:(NSString*)str withSuccessBlock:(getBackStringBlock)sb andFailBlock:(getBackStringBlock)fb
{
    dispatch_async(_sendQueue, ^{
        dispatch_semaphore_wait(_sema, DISPATCH_TIME_FOREVER);
        _successBlock = sb;
        //NSLog(@"_successBlock = %@",_successBlock);
        [_socket sendString:str];
    });
}
#pragma mark - socketDelegate
- (void)reciveString:(NSString*)str
{
    _successBlock(str);
    dispatch_semaphore_signal(_sema);
    //NSLog(@"recive successBlock = %@",_successBlock);
    NSLog(@"哈哈，收到 %@",str);
}
@end
