//
//  APICaller.h
//  taedium
//
//  Created by Jason Voll on 10/20/11.
//  Copyright (c) 2011 Mozilla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"
#import "GTMHTTPFetcher.h"

@interface APICaller : NSObject {
    NSMutableData *responseData;
}

+ (APICaller *) getInstance;

- (BOOL) checkLogin:(Account*)account;
- (BOOL) registerNewUser:(Account*)account;
- (void) myFetcher:(GTMHTTPFetcher *)fetcher finishedWithData:(NSData *)retrievedData error:(NSError *)error;

@end
