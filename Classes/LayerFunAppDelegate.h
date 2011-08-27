//
//  LayerFunAppDelegate.h
//  LayerFun
//
//  Created by Geoff Shannon on 7/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LayerFunViewController;

@interface LayerFunAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    LayerFunViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet LayerFunViewController *viewController;

@end

