//
//  LayerFunViewController.h
//  LayerFun
//
//  Created by Geoff Shannon on 7/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LayerFunViewController : UIViewController {
    IBOutlet UISlider *slider;
    NSInteger sliderVal;
}

@property (nonatomic, assign) NSInteger sliderVal;
- (IBAction)buttonPressed:(id)sender;
- (void)changeSublayersToColor:(UIColor *)color;

@end

