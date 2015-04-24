//
//  ChatData.h
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/19/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChatData : NSObject
@property (nonatomic, readwrite) int user_id;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *avatar_url;
@property (nonatomic, strong) NSString *message;
- (void)loadWithDictionary:(NSDictionary *)dict;
@end
