//
//  Account.h
//  taedium
//
//  Created by Jason Voll on 10/20/11.
//  Copyright (c) 2011 Mozilla. All rights reserved.
//

#import <Foundation/NSObject.h>

@interface Account : NSObject {
    NSString *username;
    NSString *password;
    NSString *email;
}

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *email;

-(Account*) initWithUsername: (NSString*) u password: (NSString*) p email:(NSString*) e;
-(BOOL) loginAccount;
-(BOOL) registerAccount;

@end
