//
//  TaediumAppDelegate.h
//  taedium
//
//  Created by Jason Voll on 10/18/11.
//  Copyright (c) 2011 Mozilla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaediumAppDelegate : UIResponder <UIApplicationDelegate> {
    IBOutlet UITabBarController*  mainTabBarController;
    
//    UITabBarController* tabBarController;
//    UIWindow* window;
}

@property (strong, nonatomic) UIWindow *window;

//@property (nonatomic, retain) IBOutlet UIWindow * window;
//@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
