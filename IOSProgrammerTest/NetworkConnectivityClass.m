//
//  NetworkConnectivityClass.m
//  IOSProgrammerTest
//
//  Created by Alex Cevallos on 4/25/15.
//  Copyright (c) 2015 AppPartner. All rights reserved.
//

#import "NetworkConnectivityClass.h"
#import "ChatData.h"

@interface NetworkConnectivityClass()


@end


@implementation NetworkConnectivityClass

-(void)methodReturnTableViewMessages:(void (^)(NSMutableArray *))completion{
    
    dispatch_queue_t queueForJSON = dispatch_queue_create("queueForJSON", NULL);
    
    dispatch_async(queueForJSON, ^{
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"chatData" ofType:@"json"];
        
        NSError *error = nil;
        
        NSData *rawData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
        
        id JSONData = [NSJSONSerialization JSONObjectWithData:rawData options:NSJSONReadingAllowFragments error:&error];
        
        NSMutableArray *loadedChatData = [NSMutableArray new];
        
        [loadedChatData removeAllObjects];
        if ([JSONData isKindOfClass:[NSDictionary class]])
        {
            //No need to allocate more memory space
            //   NSDictionary *jsonDict = (NSDictionary *)JSONData;
            
            NSArray *loadedArray = [JSONData objectForKey:@"data"];
            if ([loadedArray isKindOfClass:[NSArray class]])
            {
                for (NSDictionary *chatDict in loadedArray)
                {
                    ChatData *chatData = [[ChatData alloc] init];
                    [chatData loadWithDictionary:chatDict];
                    [loadedChatData addObject:chatData];
                }
            }
        }

        dispatch_async(dispatch_get_main_queue(), ^{
            completion(loadedChatData);
            NSLog(@"test: %@", loadedChatData);
        });
    });
}

@end
