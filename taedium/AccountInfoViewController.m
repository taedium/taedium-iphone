//
//  AccountInfoViewController.m
//  taedium
//
//  Created by Jason Voll on 11/7/11.
//  Copyright (c) 2011 Mozilla. All rights reserved.
//

#import "AccountInfoViewController.h"
#import "GlobalStore.h"

@implementation AccountInfoViewController

@synthesize displayKeys;
@synthesize accountDict;

- (id)init
{
    self = [super initWithNibName:@"AccountInfoViewController" bundle:[NSBundle mainBundle]];
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
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
    [self setDisplayKeys: [Account getFieldNames]];
    [self setAccountDict: [[[GlobalStore getInstance] account] getDictionary]];
    self.title = @"Account Information";

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // There is only one section.    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows our table needs
    return [displayKeys count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *tableCell = [tableView dequeueReusableCellWithIdentifier:@"TableIdentifier"];
    if (tableCell == nil) {
        tableCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"TableIdentifier"];
    }
    
    NSString* key = [displayKeys objectAtIndex:indexPath.row];

    // TODO lookup string values in some nice internationalized xml file or however iOS does it
    tableCell.textLabel.text = key;
    tableCell.detailTextLabel.text = [self.accountDict objectForKey:key];
    
    return tableCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *message = [NSString stringWithFormat:@"You selected %@", [displayKeys objectAtIndex:indexPath.row]];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Work bitch!" message:message delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
    [alert show];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
