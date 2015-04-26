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

#define TABLE_CELL_HEIGHT 45.0f


@interface ChatSectionViewController ()
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *loadedChatData;
@end

@implementation ChatSectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.loadedChatData = [[NSMutableArray alloc] init];
    
    NetworkConnectivityClass *networkConnectivityClassInstance = [NetworkConnectivityClass new];
    
    //Weak self for block
    __weak ChatSectionViewController *weakVersionOfSelf = self;
    
    [networkConnectivityClassInstance methodReturnTableViewMessages:^(NSMutableArray *returnedArrayWithMessages) {
        weakVersionOfSelf.loadedChatData = returnedArrayWithMessages;
        [weakVersionOfSelf.tableView reloadData];
    }];
    
    self.navigationController.navigationBar.translucent = NO;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:NO];

}

//Removed this method to the modal layer.. was called in viewDidLoad
- (void)loadJSONData
{

    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender
{
    MainMenuViewController *mainMenuViewController = [[MainMenuViewController alloc] init];
    [self.navigationController pushViewController:mainMenuViewController animated:YES];
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"ChatCell";
    ChatCell *cell = nil;

    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:self options:nil];
        cell = (ChatCell *)[nib objectAtIndex:0];
    }

    ChatData *chatData = [self.loadedChatData objectAtIndex:[indexPath row]];

    [cell loadWithData:chatData];

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
@end
