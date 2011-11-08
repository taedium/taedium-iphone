//
//  AccountInfoViewController.m
//  taedium
//
//  Created by Jason Voll on 11/7/11.
//  Copyright (c) 2011 Mozilla. All rights reserved.
//

#import "AccountInfoViewController.h"

@implementation AccountInfoViewController

@synthesize tableView;
@synthesize account;

- (id)initWithAccount:(Account *)initAccount
{
    self = [super initWithNibName:@"AccountInfoViewController" bundle:[NSBundle mainBundle]];
    self.title = @"Account Information";
    [self setAccount:initAccount];
    return self;
}

- (void) setAccount:(Account *)newAccount
{
    self.account = newAccount;
    // TODO left off here trying to get table view setup
    // http://developer.apple.com/library/ios/#documentation/userexperience/conceptual/TableView_iPhone/CreateConfigureTableView/CreateConfigureTableView.html#//apple_ref/doc/uid/TP40007451-CH6-SW10
    //tableView setDataSource:<#(id<UITableViewDataSource>)#>
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
