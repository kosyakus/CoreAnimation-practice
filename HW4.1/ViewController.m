//
//  ViewController.m
//  HW4.1
//
//  Created by Admin on 16.05.17.
//  Copyright © 2017 GB. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *DrawView;
- (IBAction)Animation:(id)sender;
- (IBAction)ChangingColors:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.DrawView.layer.backgroundColor = [[UIColor darkGrayColor] CGColor];
//TRIANGLE
    
    self.triangle = [CAShapeLayer layer];
    UIBezierPath* trianglePath = [UIBezierPath bezierPath];
  //                                bezierPathWithRoundedRect: self.triangle.bounds byRoundingCorners: UIRectCornerAllCorners cornerRadii: CGSizeMake(20.0, 20.0)];
                                  
    CGFloat radius = 40;
    CGFloat a = 50;
    CGFloat b = 50;
    [trianglePath moveToPoint:CGPointMake(0, -radius)];
    [trianglePath addLineToPoint:CGPointMake(a, b)];
    [trianglePath addLineToPoint:CGPointMake(-a, b)];
    [trianglePath closePath];
    [trianglePath applyTransform:CGAffineTransformMakeTranslation(100, 150)];
    self.triangle.path = trianglePath.CGPath;
    self.triangle.fillColor = [[UIColor magentaColor] CGColor];
    [self.triangle setMasksToBounds:YES];
    self.triangle.lineDashPattern = @[@1, @3, @4, @2];
    self.triangle.strokeColor = [UIColor orangeColor].CGColor;
    self.triangle.lineCap = kCALineCapRound;
    self.triangle.lineWidth = 3.0f;
    self.triangle.frame = self.view.bounds;
    [self.triangle setCornerRadius:10.0];
    [self.view.layer addSublayer:self.triangle];
    
//SQUARE
    self.square = [[UIView alloc] initWithFrame:CGRectMake(50, 600, 100, 100)];
    self.square.backgroundColor = [UIColor cyanColor];
    self.square.layer.cornerRadius = 5;
    
    [self.view addSubview:self.square];
//CIRCLE
    self.circle = [CAShapeLayer layer];
    // Make a circular shape
    int radius1 = 40;
    self.circle.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(300, 600, 2.0*radius1, 2.0*radius1)cornerRadius:radius].CGPath;
    self.circle.fillColor = [[UIColor magentaColor] CGColor];
    self.circle.frame = self.view.bounds;
    
    [self.view.layer addSublayer:self.circle];
    
//HALFCIRCLE
    self.halfcircle = [CAShapeLayer layer];
    //halfcircle.path = [UIBezierPath bezierPathWithRoundedRect: CGContextAddArc(CGPointMake(100, 100), 90, -M_PI_2, M_PI_2 clockwise:YES];
    UIBezierPath *halfPath = [UIBezierPath bezierPath];
    halfPath = [UIBezierPath bezierPathWithArcCenter: CGPointMake(300, 150) radius:40 startAngle:-M_PI_2 endAngle:M_PI_2 clockwise:YES];
    self.halfcircle.path = halfPath.CGPath;
    self.halfcircle.frame = self.view.bounds;
   
    self.halfcircle.fillColor = [[UIColor cyanColor] CGColor];
    [self.view.layer addSublayer:self.halfcircle];
    

//Another way to create a button
  /*  UIButton *myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    myButton.frame = CGRectMake(80, 50, 150, 40);
    [myButton setTitle:@"ARRRR" forState:UIControlStateNormal];
    [myButton setBackgroundImage:[UIImage imageNamed:@"th-4.png"] forState:UIControlStateNormal];
    [myButton addTarget:self action:@selector(Animation2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myButton];
   
    */
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Animation:(id)sender {
  
//Change places
    CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath: @"position"];
    positionAnimation.duration = 1.5f;
    positionAnimation.autoreverses = NO;
    // positionAnimation.speed = 10;
    positionAnimation.repeatCount = 5;
    
    [positionAnimation setFromValue:[NSValue valueWithCGPoint: self.triangle.position]];
    [positionAnimation setToValue:[NSValue valueWithCGPoint: CGPointMake(200, 900)]];
    [self.triangle addAnimation: positionAnimation forKey: @"position"];
  
    [positionAnimation setFromValue:[NSValue valueWithCGPoint:self.square.layer.position]];
    [positionAnimation setToValue:[NSValue valueWithCGPoint:CGPointMake(300, 650)]];
    [self.square.layer addAnimation:positionAnimation forKey:@"position"];
 
    [positionAnimation setFromValue:[NSValue valueWithCGPoint:self.circle.position]];
    [positionAnimation setToValue:[NSValue valueWithCGPoint:CGPointMake(200, -150)]];
    [self.circle addAnimation:positionAnimation forKey:@"position"];
   
    [positionAnimation setFromValue:[NSValue valueWithCGPoint:self.halfcircle.position]];
    [positionAnimation setToValue:[NSValue valueWithCGPoint:CGPointMake(-30, 370)]];
    [self.halfcircle addAnimation:positionAnimation forKey:@"position"];
    
}

- (IBAction)ChangingColors:(id)sender {
    
//CHANGE COLOR
    
    //CABasicAnimation *colorsAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    //[colorsAnimation setToValue: [NSArray arrayWithObjects: (id)[UIColor greenColor].CGColor,
    //                          (id)[UIColor yellowColor].CGColor, (id)[UIColor orangeColor].CGColor, (id)[UIColor redColor].CGColor, nil]];
    
    //TRYING to do a RANDOM color
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
    CABasicAnimation *fillColorAnimation = [CABasicAnimation animationWithKeyPath:@"fillColor"];
    fillColorAnimation.duration = 1.5f;
    fillColorAnimation.fromValue = (id)[[UIColor magentaColor] CGColor];
    fillColorAnimation.toValue = (id)color.CGColor;
    fillColorAnimation.repeatCount = 3;
    fillColorAnimation.autoreverses = YES;
    [self.triangle addAnimation:fillColorAnimation forKey:@"fillColor"];
    [self.circle addAnimation:fillColorAnimation forKey:@"fillColor"];
    [self.halfcircle addAnimation:fillColorAnimation forKey:@"fillColor"];
    //[self.square.layer addAnimation:fillColorAnimation forKey:@"fillColor"];
    
  
    CABasicAnimation *fill2ColorAnimation = [CABasicAnimation animationWithKeyPath:@"fill2Color"];
    fill2ColorAnimation.duration = 1.5f;
    fill2ColorAnimation.fromValue = (id)[[UIColor cyanColor] CGColor];
    fill2ColorAnimation.toValue = (id)[[UIColor redColor] CGColor];
    fill2ColorAnimation.repeatCount = 3;
    fill2ColorAnimation.autoreverses = YES;
   // [self.square.layer addAnimation:fill2ColorAnimation forKey:@"fill2Color"];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.5f];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp
                           forView:self.square cache:NO];
    [UIView setAnimationRepeatCount:3.0];
    self.square.layer.backgroundColor = color.CGColor;
    [UIView commitAnimations];
    
}
@end
