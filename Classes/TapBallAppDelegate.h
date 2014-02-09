//
//  TapBallAppDelegate.h
//  TapBall
//
//  Created by Emir on 1/15/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TapBallViewController;

@interface TapBallAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TapBallViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TapBallViewController *viewController;

@end

