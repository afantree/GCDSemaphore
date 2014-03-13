//
//  simulateSocket.h
//  GCDSemaphore
//
//  Created by 阿凡树 QQ：729397005 on 14-3-13.
//  Copyright (c) 2014年 ManGang. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol socketDelegate;
@interface simulateSocket : NSObject
{
    dispatch_queue_t               _sendQueue;
}
@property (nonatomic, readwrite, assign)id<socketDelegate> delegate;
-(id)initWithDelegate:(id)object;

-(void)sendString:(NSString*)str;
@end

@protocol socketDelegate <NSObject>

- (void)reciveString:(NSString*)str;

@end