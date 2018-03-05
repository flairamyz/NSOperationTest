//
//  ViewController.m
//  NSOperation
//
//  Created by amyz on 2018/2/22.
//  Copyright © 2018年 huangbaoche. All rights reserved.
//

#import "ViewController.h"
#import "AMYOperation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"\n\n\n=====NSOperation使用说明:https://www.jianshu.com/p/4b1d77054b35=====\n\n\n");
    
    
//    [self testOperation];

    // 测试主队列
//    [self testMainQueue];
    
    // 测试其他队列
//    [self testOtherQueue];
    
    [self testConcurrentOperationCount];
    
}


-(void)run {
    
    NSLog(@"---NSInvocationOperation---%@:默认在主线程执行", [NSThread currentThread]);

}
-(void)testOperation {
    
    SEL aSelector = @selector(run);
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:aSelector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = aSelector;

    NSInvocationOperation *op1 = [[NSInvocationOperation alloc]initWithInvocation:invocation];
    
    NSInvocationOperation *op2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run) object:nil];

    
    [op1 start];
    [op2 start];

    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        
        NSLog(@"---NSBlockOperation---%@:默认在主线程执行", [NSThread currentThread]);

    }];
    [op3 addExecutionBlock:^{
        
        NSLog(@"---addExecutionBlock---%@", [NSThread currentThread]);

    }];
    
    NSBlockOperation *op4 = [NSBlockOperation blockOperationWithBlock:^{
        
        NSLog(@"---NSBlockOperation---%@:默认在主线程执行", [NSThread currentThread]);
        
    }];
    [op4 addExecutionBlock:^{
        
        NSLog(@"---addExecutionBlock---%@:在其他线程(也可能是主线程)执行", [NSThread currentThread]);
        
    }];

    [op3 start];
    [op4 start];
    

    AMYOperation *op5 = [[AMYOperation alloc]init];
    
    [op5 start];

}

-(void)testMainQueue {
    
    SEL aSelector = @selector(run);
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:aSelector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = aSelector;
    
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc]initWithInvocation:invocation];
    
    NSInvocationOperation *op2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run) object:nil];

    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        
        NSLog(@"---NSBlockOperation---%@:默认在主线程执行", [NSThread currentThread]);
        
    }];
    [op3 addExecutionBlock:^{
        
        NSLog(@"---addExecutionBlock---%@", [NSThread currentThread]);
        
    }];
    
    NSBlockOperation *op4 = [NSBlockOperation blockOperationWithBlock:^{
        
        NSLog(@"---NSBlockOperation---%@:默认在主线程执行", [NSThread currentThread]);
        
    }];
    [op4 addExecutionBlock:^{
        
        NSLog(@"---addExecutionBlock---%@:在其他线程(也可能是主线程)执行", [NSThread currentThread]);
        
    }];

    AMYOperation *op5 = [[AMYOperation alloc]init];
    
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    [mainQueue addOperation:op4];
    [mainQueue addOperation:op5];
    [mainQueue addOperation:op1];
    [mainQueue addOperation:op2];
    [mainQueue addOperation:op3];
    
    
    
}

#pragma mark - 其他队列
-(void)testOtherQueue {
    
    SEL aSelector = @selector(run);
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:aSelector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = aSelector;
    
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc]initWithInvocation:invocation];
    
    NSInvocationOperation *op2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run) object:nil];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        
        NSLog(@"---NSBlockOperation---%@:默认在主线程执行", [NSThread currentThread]);
        
    }];
    [op3 addExecutionBlock:^{
        
        NSLog(@"---addExecutionBlock---%@", [NSThread currentThread]);
        
    }];
    
    NSBlockOperation *op4 = [NSBlockOperation blockOperationWithBlock:^{
        
        NSLog(@"---NSBlockOperation---%@:默认在主线程执行", [NSThread currentThread]);
        
    }];
    [op4 addExecutionBlock:^{
        
        NSLog(@"---addExecutionBlock---%@:在其他线程(也可能是主线程)执行", [NSThread currentThread]);
        
    }];
    
    AMYOperation *op5 = [[AMYOperation alloc]init];
    
    NSOperationQueue *mainQueue = [[NSOperationQueue alloc]init];
//    mainQueue.maxConcurrentOperationCount = 1;
    
    [op3 addDependency:op1];
    
    [mainQueue addOperation:op3];
    [mainQueue addOperation:op1];
    
    [mainQueue addOperation:op2];
    [mainQueue addOperation:op4];
    [mainQueue addOperation:op5];
    
    
}

-(void)testConcurrentOperationCount {
    // 创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // 设置最大并发操作数
//        queue.maxConcurrentOperationCount = 2;
    queue.maxConcurrentOperationCount = 1; // 就变成了串行队列
    
    // 添加操作
    [queue addOperationWithBlock:^{
        NSLog(@"1-----%@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:0.01];
    }];
    [queue addOperationWithBlock:^{
        NSLog(@"2-----%@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:0.01];
    }];
    [queue addOperationWithBlock:^{
        NSLog(@"3-----%@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:0.01];
    }];
    [queue addOperationWithBlock:^{
        NSLog(@"4-----%@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:0.01];
    }];

    [queue addOperationWithBlock:^{
        NSLog(@"5-----%@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:0.01];
    }];
    
    [queue addOperationWithBlock:^{
        NSLog(@"6-----%@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:0.01];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
