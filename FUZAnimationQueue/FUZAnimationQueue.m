//
//  FUZAnimationQueue.m
//  FUZAnimationQueue
//
//  Created by Alexey Fayzullov on 9/18/16.
//  Copyright © 2016 Fuzza. All rights reserved.
//

#import "FUZAnimationQueue.h"

@interface FUZAnimationQueue ()

@property (nonatomic, strong) dispatch_queue_t animationQueue;

@end

@implementation FUZAnimationQueue

- (instancetype)init {
    self = [super init];
    if(self) {
        [self setupAnimationQueue];
    }
    return self;
}

- (void)setupAnimationQueue {
    self.animationQueue = dispatch_queue_create("net.fuzza.animationQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_set_target_queue(self.animationQueue, dispatch_get_main_queue());
}

- (void)enqueueWithDuration:(NSTimeInterval)duration animationBlock:(dispatch_block_t)block {
    if(!block) {
        return;
    }
    dispatch_async(self.animationQueue, ^{
        dispatch_suspend(self.animationQueue);
        [UIView animateWithDuration:duration animations:^{
            block();
        } completion:^(BOOL finished) {
            dispatch_resume(self.animationQueue);
        }];
    });
}

@end
