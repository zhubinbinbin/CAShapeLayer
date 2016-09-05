//
//  ViewController.m
//  CAShapeLayer
//
//  Created by 朱宾宾 on 16/9/5.
//  Copyright © 2016年 朱宾宾. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor redColor];
    view.alpha = 0.5;
    //创建一个园
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100 / 2.f, 100 / 2.f) radius:100 / 2.f startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    //创建一个shapeLayer
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = view.bounds;//与view的frame一致
    layer.strokeColor = [UIColor greenColor].CGColor;//边缘线的颜色
    layer.fillColor = [UIColor clearColor].CGColor;//闭环填充的颜色
    layer.lineCap = kCALineCapSquare;//边缘线的类型
    layer.path = path.CGPath;//从贝塞尔曲线获取到形状
    layer.lineWidth = 4.0f;//线条宽度
    layer.strokeStart = 0.0f;
    layer.strokeEnd = 0.1f;
    //将layer添加进图层
    [view.layer addSublayer:layer];
    //3s后执行动画操作
    dispatch_after(NSEC_PER_SEC * 3, dispatch_get_main_queue(), ^{
        layer.speed = 0.1;
        layer.strokeStart = 0.5;
        layer.strokeEnd = 0.9f;
        layer.lineWidth = 1.0f;
    });
    //为layer添加动画效果
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 1.0;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.5f];
    pathAnimation.toValue = [NSNumber numberWithFloat:0.8f];
    [layer addAnimation:pathAnimation forKey:nil];
    //创建一个gradientLayer
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = view.bounds;
    
    [gradientLayer setColors:[NSArray arrayWithObjects:
                              (id)[[UIColor redColor] CGColor],
                              (id)[[UIColor yellowColor] CGColor], nil]];
    
    [gradientLayer setLocations:@[@0.5,@0.9,@1]];
    
    [gradientLayer setStartPoint:CGPointMake(0.5, 1)];
    
    [gradientLayer setEndPoint:CGPointMake(0.5, 0)];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
