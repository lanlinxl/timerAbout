//
//  ViewController.m
//  Timer-循环引用解决
//
//  Created by lzwk_lanlin on 2021/2/26.
//

#import "ViewController.h"
#import "TimerProxy.h"
#import "TimerProxys.h"

@interface ViewController ()
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                  target:[TimerProxy proxyWithTarget:self]
                                                selector:@selector(timerTest)
                                                userInfo:nil repeats:YES];
}

///造成循环引用的创建方式：
-(void)initTimer1{
  
    [self initTimer3];
        
}

///Block的解决方式
-(void)initTimer2{
    __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [weakSelf timerTest];
    }];
}

///NSobject作为中介的解决方式
-(void)initTimer3{
    
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:[TimerProxy proxyWithTarget:self] selector:@selector(timerTest) userInfo:nil repeats:YES];
        
}

///NSProxy作为中介的解决方式 （推荐）
-(void)initTimer4{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:[TimerProxys  proxyWithTarget:self] selector:@selector(timerTest) userInfo:nil repeats:YES];
        
}


- (void)timerTest
{
    NSLog(@"%s", __func__);
}

- (void)dealloc
{
    NSLog(@"%s", __func__);
    [self.timer invalidate];
}


@end
