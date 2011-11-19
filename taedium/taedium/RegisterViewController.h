//
//  RegisterViewController.h
//  taedium
//
//  Created by Jason Voll on 11/6/11.
//  Copyright (c) 2011 Mozilla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Account.h"
#import "AccountInfoViewController.h"

@interface RegisterViewController : UIViewController {
    Account *account;
    AccountInfoViewController *acccountInfoViewController;
}

@property (strong, nonatomic) Account *account;
@property (strong, nonatomic) AccountInfoViewController *accountInfoViewController;
@property (weak, nonatomic) IBOutlet UITextField *tfUsername;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;
@property (weak, nonatomic) IBOutlet UITextField *tfPasswordRetype;
@property (weak, nonatomic) IBOutlet UITextField *tfEmail;
@property (weak, nonatomic) IBOutlet UIDatePicker *dpDOB;
@property (weak, nonatomic) IBOutlet UIButton *btRegister;


- (IBAction)register:(id)sender;
- (void) observeValueForKeyPath:(NSString *)keyPath 
                       ofObject:(id)object
                         change:(NSDictionary *)change
                        context:(void *)context;

- (void) showAccountInfo;

@end
