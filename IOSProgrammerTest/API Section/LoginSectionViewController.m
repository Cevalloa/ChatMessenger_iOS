//
//  APISectionViewController.m
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import "LoginSectionViewController.h"
#import "MainMenuViewController.h"
#import "UIViewController+NavigationBarHelperMethods.h"

@interface LoginSectionViewController ()

@end

@implementation LoginSectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"LOGIN";
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    //Sets the navigation bar transparant
    [self methodNavigationBarSetTransparant];

}

//Method deleted.. navigation controller takes care of this
- (IBAction)backAction:(id)sender
{
}

@end
