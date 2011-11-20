//
//  GlobalStore.m
//  taedium
//
//  Created by Jason Voll on 11/19/11.
//  Copyright (c) 2011 Mozilla. All rights reserved.
//

#import "GlobalStore.h"

@implementation GlobalStore
@synthesize account;
@synthesize loggedIn;

static GlobalStore* myInstance = nil;

+ (GlobalStore*) getInstance {
    
    // check to see if an instance already exists
    if (nil == myInstance) {
        myInstance  = [[[self class] alloc] init];
    }

    return myInstance;
}

@end
