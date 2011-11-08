//
//  AccountInfoViewController.h
//  taedium
//
//  Created by Jason Voll on 11/7/11.
//  Copyright (c) 2011 Mozilla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Account.h"

@interface AccountInfoViewController : UIViewController {
    Account *account;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) Account *account;

-(id) initWithAccount: (Account*) account;
@end
