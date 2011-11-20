//
//  Account.m
//  taedium
//
//  Created by Jason Voll on 10/20/11.
//  Copyright (c) 2011 Mozilla. All rights reserved.
//

#import "Account.h"
#import "APICaller.h"
#import "GlobalStore.h"
#import "GTMStringEncoding.h"
#import "SBJsonParser.h"
#import "NSObject+SBJson.h"

@implementation Account

@synthesize username;
@synthesize password;
@synthesize email;
@synthesize dateJoined;
@synthesize dob;
@synthesize lastLogin;

// Constructors
-(Account*) init {
    self = [super init];
    return self;
}

-(Account*) initWithUsername: (NSString*) u password: (NSString*) p {
    self = [super init];
    if(self) {
        [self setUsername:u];
        [self setPassword:p];
    }
    return self;
}

-(Account*) initWithUsername: (NSString*) u password: (NSString*) p email:(NSString*) e dob:(NSString *)d {
    self = [super init];
    if(self) {
        [self setUsername: u];
        [self setPassword: p];
        [self setEmail: e];
        [self setDob:d];
    }
    return self;
}

-(Account* )copyWithZone:(NSZone *)zone {
    return self;
}

// checks to see if login information is valid
- (void)loginAccount {
    NSString *address = [NSString stringWithFormat:@"%@/%@", @"http://taedium.me/api/users", self.username];
    
    NSURL *url = [NSURL URLWithString:address];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    NSString *userpass = [NSString stringWithFormat:@"%@:%@", self.username, self.password];    
    
    NSString *encodedUserpass = [[GTMStringEncoding rfc4648Base64WebsafeStringEncoding] encodeString:userpass];
    
    NSString *header = [NSString stringWithFormat:@"%@%@", @"Basic ", encodedUserpass];
    [request setValue:header forHTTPHeaderField:@"authorization"];    
    
    GTMHTTPFetcher* loginFetcher = [GTMHTTPFetcher fetcherWithRequest:request];
    [loginFetcher beginFetchWithDelegate:self
                       didFinishSelector:@selector(loginCallback:finishedWithData:error:)];
}

- (void)loginCallback:(GTMHTTPFetcher *)fetcher finishedWithData:(NSData *)retrievedData error:(NSError *)error {

    if (error != nil) {
        // failed; either an NSURLConnection error occurred, or the server returned
        // TODO handle this
        int status = [error code];
    } else {
        // fetch succeeded
        NSString* jsonString = [[NSString alloc] initWithData:retrievedData
                                                 encoding:NSUTF8StringEncoding];
        
        // Parse json into usable form
        SBJsonParser *jsonParser = [SBJsonParser new];        
        NSDictionary *accountInfo = [jsonParser objectWithString:jsonString error:nil];

        // Set returned info and status
        [self setEmail: [accountInfo objectForKey:@"email"]];
        [self setDob: [accountInfo objectForKey:@"date_of_birth"]];
        [self setDateJoined: [accountInfo objectForKey:@"date_joined"]];
        [self setLastLogin: [accountInfo objectForKey:@"last_login"]];
        [[GlobalStore getInstance] setLoggedIn:YES];
    }
}

-(void)registerAccount {
    NSString *address = @"http://taedium.me/api/users";
    NSURL *url = [NSURL URLWithString:address];

    NSMutableDictionary *jsonDict = [self getDictionary];
    
    // remove last login and date joined fields
    [jsonDict removeObjectForKey:@"dateJoined"];
    [jsonDict removeObjectForKey:@"lastLogin"];
    
    // remove dob and add date_of_birth as required by api
    NSString *dob = [jsonDict objectForKey:@"dob"];
    [jsonDict removeObjectForKey:@"dob"];
    [jsonDict setObject:dob forKey:@"date_of_birth"];

    // Prepare request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];    
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"]; 
    NSData *httpDataBody = [[jsonDict JSONRepresentation] dataUsingEncoding:NSASCIIStringEncoding];
    GTMHTTPFetcher* registerFetcher = [GTMHTTPFetcher fetcherWithRequest:request];
    [request setHTTPMethod:@"POST"];
    [registerFetcher setPostData:httpDataBody];
    
    // Send request
    [registerFetcher beginFetchWithDelegate:self
                       didFinishSelector:@selector(registerCallback:finishedWithData:error:)];
}

- (void)registerCallback:(GTMHTTPFetcher *)fetcher finishedWithData:(NSData *)retrievedData error:(NSError *)error {
    
    if (error != nil) {
        // failed; either an NSURLConnection error occurred, or the server returned
        // TODO handle this
        int status = [error code];
    } else {
        // register succeeded
        
        // Set current date/time
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd-MM-yyyy HH:mm"];
        NSString *dateString = [formatter stringFromDate:[NSDate date]];

        // Set returned info and status
        [self setLastLogin: dateString];
        [self setDateJoined:dateString];
        [[GlobalStore getInstance] setLoggedIn:YES];
    }
}

//TODO: we can probably just store a dict in here and change stuff as the user changes it, small performance improvement
-(NSMutableDictionary*) getDictionary {
    NSArray *keys = [NSArray arrayWithObjects:@"username", @"password", @"email", @"dateJoined", @"dob", @"lastLogin", nil];
    if (self.username == nil) {
        self.username = @"";
    }
    if (self.password == nil) {
        self.password = @"";   
    }
    if (self.email == nil) {
        self.email = @"";
    }
    if (self.dateJoined == nil) {
        self.dateJoined = @"";
    }
    if (self.dob == nil) {
        self.dob = @"";
    }
    if (self.lastLogin == nil) {
        self.lastLogin = @"";
    }    
    NSArray *values = [NSArray arrayWithObjects:self.username, self.password, self.email, self.dateJoined, self.dob, self.lastLogin, nil];    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjects:values forKeys:keys];
    return dict;
}

+(NSArray*) getFieldNames {
    return [NSArray arrayWithObjects:@"username", @"password", @"email", @"dateJoined", @"dob", @"lastLogin", nil];
}

@end