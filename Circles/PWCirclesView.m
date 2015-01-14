//
//  PWCirclesView.m
//  ParkWhiz
//
//  Created by Mo Bitar on 10/30/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import "PWCirclesView.h"
#import "PWBlurView.h"

@interface PWCirclesView ()
@property (nonatomic) PWBlurView *blurView;
@end

@implementation PWCirclesView
{
    CAEmitterLayer *_emitter;
    CAEmitterCell *_circle;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]) {
        [self configureEmitter];
        [self addBlur];
    }
    
    return self;
}

- (void)addBlur
{
    self.blurView = [[PWBlurView alloc] initWithFrame:self.bounds];
    [self addSubview:self.blurView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _emitter.emitterSize = self.bounds.size;
    
    CGRect frame = self.blurView.frame;
    frame.size = self.bounds.size;
    self.blurView.frame = frame;
}

- (void)configureEmitter
{
    _emitter = (CAEmitterLayer *)self.layer;
    _emitter.emitterPosition = CGPointMake(40, CGRectGetHeight(self.frame) * 0.75);
    _emitter.emitterSize = self.bounds.size;
    _emitter.masksToBounds = YES;
    _emitter.emitterShape = kCAEmitterLayerRectangle;
    _emitter.birthRate = 1.0;
    _emitter.opacity = 1.0;
    _emitter.lifetime = 1.0;
    _emitter.velocity = -1.0;
    
    _circle = [CAEmitterCell emitterCell];
    _circle.lifetime = 30.0;
    _circle.birthRate = 2.0;
    
    _circle.color = [[UIColor whiteColor] colorWithAlphaComponent:0.0].CGColor;
    _circle.redRange = 1.0;
    _circle.blueRange = 1.0;
    _circle.greenRange = 1.0;
    
    _circle.alphaRange = 1.0;
    _circle.alphaSpeed = 0.05;

    _circle.scale = 0.5;
    _circle.scaleRange = -0.1;
    _circle.spin = 0.5;
    _circle.spinRange = 1.0;
    
    _circle.emissionRange = -M_PI * 2.0;
    _circle.emissionLongitude = M_PI * 2;
    
    _circle.yAcceleration = 1.0;
    _circle.xAcceleration = 1.0;
    
    _circle.velocity = 5.5;
    _circle.velocityRange = 0.0;
    _circle.xAcceleration = 5.0;

    _circle.contents = (id)[[UIImage imageNamed:@"emitter-circle"] CGImage];
    [_circle setName:@"circle"];
    
    _emitter.emitterCells = [NSArray arrayWithObject:_circle];
}

+ (Class)layerClass
{
    return [CAEmitterLayer class];
}


@end
