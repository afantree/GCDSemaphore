//
//  simulateSocket.m
//  GCDSemaphore
//
//  Created by 阿凡树 QQ：729397005 on 14-3-13.
//  Copyright (c) 2014年 ManGang. All rights reserved.
//

#import "simulateSocket.h"

@implementation simulateSocket
-(id)initWithDelegate:(id)object
{
    self = [super init];
    if (self) {
        _sendQueue = dispatch_queue_create("send", NULL);
        self.delegate = object;
    }
    return self;
}
-(void)sendString:(NSString*)str
{
    dispatch_async(_sendQueue, ^{
        int random = arc4random()%5 + 1;
        sleep(random);
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([self.delegate respondsToSelector:@selector(reciveString:)]) {
                [self.delegate reciveString:[NSString stringWithFormat:@"%@,%ds",str,random]];
            }
        });
    });
}
@end
