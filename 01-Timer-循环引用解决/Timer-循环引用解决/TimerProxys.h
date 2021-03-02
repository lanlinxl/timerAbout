
//  TimerProxys.h
//  Created by lzwk_lanlin on 2021/2/26.
//

#import <Foundation/Foundation.h>

@interface TimerProxys : NSProxy
+ (instancetype)proxyWithTarget:(id)target;
@property (weak, nonatomic) id target;
@end
