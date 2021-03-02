//
//  TimerProxy.m
//  Created by lzwk_lanlin on 2021/2/26.
//

#import "TimerProxy.h"

@implementation TimerProxy

+ (instancetype)proxyWithTarget:(id)target
{
    TimerProxy *proxy = [[TimerProxy alloc] init];
    proxy.target = target;
    return proxy;
}

/*
 因为这里并没有实现定时器的timerTest方法，timerTest方法是在ViewController里面实现的，所以这里我们要利用消息转发机制，把方法交给ViewController去实现
 **/

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    return self.target;
}

@end
