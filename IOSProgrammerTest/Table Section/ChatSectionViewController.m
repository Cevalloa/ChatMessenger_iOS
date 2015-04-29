//
//  TableSectionViewController.m
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import "ChatSectionViewController.h"
#import "MainMenuViewController.h"
#import "ChatCell.h"
#import "NetworkConnectivityClass.h"

//removed table cell height for a more dynamic approach
#define TABLE_CELL_HEIGHT 45.0f


@interface ChatSectionViewController ()
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *loadedChatData;
@end

@implementation ChatSectionViewController

#pragma mark - View Controller Lifecycle Methods
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.loadedChatData = [[NSMutableArray alloc] init];
    
    self.title = @"CHAT";


    
    NetworkConnectivityClass *networkConnectivityClassInstance = [NetworkConnectivityClass new];
    
    //Weak self for block
    __weak ChatSectionViewController *weakVersionOfSelf = self;
    
    [networkConnectivityClassInstance methodReturnTableViewMessages:^(NSMutableArray *returnedArrayWithMessages) {
        weakVersionOfSelf.loadedChatData = returnedArrayWithMessages;
        [weakVersionOfSelf.tableView reloadData];
    }];

    //Because we are using XIB files, we should register the NIB first
    [self.tableView registerNib:[UINib nibWithNibName:@"ChatCell" bundle:nil] forCellReuseIdentifier:@"ChatCell"];


}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:NO];

}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"ChatCell";
    

    ChatCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    //Previous code.. if statement would run everytime
    //ChatCell *cell = nil

    if (cell == nil)
    {
//        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:self options:nil];
//        cell = (ChatCell *)[nib objectAtIndex:0];
        cell = [[ChatCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    //Load in the chat data into the cell
    [cell loadWithData:[self.loadedChatData objectAtIndex:[indexPath row]]];

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.loadedChatData.count;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChatData *cc = self.loadedChatData[indexPath.row];
    return [ChatCell heightForMessageCell:cc];
}

-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Access cell's modal property to see if it is running
    if( [((ChatCell *)cell).networkConnectivityClassInstance methodCheckIfSessionIsRunning] == NSURLSessionTaskStateRunning){
        
        [((ChatCell *)cell).networkConnectivityClassInstance methodCancelNetworkRequest];

    }
}

#pragma mark - Removed Methods
//Removed this method to the modal layer.. was called in viewDidLoad
- (void)loadJSONData
{
    
    
}

//Removed this method.. navigationcontroller takes care of this
- (IBAction)backAction:(id)sender
{
    
}

@end
