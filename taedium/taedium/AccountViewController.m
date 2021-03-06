//
//  AccountViewController.m
//  taedium
//
//  Created by Jason Voll on 10/18/11.
//  Copyright (c) 2011 Mozilla. All rights reserved.
//

#import "AccountViewController.h"
#import "GlobalStore.h"
#import "Account.h"
#import "RegisterViewController.h"

@implementation AccountViewController
@synthesize tfUsername;
@synthesize tfPassword;
@synthesize btLogin;
@synthesize btRegister;
@synthesize registerViewController;
@synthesize accountInfoViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    // TODO add support for a persistent account
    
    // add this as an observer for when loggedIn state has changed
    [[GlobalStore getInstance] addObserver:self forKeyPath:@"loggedIn" options:NSKeyValueObservingOptionNew context:NULL];
}


- (void)viewDidUnload
{
    [self setTfUsername:nil];
    [self setTfPassword:nil];
    [self setBtLogin:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)login:(id)sender {

    NSString *username = [tfUsername text];
    NSString *password = [tfPassword text];

    Account* account = [[Account alloc] initWithUsername:username password:password];
    [[GlobalStore getInstance] setAccount: account];
    [[[GlobalStore getInstance] account] loginAccount];
}

- (IBAction)register:(id)sender {
    
    RegisterViewController *regController = [[RegisterViewController alloc] init];
    self.registerViewController = regController;    
    [self.navigationController pushViewController:self.registerViewController animated: YES];

}

-(void) observeValueForKeyPath:(NSString *)keyPath 
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    
    BOOL loggedIn = [[GlobalStore getInstance] loggedIn];
    
    if (keyPath == @"loggedIn" && loggedIn) {
        [self showAccountInfo];
    }
}

-(void) showAccountInfo 
{
    AccountInfoViewController *accountInfoController = [[AccountInfoViewController alloc] init];
    self.accountInfoViewController = accountInfoController;
    
    // Set the back button to be logout
    // TODO Actually log out the user when this button is pushed
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;

    // Slide away keyboard and erase text fields for if we logout
    [tfUsername setText:@""];
    [tfPassword setText:@""];
    [tfUsername resignFirstResponder];
    [tfPassword resignFirstResponder];
    
    [self.navigationController popToRootViewControllerAnimated: NO];
    [self.navigationController pushViewController:self.accountInfoViewController animated: YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.tfUsername) {
        [self.tfPassword becomeFirstResponder];
    }
    else if (textField == self.tfPassword) {
        [textField resignFirstResponder];        
        [btLogin sendActionsForControlEvents:UIControlEventTouchUpInside];
    }
    else {
        [textField resignFirstResponder];
    }
    return NO;
}

@end
