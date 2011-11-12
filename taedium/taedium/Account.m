//
//  Account.m
//  taedium
//
//  Created by Jason Voll on 10/20/11.
//  Copyright (c) 2011 Mozilla. All rights reserved.
//

#import "Account.h"
#import "APICaller.h"
#import "GTMStringEncoding.h"
#import "SBJsonParser.h"

@implementation Account
@synthesize username = _username;
@synthesize password = _password;
@synthesize email = _email;
@synthesize dateJoined = _dateJoined;
@synthesize dob = _dob;
@synthesize lastLogin = _lastLogin;
@synthesize loginVerified = _loginVerified;

// Constructors
-(Account*) initWithUsername: (NSString*) u password: (NSString*) p {
    self = [super init];
    if(self) {
        [self setUsername:u];
        [self setPassword:p];
    }
    return self;
}

-(Account*) initWithUsername: (NSString*) u password: (NSString*) p email:(NSString*) e {
    self = [super init];
    if(self) {
        [self setUsername: u];
        [self setPassword: p];
        [self setEmail: e];
        [self setLoginVerified: false];
    }
    return self;
}

// checks to see if login information is valid
- (void)loginAccount {
    NSString *address = [NSString stringWithFormat:@"%@/%@", @"http://taedium.me/api/users", _username];
    
    NSURL *url = [NSURL URLWithString:address];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    NSString *userpass = [NSString stringWithFormat:@"%@:%@", _username, _password];    
    
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
        [self setLoginVerified: YES];       
    }
}

-(BOOL)registerAccount {
    //return [APICaller registerNewUser:self];
}

//TODO: we can probably just store a dict in here and change stuff as the user changes it, small performance improvement
-(NSDictionary*) getDictionary {
    NSArray *keys = [NSArray arrayWithObjects:@"username", @"password", @"email", @"dateJoined", @"dob", @"lastLogin", nil];
    NSArray *values = [NSArray arrayWithObjects:self.username, self.password, self.email, self.dateJoined, self.dob, self.lastLogin, nil];    
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:values forKeys:keys];
    return dict;
}

+(NSArray*) getFieldNames {
    // TODO figure out static stuff...since we have this same shit being used in the getDictionary method above
    return [NSArray arrayWithObjects:@"username", @"password", @"email", @"dateJoined", @"dob", @"lastLogin", nil];
}

// Only returns names of fields that we would want to display
+(NSArray*) getDisplayableFieldNames {
    // TODO figure out static stuff...since we have this same shit being used in the getDictionary method above
    return [NSArray arrayWithObjects:@"username", @"email", @"dateJoined", @"dob", @"lastLogin", nil];
}
@end