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

@end
