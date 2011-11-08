//
//  AccountNavController.m
//  taedium
//
//  Created by Jason Voll on 11/6/11.
//  Copyright (c) 2011 Mozilla. All rights reserved.
//

#import "AccountNavController.h"

@implementation AccountNavController
@synthesize NavBar;

- (void)viewDidUnload {
    [self setNavBar:nil];
    [super viewDidUnload];
}
@end
