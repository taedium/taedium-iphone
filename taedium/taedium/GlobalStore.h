//
//  GlobalStore.h
//  taedium
//
//  Created by Jason Voll on 11/19/11.
//  Copyright (c) 2011 Mozilla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"

@interface GlobalStore : NSObject {
    Account* account;
    BOOL loggedIn;
}

@property (nonatomic, copy) Account* account;
@property (nonatomic, assign) BOOL loggedIn;

+ (GlobalStore*)getInstance;
@end
