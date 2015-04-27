//
//  TableSectionTableViewCell.m
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import "ChatCell.h"
#import <QuartzCore/QuartzCore.h>

@interface ChatCell ()
@property (nonatomic, strong) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewAvatar;
@property (weak, nonatomic) IBOutlet UILabel *labelMessageContent;



@end

@implementation ChatCell

#pragma mark - Class Methods
//Used to return cell height
+ (CGFloat)heightForMessageCell:(ChatData *)data {
    const CGFloat topMargin = 20.0f;
    const CGFloat bottomMargin = 40.0f;
    const CGFloat minHeight = 90.0f;
    
    UIFont *font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    //Get the size
    CGRect boundingBox = [data.message boundingRectWithSize:CGSizeMake(202, CGFLOAT_MAX) options:(NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName: font} context:nil];
    
    return MAX(minHeight, CGRectGetHeight(boundingBox) + topMargin + bottomMargin);
}

- (void)loadWithData:(ChatData *)chatData
{
    //Sets up the text for the cell
    [self methodSetupText:chatData];
    
    //Sets up the image for the cell
    [self methodSetupImage:chatData];
}

#pragma mark - UI Element Setup Methods
-(void)methodSetupText:(ChatData *)chatData{
    self.usernameLabel.text = chatData.username;
    
    [self.usernameLabel setFont:[UIFont fontWithName:@"Machinato" size:19]];
    
    
    self.labelMessageContent.text = chatData.message;
    
    [self.labelMessageContent setFont:[UIFont fontWithName:@"Machinato-Light" size:15]];
}

-(void)methodSetupImage:(ChatData *)chatData{
    
    //Used to prevent the "cycling" of images on fast scroll
    self.imageViewAvatar.image = nil;
    self.imageViewAvatar.layer.cornerRadius = 25;
    self.imageViewAvatar.layer.masksToBounds = YES;
   // self.imageViewAvatar.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    if (chatData.imageOfMessage){
        self.imageViewAvatar.image = chatData.imageOfMessage;
    }else{
        
        self.networkConnectivityClassInstance = [NetworkConnectivityClass new];
        
        //weak version of self for block
        __weak ChatCell *weakVersionOfSelf = self;
        
        [self.networkConnectivityClassInstance methodReturnImage:chatData.avatar_url completion:^(UIImage *returnedImage) {
            weakVersionOfSelf.imageViewAvatar.image = returnedImage;
            chatData.imageOfMessage = returnedImage;
        }];
    }
    
}


@end
