//
//  RegisterViewController.h
//  taedium
//
//  Created by Jason Voll on 11/6/11.
//  Copyright (c) 2011 Mozilla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *tfUsername;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;
@property (weak, nonatomic) IBOutlet UITextField *tfPasswordRetype;
@property (weak, nonatomic) IBOutlet UITextField *tfEmail;
@property (weak, nonatomic) IBOutlet UIDatePicker *dpDOB;
@property (weak, nonatomic) IBOutlet UIButton *btRegister;

// TODO Left off after adding outlets, getting ready to create an account object
// and setup the register call to the server.

@end
