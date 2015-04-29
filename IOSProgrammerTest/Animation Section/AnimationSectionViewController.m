//
//  AnimationSectionViewController.m
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import "AnimationSectionViewController.h"
#import "MainMenuViewController.h"
#import "UIViewController+NavigationBarHelperMethods.h"

@interface AnimationSectionViewController () {
    CGPoint firstTouchPoint;
}
@property (weak, nonatomic) IBOutlet UITextView *textFieldParagraph;
@property (weak, nonatomic) IBOutlet UILabel *labelTextCreativity;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewIcon;

@end

float xCoordinate;
float yCoordinate;

@implementation AnimationSectionViewController

#pragma mark - View Controller Lifecycle Methods
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self methodNavigationBarSetTransparant];
    
    self.title = @"ANIMATION";
    
    self.textFieldParagraph.text = @"Animate the App Partner icon. Make it spin around 360 degrees when the spin button is pressed. Allow it to be dragged around the screen by touching and dragging.";
    
    [self.textFieldParagraph setFont:[UIFont fontWithName:@"Machinato" size:16]];
    
    self.labelTextCreativity.text = @"BONUS POINTS FOR CREATIVITY";
    
    [self.labelTextCreativity setFont:[UIFont fontWithName:@"Machinato-SemiBoldItalic" size:15]];
    
}

#pragma mark - Animation Methods
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touchCurrentByUser = [touches anyObject];
    if ([touchCurrentByUser.view isEqual:self.imageViewIcon]) {
        firstTouchPoint = [touchCurrentByUser locationInView:[self view]];
        xCoordinate = firstTouchPoint.x - [[touchCurrentByUser view]center].x;
        yCoordinate = firstTouchPoint.y - [[touchCurrentByUser view]center].y;
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* mTouch = [touches anyObject];
    if (mTouch.view == self.imageViewIcon) {
        CGPoint currentPoint = [mTouch locationInView:[self view]];
        [[mTouch view]setCenter:CGPointMake(currentPoint.x-xCoordinate, currentPoint.y-yCoordinate)];
    }
}
- (IBAction)actionButtonPress:(id)sender {
    
    CABasicAnimation *animationSpinsImage = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animationSpinsImage.fromValue = [NSNumber numberWithFloat:0];
    animationSpinsImage.toValue = [NSNumber numberWithFloat:(2*M_PI)];
    animationSpinsImage.duration = 1;
    animationSpinsImage.repeatCount = 1;
    
    [self.imageViewIcon.layer addAnimation:animationSpinsImage forKey:@"animationSpin"];
    
    
    //Another method to rotate 360 degrees, but I decided against it
//    [UIView animateWithDuration:1.0 animations:^{
//        self.imageViewIcon.transform = CGAffineTransformMakeRotation(M_PI);
//
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:1.0 animations:^{
//            self.imageViewIcon.transform = CGAffineTransformMakeRotation(M_PI * 2);
//            
//        }];
//    }];
}

#pragma mark - Removed Methods
- (IBAction)backAction:(id)sender
{

}

@end
