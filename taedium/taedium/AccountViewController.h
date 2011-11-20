//
//  AccountViewController.h
//  taedium
//
//  Created by Jason Voll on 10/18/11.
//  Copyright (c) 2011 Mozilla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Account.h"
#import "RegisterViewController.h"
#import "AccountInfoViewController.h"

@interface AccountViewController : UIViewController {
    IBOutlet UINavigationController* accountNavigationController;
    //__weak IBOutlet UINavigationItem *accountNavController;
    RegisterViewController *registerViewController;
    AccountInfoViewController *acccountInfoViewController;
}
@property (weak, nonatomic) IBOutlet UITextField *tfUsername;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;
@property (weak, nonatomic) IBOutlet UIButton *btLogin;
@property (weak, nonatomic) IBOutlet UIButton *btRegister;

@property (nonatomic, retain) RegisterViewController *registerViewController;
@property (nonatomic, retain) AccountInfoViewController *accountInfoViewController;

- (IBAction)login:(id)sender;
- (IBAction)register:(id)sender;

- (void) observeValueForKeyPath:(NSString *)keyPath 
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context;

- (void) showAccountInfo;
@end
