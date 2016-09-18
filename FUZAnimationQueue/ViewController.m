//
//  ViewController.m
//  FUZAnimationQueue
//
//  Created by Alexey Fayzullov on 9/18/16.
//  Copyright © 2016 Fuzza. All rights reserved.
//

#import "ViewController.h"
#import "FUZAnimationQueue.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIView *animatedView;
@property (nonatomic, weak) IBOutlet UIButton *resetButton;

@property (nonatomic, strong) FUZAnimationQueue *animationQueue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self restartAnimation:nil];
}

- (IBAction)restartAnimation:(id)sender {
    self.animatedView.frame = CGRectMake(10, 150, 150, 150);
    
    for (NSUInteger i = 0; i < 5; i++) {
        [self animateView];
    }
}

- (void)animateView {
    __weak typeof(self) weakSelf = self;
    [self.animationQueue enqueueWithDuration:0.25 animationBlock:^{
        weakSelf.animatedView.center = CGPointMake(weakSelf.animatedView.center.x, weakSelf.animatedView.center.y + 50);
    }];
    
    [self.animationQueue enqueueWithDuration:0.25 animationBlock:^{
        weakSelf.animatedView.center = CGPointMake(weakSelf.animatedView.center.x + 50, weakSelf.animatedView.center.y);
    }];
}

- (FUZAnimationQueue *)animationQueue {
    if (!_animationQueue) {
        _animationQueue = [FUZAnimationQueue new];
    }
    return _animationQueue;
}

@end
