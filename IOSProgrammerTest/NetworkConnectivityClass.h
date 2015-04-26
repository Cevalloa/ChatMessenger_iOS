//
//  NetworkConnectivityClass.h
//  IOSProgrammerTest
//
//  Created by Alex Cevallos on 4/25/15.
//  Copyright (c) 2015 AppPartner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NetworkConnectivityClass : NSObject


-(void)methodReturnTableViewMessages:(void(^) (NSMutableArray *))completion;

-(void)methodReturnImage:(NSString *)stringImageUrl completion:(void(^) (UIImage *))completion;

@end
