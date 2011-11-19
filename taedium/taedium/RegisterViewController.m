//
//  RegisterViewController.m
//  taedium
//
//  Created by Jason Voll on 11/6/11.
//  Copyright (c) 2011 Mozilla. All rights reserved.
//

#import "RegisterViewController.h"

@implementation RegisterViewController
@synthesize tfUsername;
@synthesize tfPassword;
@synthesize tfPasswordRetype;
@synthesize tfEmail;
@synthesize dpDOB;
@synthesize btRegister;
@synthesize account;
@synthesize accountInfoViewController;

- (id)init
{
    self = [super initWithNibName:@"Register" bundle:[NSBundle mainBundle]];
    self.title = @"Register";
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
/*- (void)loadView
{
    self.title = @"Register";
}*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIScrollView *tempScrollView=(UIScrollView *)self.view;
    tempScrollView.contentSize=CGSizeMake(320,500);
}


- (void)viewDidUnload
{
    [self setTfUsername:nil];
    [self setTfPassword:nil];
    [self setTfPasswordRetype:nil];
    [self setTfEmail:nil];
    [self setDpDOB:nil];
    [self setBtRegister:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)register:(id)sender {
    NSDate * date = dpDOB.date;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM/dd/YYYY"];
    NSString *formattedDate = [dateFormat stringFromDate:date];

    [self setAccount:[[Account alloc] initWithUsername:tfUsername.text 
                      password:tfPassword.text email:tfEmail.text dob:formattedDate]];


    // add observer for loginVerified property
    [account addObserver:self forKeyPath:@"loginVerified" options:NSKeyValueObservingOptionNew context:NULL];
    
    // call register API
    [account registerAccount];
    

}

-(void) observeValueForKeyPath:(NSString *)keyPath 
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    // Registration succeeded
    if (keyPath == @"loginVerified") {
        
        // Needed so that account display is happy
        //[account setDateJoined:[NSNumber numberWithDouble:[[NSDate date]timeIntervalSince1970]]];
        
        // Show user account info page
        [self showAccountInfo];
    }
    // TODO error handling if registration failed
}

-(void) showAccountInfo {
    
    if(self.accountInfoViewController == nil) {
        AccountInfoViewController *accountInfoController = [[AccountInfoViewController alloc] init];
        self.accountInfoViewController = accountInfoController;
    }
    
    
    
    // Set the back button to be logout
    // TODO Actually log out the user when this button is pushed
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    // Slide away keyboard and erase text fields for if we logout
    [tfUsername setText:@""];
    [tfPassword setText:@""];
    [tfUsername resignFirstResponder];
    [tfPassword resignFirstResponder];
    
    [self.accountInfoViewController setAccount:self.account];
    
    [self.navigationController pushViewController:self.accountInfoViewController animated: YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.tfUsername) {
        [self.tfPassword becomeFirstResponder];
    }
    else if (textField == self.tfPassword) {
        [self.tfPasswordRetype becomeFirstResponder];
    }
    else if (textField == self.tfPasswordRetype) {
        [self.tfEmail becomeFirstResponder];
    }
    else if (textField == self.tfEmail) {
        [textField resignFirstResponder];
    }
    else {
        [textField resignFirstResponder];
    }
    return NO;
}


@end
