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

@property (nonatomic) NSURLSessionDownloadTask *sessionDownloadTask;

@end


@implementation NetworkConnectivityClass

#pragma mark Table Section network methods
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

-(void)methodReturnImage:(NSString *)stringImageUrl completion:(void (^)(UIImage *))completion{
    
    if (stringImageUrl == nil){
        return;
    }
    
    NSURL *url = [[NSURL alloc] initWithString:stringImageUrl];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    self.sessionDownloadTask = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        NSData *data = [[NSData alloc] initWithContentsOfURL:location];
        UIImage *image = [[UIImage alloc] initWithData:data];
        
        //Go back to main thread.. tell them we have what we need
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(image);
        });
    }];
    
    [self.sessionDownloadTask resume];
    
}

-(NSURLSessionTaskState)methodCheckIfSessionIsRunning{
    return [self.sessionDownloadTask state];
}

//Used for when the cell is removed from the screen
-(void)methodCancelNetworkRequest{
    [self.sessionDownloadTask cancel];
}

#pragma mark - Login Section Network Methods
-(void)methodLogin:(NSString *)stringToLogin withUserName:(NSString *)stringUsername withPassword:(NSString *)stringPassword completion:(void(^)(NSDictionary *))completion{
    
    NSURL *urlToLogIn = [NSURL URLWithString:stringToLogin];
    
    NSURLSession *defaultSession = [NSURLSession sharedSession];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:urlToLogIn];
    
    //Creating the parameter
    NSString *stringParameter = [NSString stringWithFormat:@"username=%@&password=%@", stringUsername, stringPassword];    
    //Test to see the only login that works
    //NSString *stringParameter = @"username=SuperBoise&password=qwerty";
    
    //Set http to POST
    [request setHTTPMethod:@"POST"];
    
    //Add parameter to body (usint NSUTF8String since that is what this web server asks for)
    [request setHTTPBody:[stringParameter dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSessionDataTask *task = [defaultSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSLog(@"Response.. %@", response);
        NSLog(@"Error.. %@", error);
        
        if (error == nil){
            dispatch_async(dispatch_get_main_queue(), ^{
                NSDictionary *returnedData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                NSLog(@"data.. %@", returnedData);
                completion(returnedData);

            });
        }
        
    }];
    
    [task resume];
    
}





@end
