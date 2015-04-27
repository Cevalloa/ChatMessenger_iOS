//
//  ViewController.m
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import "MainMenuViewController.h"
#import "ChatSectionViewController.h"
#import "LoginSectionViewController.h"
#import "AnimationSectionViewController.h"
#import "UIViewController+NavigationBarHelperMethods.h"

@interface MainMenuViewController ()
@property (weak, nonatomic) IBOutlet UILabel *textLabelHeader;

@end

@implementation MainMenuViewController

#pragma mark - ViewController lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Sets the main text label font
    [self.textLabelHeader setFont:[UIFont fontWithName:@"Machinato-Bold" size:22]];
    
    //Sets up title(font & color), sets navigation back button to empty
    [self methodNavigationBarSetMainFont];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];

    //Hides the navigation bar
    [self methodNavigationBarHide];
    
    //Resets the navigation bar colors
    [self methodNavigationBarResetColors];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tableSectionAction:(id)sender
{
    ChatSectionViewController *tableSectionViewController = [[ChatSectionViewController alloc] init];
    [self.navigationController pushViewController:tableSectionViewController animated:YES];

}
- (IBAction)apiSectionAction:(id)sender
{
    LoginSectionViewController *apiSectionViewController = [[LoginSectionViewController alloc] init];
    [self.navigationController pushViewController:apiSectionViewController animated:YES];
}
- (IBAction)animationSectionAction:(id)sender
{
    AnimationSectionViewController *animationSectionViewController = [[AnimationSectionViewController alloc] init];
    [self.navigationController pushViewController:animationSectionViewController animated:YES];
}
@end
