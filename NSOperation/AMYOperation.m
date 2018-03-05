//
//  AMYOperation.m
//  NSOperation
//
//  Created by amyz on 2018/2/22.
//  Copyright © 2018年 huangbaoche. All rights reserved.
//

#import "AMYOperation.h"

@implementation AMYOperation

-(void)main {
    
    for (int i = 0; i < 3; ++i) {
        NSLog(@"AMYOperation-----%@",[NSThread currentThread]);
    }
}

@end
