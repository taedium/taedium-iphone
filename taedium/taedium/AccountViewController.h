//
//  AccountViewController.h
//  taedium
//
//  Created by Jason Voll on 10/18/11.
//  Copyright (c) 2011 Mozilla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Account.h"

@interface AccountViewController : UIViewController {
    Account *account;
}
@property (weak, nonatomic) IBOutlet UITextField *tfUsername;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;
@property (weak, nonatomic) IBOutlet UIButton *btLogin;
@property (nonatomic, strong) Account *account;

- (IBAction)login:(id)sender;
- (void) observeValueForKeyPath:(NSString *)keyPath 
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context;

@end
