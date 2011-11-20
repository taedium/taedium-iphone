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
    NSString *dateJoined;
    NSString *dob;
    NSString *lastLogin;
}

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *dateJoined;
@property (nonatomic, copy) NSString *dob;
@property (nonatomic, copy) NSString *lastLogin;

+(NSArray*) getFieldNames;

-(Account*) init;
-(Account*) initWithUsername: (NSString*) u password: (NSString*) p;
-(Account*) initWithUsername: (NSString*) u password: (NSString*) p email:(NSString*) e dob:(NSString*) d;
-(void) loginAccount;
-(void) registerAccount;
-(NSMutableDictionary*) getDictionary;

- (void)loginCallback:(GTMHTTPFetcher *)fetcher finishedWithData:(NSData *)retrievedData error:(NSError *)error;
- (void)registerCallback:(GTMHTTPFetcher *)fetcher finishedWithData:(NSData *)retrievedData error:(NSError *)error;

- (Account*)copyWithZone:(NSZone *)zone;

@end
