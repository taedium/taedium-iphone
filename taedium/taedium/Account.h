//
//  Account.h
//  taedium
//
//  Created by Jason Voll on 10/20/11.
//  Copyright (c) 2011 Mozilla. All rights reserved.
//

#import <Foundation/NSObject.h>
#import "GTMHTTPFetcher.h"

@interface Account : NSObject {
    NSString *username;
    NSString *password;
    NSString *email;
    NSNumber *dateJoined;
    NSString *dob;
    NSNumber *lastLogin;
    BOOL loginVerified;
}

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSNumber *dateJoined;
@property (nonatomic, copy) NSString *dob;
@property (nonatomic, copy) NSNumber *lastLogin;
@property (nonatomic, assign) BOOL loginVerified;

-(Account*) initWithUsername: (NSString*) u password: (NSString*) p;
-(Account*) initWithUsername: (NSString*) u password: (NSString*) p email:(NSString*) e;
-(void) loginAccount;
-(void) registerAccount;

- (void)loginCallback:(GTMHTTPFetcher *)fetcher finishedWithData:(NSData *)retrievedData error:(NSError *)error;

@end
