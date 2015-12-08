//
//  ViewController.h
//  DVVARCProgress
//
//  Created by 大威 on 15/12/5.
//  Copyright © 2015年 DaWei. All rights reserved.
//

#import "DVVProgressView.h"
#import "UIColor+Extension.h"
#import "DVVProgressLayer.h"

@interface DVVProgressView()

@property (nonatomic, strong) DVVProgressLayer * shapeLayer;
@property (nonatomic, strong) DVVProgressLayerPoint * endPoint;

@property (nonatomic, assign) CGFloat startAngle;


@property (nonatomic, strong) UIImageView *contentView;

@end

@implementation DVVProgressView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.contentView];
        
        _animationDuration = 0.3f;
        
        _shapeLayer = [DVVProgressLayer layer];
        _shapeLayer.bounds = self.contentView.bounds;
        _shapeLayer.position = self.contentView.center;
        
        _endPoint = [DVVProgressLayerPoint layer];
        _endPoint.bounds = self.contentView.bounds;
        _endPoint.position = self.contentView.center;

        [self.contentView.layer setMask:_shapeLayer];
        [self.contentView.layer addSublayer:self.endPoint];
    }
    return self;
}

- (void)setProgress:(CGFloat)progress
{
    // 添加动画
    _progress = progress;
    self.shapeLayer.progress = progress;
    self.endPoint.progress = progress;
    
    [self.shapeLayer removeAllAnimations];
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"progress"];
    pathAnimation.duration = _animationDuration;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnimation.fromValue = [NSNumber numberWithFloat:0];
    pathAnimation.toValue = [NSNumber numberWithFloat:progress];
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.autoreverses = NO;
    pathAnimation.delegate = self;
    [_shapeLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    [_endPoint addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.contentView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    _shapeLayer.bounds = self.contentView.bounds;
    _shapeLayer.position = self.contentView.center;
    
    _endPoint.bounds = self.contentView.bounds;
    _endPoint.position = self.contentView.center;

    
}

#pragma mark - Get
- (UIImageView *)contentView {
    if (!_contentView) {
        _contentView = [[UIImageView alloc] init];
        _contentView.image = [UIImage imageNamed:@"progressBg"];
        
    }
    return _contentView;
}

@end
