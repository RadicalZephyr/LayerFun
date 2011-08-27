//
//  LayerFunViewController.h
//  LayerFun
//
//  Created by Geoff Shannon on 7/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LayerFunViewController : UIViewController {
    IBOutlet UISlider *sliderGreen;
    IBOutlet UISlider *sliderRed;
    IBOutlet UISlider *sliderBlue;
}

@property (nonatomic, assign) NSInteger sliderVal;
- (void)changeSublayersToColor:(CGColorRef)color;
- (IBAction)updateColors;
@end

