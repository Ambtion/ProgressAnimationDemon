//
//  DVVProgressLayer.m
//  DVVARCProgress
//
//  Created by quke on 15/12/8.
//  Copyright © 2015年 DaWei. All rights reserved.
//



#import "DVVProgressLayer.h"


@interface DVVProgressLayer()

@property (nonatomic, assign) CGFloat startAngle;

@end

@implementation DVVProgressLayer

+ (BOOL)needsDisplayForKey:(NSString *)key
{
    if (([@"progress" isEqualToString:key])) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (void)drawInContext:(CGContextRef)ctx
{
    UIGraphicsPushContext(ctx);
    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
    
    // 半径
    CGFloat radius = (self.bounds.size.width - 10) / 2.f;
    CGFloat viewRadius = self.bounds.size.width / 2.f;
    CGPoint center = CGPointMake(viewRadius, viewRadius);
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
    
    
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextAddArc(ctx,
                    radius * cos(_startAngle) + center.x,
                    radius * sin(_startAngle) + center.y,
                    5, 0, M_PI * 2, YES);
    CGContextFillPath(ctx);
    
    // 绘制路径
    UIBezierPath* aPath = [UIBezierPath bezierPathWithArcCenter:center
                                                         radius:radius
                                                     startAngle:_startAngle
                                                       endAngle:M_PI * 2 * self.progress + _startAngle
                                                      clockwise:YES];
    
    [aPath setLineWidth:10.f];
    [aPath stroke];
    
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    
    CGFloat distanceX = radius * cos(M_PI * 2 * self.progress + _startAngle);
    CGFloat distanceY = radius * sin(M_PI * 2 * self.progress + _startAngle);
    
    
    CGPoint finalPoint = CGPointMake(distanceX + center.x, distanceY + center.y);
    
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextAddArc(ctx, finalPoint.x, finalPoint.y, 5, 0, M_PI * 2, YES);
    CGContextFillPath(ctx);
  
    UIGraphicsPopContext();
}

@end



@interface DVVProgressLayerPoint()

@property (nonatomic, assign) CGFloat startAngle;

@end

@implementation DVVProgressLayerPoint

+ (BOOL)needsDisplayForKey:(NSString *)key
{
    if (([@"progress" isEqualToString:key])) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (void)drawInContext:(CGContextRef)ctx
{
    UIGraphicsPushContext(ctx);
    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
    
    // 半径
    CGFloat radius = (self.bounds.size.width - 10) / 2.f;
    CGFloat viewRadius = self.bounds.size.width / 2.f;
    CGPoint center = CGPointMake(viewRadius, viewRadius);
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
    
    
//    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
//    CGContextAddArc(ctx,
//                    radius * cos(_startAngle) + center.x,
//                    radius * sin(_startAngle) + center.y,
//                    5, 0, M_PI * 2, YES);
//    CGContextFillPath(ctx);
//    
//    // 绘制路径
//    UIBezierPath* aPath = [UIBezierPath bezierPathWithArcCenter:center
//                                                         radius:radius
//                                                     startAngle:_startAngle
//                                                       endAngle:M_PI * 2 * self.progress + _startAngle
//                                                      clockwise:YES];
//    
//    [aPath setLineWidth:10.f];
//    [aPath stroke];
        
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    
    CGFloat distanceX = radius * cos(M_PI * 2 * self.progress + _startAngle);
    CGFloat distanceY = radius * sin(M_PI * 2 * self.progress + _startAngle);
    
    
    CGPoint finalPoint = CGPointMake(distanceX + center.x, distanceY + center.y);
    
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextAddArc(ctx, finalPoint.x, finalPoint.y, 5, 0, M_PI * 2, YES);
    CGContextFillPath(ctx);
    
    UIGraphicsPopContext();
}

@end
