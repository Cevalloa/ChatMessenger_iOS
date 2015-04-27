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



#pragma mark ChatSectionViewController network methods
-(void)methodReturnTableViewMessages:(void(^) (NSMutableArray *))completion;

-(void)methodReturnImage:(NSString *)stringImageUrl completion:(void(^) (UIImage *))completion;

-(NSURLSessionTaskState)methodCheckIfSessionIsRunning;

-(void)methodCancelNetworkRequest;

-(void)methodLogin:(NSString *)stringToLogin withUserName:(NSString *)stringUsername withPassword:(NSString *)stringPassword completion:(void(^)(NSDictionary *))completion;



@end
