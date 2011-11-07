//
//  APICaller.m
//  taedium
//
//  Created by Jason Voll on 10/20/11.
//  Copyright (c) 2011 Mozilla. All rights reserved.
//

#import "APICaller.h"
#import "GTMStringEncoding.h"
#import "GTMHTTPFetcher.h"

@implementation APICaller

+ (APICaller *) getInstance {
    static APICaller *instance;
    
    @synchronized(self)
    {
        if (!instance)
            instance = [[APICaller alloc] init];
        
        return instance;
    }
}

- (BOOL)checkLogin:(Account *)account {
    printf("test test test");
    NSString *address = [NSString stringWithFormat:@"%@/%@", @"http://taedium.me/api/users", account.username];
    
    NSURL *url = [NSURL URLWithString:address];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    NSString *userpass = [NSString stringWithFormat:@"%@:%@", account.username, account.password];    

    NSString *encodedUserpass = [[GTMStringEncoding rfc4648Base64WebsafeStringEncoding] encodeString:userpass];
    
    NSString *header = [NSString stringWithFormat:@"%@%@", @"Basic ", encodedUserpass];
    [request setValue:header forHTTPHeaderField:@"authorization"];    
    
    GTMHTTPFetcher* myFetcher = [GTMHTTPFetcher fetcherWithRequest:request];
    [myFetcher beginFetchWithDelegate:self
                    didFinishSelector:@selector(myFetcher2:finishedWithData:error:)];
    
    return true;
}

- (void)myFetcher:(GTMHTTPFetcher *)fetcher finishedWithData:(NSData *)retrievedData error:(NSError *)error {
    printf("got callback");
    int status = [error code];
    if (error != nil) {
        // failed; either an NSURLConnection error occurred, or the server returned
        // a status value of at least 300
        //
        // the NSError domain string for server status errors is kGTMHTTPFetcherStatusDomain
        int status = [error code];
    } else {
        // fetch succeeded
        NSString* newStr = [[NSString alloc] initWithData:retrievedData
                                                 encoding:NSUTF8StringEncoding];

        
    }
}

- (void)myFetcher2:(GTMHTTPFetcher *)fetcher finishedWithData:(NSData *)retrievedData error:(NSError *)error {
    printf("got callback");
    int status = [error code];
    if (error != nil) {
        // failed; either an NSURLConnection error occurred, or the server returned
        // a status value of at least 300
        //
        // the NSError domain string for server status errors is kGTMHTTPFetcherStatusDomain
        int status = [error code];
    } else {
        // fetch succeeded
        NSString* newStr = [[NSString alloc] initWithData:retrievedData
                                                 encoding:NSUTF8StringEncoding];
        
        
    }
}

- (BOOL)registerNewUser:(Account *)account {
    return true;
}
@end
