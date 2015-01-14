//
//  PWBlurView.m
//  ParkWhiz
//
//  Created by Mo Bitar on 12/7/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import "PWBlurView.h"

@interface PWBlurView ()
@property (nonatomic) UIView *blurView;
@end

@implementation PWBlurView

- (void)didMoveToSuperview
{
    [super didMoveToSuperview];
    
    if([UIVisualEffect class]) {
        UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        self.blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    } else {
        self.blurView = [[UIToolbar alloc] initWithFrame:self.bounds];
    }
        
    [self insertSubview:self.blurView atIndex:0];
    
    self.overBlurView = [UIView new];
    self.overBlurView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.0];
    [self insertSubview:self.overBlurView aboveSubview:self.blurView];
    
    self.overBlurView.autoresizingMask = 0;
    self.blurView.autoresizingMask = 0;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.blurView.frame = self.bounds;
    self.overBlurView.frame = self.bounds;
}
@end
