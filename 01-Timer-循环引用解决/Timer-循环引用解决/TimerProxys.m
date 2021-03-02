//
//  TimerProxys.m
//  Created by lzwk_lanlin on 2021/2/26.
//


#import "TimerProxys.h"

@implementation TimerProxys

+ (instancetype)proxyWithTarget:(id)target
{
    // NSProxy对象不需要调用init，因为它本来就没有init方法
    TimerProxys *proxy = [TimerProxys alloc];
    proxy.target = target;
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    [invocation invokeWithTarget:self.target];
}
@end
