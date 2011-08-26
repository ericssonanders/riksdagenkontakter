//
//  riksdagenkontakterAppDelegate.h
//  riksdagenkontakter
//
//  Created by Anders Ericsson on 2011-08-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchViewNavController.h"

@interface riksdagenkontakterAppDelegate : NSObject <UIApplicationDelegate> {
    UITabBarController *rootViewController;
    SearchViewNavController *navController; 
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *rootController;
@property (nonatomic, retain) IBOutlet SearchViewNavController *navController;

@end
