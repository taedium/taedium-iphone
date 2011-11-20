//
//  RegisterViewController.m
//  taedium
//
//  Created by Jason Voll on 11/6/11.
//  Copyright (c) 2011 Mozilla. All rights reserved.
//

#import "RegisterViewController.h"
#import "GlobalStore.h"

@implementation RegisterViewController
@synthesize tfUsername;
@synthesize tfPassword;
@synthesize tfPasswordRetype;
@synthesize tfEmail;
@synthesize dpDOB;
@synthesize btRegister;

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
    
    [[GlobalStore getInstance] setAccount:[[Account alloc] initWithUsername:tfUsername.text 
                                                                   password:tfPassword.text email:tfEmail.text dob:formattedDate]];
    // call register API
    [[[GlobalStore getInstance] account] registerAccount];
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
