//
//  ViewController.m
//  slideView
//
//  Created by Ash Bhat on 6/2/13.
//  Copyright (c) 2013 Ash Bhat. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize topLayer = _topLayer;
@synthesize layerPosition = _layerPosition;

#define VIEW_HIDDEN 260

-(void)animateLayerToPoint:(CGFloat)x
{
    [UIView animateWithDuration:0.3
delay:0
options:UIViewAnimationOptionCurveEaseOut
animations:^{
    CGRect frame = self.topLayer.frame;
    frame.origin.x = x;
    self.topLayer.frame = frame;
}
completion:^(BOOL finished){
    self.layerPosition = self.topLayer.frame.origin.x;
}];
}

- (IBAction)panLayer:(UIPanGestureRecognizer *)pan {
    if (pan.state == UIGestureRecognizerStateChanged) {
        CGPoint point = [pan translationInView:self.topLayer];
        CGRect frame = self.topLayer.frame;
        frame.origin.x = self.layerPosition + point.x;
        if(frame.origin.x < 0)frame.origin.x = 0;
        self.topLayer.frame = frame;
    }
    if (pan.state == UIGestureRecognizerStateEnded) {
        if(self.topLayer.frame.origin.x <= 160)
        {
            [self animateLayerToPoint:0];
        }
        else{
             [self animateLayerToPoint:VIEW_HIDDEN];
        }
    }
}

- (void)viewDidLoad
{
    self.layerPosition = self.topLayer.frame.origin.x;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
