//
//  AccountViewController.h
//  taedium
//
//  Created by Jason Voll on 10/18/11.
//  Copyright (c) 2011 Mozilla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *tfUsername;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;
@property (weak, nonatomic) IBOutlet UIButton *btLogin;

- (IBAction)login:(id)sender;

@end
