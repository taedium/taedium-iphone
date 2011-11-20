//
//  AccountInfoViewController.h
//  taedium
//
//  Created by Jason Voll on 11/7/11.
//  Copyright (c) 2011 Mozilla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountInfoViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSArray* displayKeys;
    NSMutableDictionary* accountDict;
}

@property (nonatomic, copy) NSArray* displayKeys;
@property (nonatomic, copy) NSMutableDictionary* accountDict;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end
