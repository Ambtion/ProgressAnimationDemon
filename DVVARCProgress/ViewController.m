//
//  ViewController.m
//  DVVARCProgress
//
//  Created by 大威 on 15/12/5.
//  Copyright © 2015年 DaWei. All rights reserved.
//

#import "ViewController.h"
#import "DVVProgressView.h"

@interface ViewController ()

@property (nonatomic, strong) DVVProgressView *backgroundProgressView;

@property (nonatomic, strong) DVVProgressView *foregroundProgressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage *image = [UIImage imageNamed:@"bg"];
    self.view.layer.contents = (id)image.CGImage;
}

- (void)viewDidAppear:(BOOL)animated {
    

    _foregroundProgressView = [DVVProgressView new];
    _foregroundProgressView.frame = CGRectMake(50, 150, 200, 200);
    _foregroundProgressView.center = _foregroundProgressView.center;
    [self.view addSubview:_foregroundProgressView];
    
    
    _foregroundProgressView.lineColor = [UIColor redColor];
    _foregroundProgressView.lineBackgroundImage = [UIImage imageNamed:@"progressBg"];
    _foregroundProgressView.animationDuration = 2;
    _foregroundProgressView.progress = 0.8f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

