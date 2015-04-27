//
//  UIViewController+NavigationBarHelperMethods.h
//  IOSProgrammerTest
//
//  Created by Alex Cevallos on 4/26/15.
//  Copyright (c) 2015 AppPartner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NavigationBarHelperMethods)

//Sets up title(font & color), sets navigation back button to empty
-(void)methodNavigationBarSetMainFont;

//Hides the navigation bar
-(void)methodNavigationBarHide;

//Sets the navigation bar transparant
-(void)methodNavigationBarSetTransparant;

//Resets the navigation bar colors
-(void)methodNavigationBarResetColors;


@end
