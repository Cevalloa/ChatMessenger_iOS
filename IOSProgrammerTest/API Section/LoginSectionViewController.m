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

@property (weak, nonatomic) IBOutlet UITextField *textFieldUsername;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassword;

@end

@implementation LoginSectionViewController

#pragma mark - View Controller Lifecycle Methods
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"LOGIN";

    //Sets the font + color for the placeholder text
    [self methodSetTextfieldPlaceholderFont];
    
    //Set delegates
    self.textFieldUsername.delegate = self;
    self.textFieldPassword.delegate = self;

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    //Sets the navigation bar transparant
    [self methodNavigationBarSetTransparant];

}

#pragma mark NSAttributedString Methods
-(void)methodSetTextfieldPlaceholderFont{
    
    UIFont *fontForTextFields = [UIFont fontWithName:@"Machinato" size:22];
    
    NSDictionary *dictionaryAttributesForPlaceholderText =
    @{ NSForegroundColorAttributeName: [UIColor blackColor], NSFontAttributeName: fontForTextFields                                                           };
    
    self.textFieldUsername.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"username" attributes:dictionaryAttributesForPlaceholderText];
    
    [self.textFieldUsername setFont:fontForTextFields];
    
    self.textFieldPassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"password" attributes:dictionaryAttributesForPlaceholderText];
    
    [self.textFieldPassword setFont:fontForTextFields];
    
}


#pragma mark - TextField Delegate Methods
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return false;
}

#pragma mark - IBAction Methods
- (IBAction)methodActionLogin:(id)sender {
    
    
    
}




#pragma mark - Removed Methods
//Method deleted.. navigation controller takes care of this
- (IBAction)backAction:(id)sender
{
}

@end
