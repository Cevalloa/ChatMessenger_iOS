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
#import "NetworkConnectivityClass.h"

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

#pragma mark UIAlertView Methods
//Since we are targeting iOS 7 as well, we can't use UIAlertController
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    //If buttonIndex with 'OK' is pressed, brings us back to mainviewcontroller
    if (buttonIndex == 0){
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
}


#pragma mark - IBAction Methods
- (IBAction)methodActionLogin:(id)sender {
    
    NetworkConnectivityClass *networkInstance = [NetworkConnectivityClass new];
    
    NSDate *dateTimeStart = [NSDate date];
    
    [networkInstance methodLogin:@"http://dev.apppartner.com/AppPartnerProgrammerTest/scripts/login.php" withUserName:self.textFieldUsername.text withPassword:self.textFieldPassword.text completion:^(NSDictionary *returnedValue) {

        //Show message & find out how much time the process took in miliseconds
        NSString *stringToDisplayInAlertView = [NSString stringWithFormat:@"%@ .. took %f milliseconds", returnedValue[@"message"], ([[NSDate date] timeIntervalSinceDate:dateTimeStart] * 1000.0f)];
        
        //Create alertView to display returned Data
        UIAlertView *alertViewForReturnedData = [[UIAlertView alloc] initWithTitle:returnedValue[@"code"] message:stringToDisplayInAlertView delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alertViewForReturnedData show];
        
    }
     ];
    
}




#pragma mark - Removed Methods
//Method deleted.. navigation controller takes care of this
- (IBAction)backAction:(id)sender
{
}

@end
