//
//  Account.m
//  taedium
//
//  Created by Jason Voll on 10/20/11.
//  Copyright (c) 2011 Mozilla. All rights reserved.
//

#import "Account.h"
#import "APICaller.h"

@implementation Account
@synthesize username = _username;
@synthesize password = _password;
@synthesize email = _email;

// define constructor
-(Account*) initWithUsername: (NSString*) u password: (NSString*) p email:(NSString*) e {
    self = [super init];
    if(self) {
        [self setUsername: u];
        [self setPassword: p];
        [self setEmail: e];
    }
    return self;
}
    
-(BOOL)loginAccount {
    //return [APICaller checkLogin:self];
    [[APICaller getInstance] checkLogin:self];
}

-(BOOL)registerAccount {
    //return [APICaller registerNewUser:self];
}
@end