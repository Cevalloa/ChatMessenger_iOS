//
//  TableSectionTableViewCell.m
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import "ChatCell.h"
#import "NetworkConnectivityClass.h"

@interface ChatCell ()
@property (nonatomic, strong) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewAvatar;
@property (weak, nonatomic) IBOutlet UILabel *labelMessageContent;

@end

@implementation ChatCell

+ (CGFloat)heightForMessageCell:(ChatData *)data {
    const CGFloat topMargin = 20.0f;
    const CGFloat bottomMargin = 40.0f;
    const CGFloat minHeight = 90.0f;
    
    UIFont *font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    //Get the size
    CGRect boundingBox = [data.message boundingRectWithSize:CGSizeMake(202, CGFLOAT_MAX) options:(NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName: font} context:nil];
    
    return MAX(minHeight, CGRectGetHeight(boundingBox) + topMargin + bottomMargin);
}


- (void)awakeFromNib
{
    // Initialization code
}

- (void)loadWithData:(ChatData *)chatData
{
    self.usernameLabel.text = chatData.username;
    
    [self.usernameLabel setFont:[UIFont fontWithName:@"Machinato" size:19]];

    
    self.labelMessageContent.text = chatData.message;
    
    [self.labelMessageContent setFont:[UIFont fontWithName:@"Machinato-Light" size:15]];

    
    
    
//    if (chatData.imageOfMessage){
//        self.imageViewAvatar.image = chatData.imageOfMessage;
//    }else{
//        NetworkConnectivityClass *networkConnectivityClassInstance = [NetworkConnectivityClass new];
//        
//        //weak version of self for block
//        __weak ChatCell *weakVersionOfSelf = self;
//        
//        [networkConnectivityClassInstance methodReturnImage:chatData.avatar_url completion:^(UIImage *returnedImage) {
//            weakVersionOfSelf.imageViewAvatar.image = returnedImage;
//            chatData.imageOfMessage = returnedImage;
//        }];
//    }
}
@end
