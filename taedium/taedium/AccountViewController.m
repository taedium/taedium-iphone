//
//  AccountViewController.m
//  taedium
//
//  Created by Jason Voll on 10/18/11.
//  Copyright (c) 2011 Mozilla. All rights reserved.
//

#import "AccountViewController.h"
#import "Account.h"

@implementation AccountViewController
@synthesize tfUsername;
@synthesize tfPassword;
@synthesize btLogin;

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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

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
    // TODO assign a member variable (Account), make it persist in the app,
    // use actual data from the form
    NSString *username = [tfUsername text];
    NSString *password = [tfPassword text];
    Account* account = [[Account alloc] initWithUsername:username password:password email: @"me@you.com"];
    if ([account loginAccount]) {
        printf("login succeeded");
    } else {
        printf("login failed");
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.tfUsername) {
        [self.tfPassword becomeFirstResponder];
    }
    else if (textField == self.tfPassword) {
        [textField resignFirstResponder];
        [self login:(self)];
    }
    else {
        [textField resignFirstResponder];
    }
    return NO;
}
@end
