//
//  UIViewController+NavigationBarHelperMethods.m
//  IOSProgrammerTest
//
//  Created by Alex Cevallos on 4/26/15.
//  Copyright (c) 2015 AppPartner. All rights reserved.
//

#import "UIViewController+NavigationBarHelperMethods.h"

@implementation UIViewController (NavigationBarHelperMethods)

//Sets up title(font & color), sets navigation back button to empty
-(void)methodNavigationBarSetMainFont{
    
    //Sets initial title color & font
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Machinato-ExtraLight" size:22], NSFontAttributeName, [UIColor whiteColor], NSForegroundColorAttributeName, nil]];
    
    //Sets the navigation bar's back button to empty
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
}

//Hides the navigation bar
-(void)methodNavigationBarHide{
    
    [self.navigationController setNavigationBarHidden:YES];
    self.navigationController.navigationBar.translucent = NO;
    
}

//Sets the navigation bar transparant
-(void)methodNavigationBarSetTransparant{
    
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationController.navigationBar.translucent = YES;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

//Resets the navigation bar colors
-(void)methodNavigationBarResetColors{
    
    
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}


@end
