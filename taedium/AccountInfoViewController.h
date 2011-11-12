//
//  AccountInfoViewController.h
//  taedium
//
//  Created by Jason Voll on 11/7/11.
//  Copyright (c) 2011 Mozilla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Account.h"

@interface AccountInfoViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    Account *account;
    NSArray *displayKeys;
}

//@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) Account *account;
@property (nonatomic, retain) NSArray *displayKeys;

-(id) initWithAccount: (Account*) account;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end
