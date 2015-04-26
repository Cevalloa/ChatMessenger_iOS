//
//  TableSectionTableViewCell.h
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatData.h"
#import "NetworkConnectivityClass.h"

@interface ChatCell : UITableViewCell

//Used to access running state properties
@property (nonatomic) NetworkConnectivityClass *networkConnectivityClassInstance;

- (void)loadWithData:(ChatData *)chatData;
+ (CGFloat)heightForMessageCell:(ChatData *)data;

@end
