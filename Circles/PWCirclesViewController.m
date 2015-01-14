//
//  PWCirclesViewController.m
//  ParkWhiz
//
//  Created by Mo Bitar on 10/29/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import "PWCirclesViewController.h"
#import "PWCirclesView.h"

@interface PWCirclesViewController ()
@property (nonatomic) PWCirclesView *circlesView;
@end

@implementation PWCirclesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    [self addCircles];
}

- (void)addCircles
{
    self.circlesView = [[PWCirclesView alloc] initWithFrame:self.view.bounds];
    
    [self.view insertSubview:self.circlesView atIndex:0];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGRect frame = self.circlesView.frame;
    frame.size = self.view.bounds.size;
    self.circlesView.frame = frame;
}

@end
