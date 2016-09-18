//
//  FUZAnimationQueue.h
//  FUZAnimationQueue
//
//  Created by Alexey Fayzullov on 9/18/16.
//  Copyright © 2016 Fuzza. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FUZAnimationQueue : NSObject

- (void)enqueueWithDuration:(NSTimeInterval)duration
             animationBlock:(dispatch_block_t)block;

@end

NS_ASSUME_NONNULL_END
