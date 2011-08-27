//
//  LayerFunViewController.m
//  LayerFun
//
//  Created by Geoff Shannon on 7/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LayerFunViewController.h"

#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>

@implementation LayerFunViewController

@synthesize sliderVal;

- (void)changeSublayersToColor:(CGColorRef)color {
    CALayer *layer = self.view.layer;
    
    for (CALayer *sublayer in [layer sublayers]) {
        if ([sublayer cornerRadius] != (CGFloat)0.0) {
            sublayer.backgroundColor = color;
        }
    }
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    int i;
    
    [super viewDidLoad];
    CALayer *layer = [[self view] layer];
    NSLog(@"Main layer: %@", layer);
   
    NSLog(@"Frame: %@", NSStringFromCGRect([layer frame]));

    //NSLog(@"anchorPoint: %@", [layer anchorPoint]);
    layer.backgroundColor = [[UIColor whiteColor] CGColor];
    
    // make a couple of sublayers that are the 'opposite' color
    CALayer *sublayer;
    for (i = 0; i < 5; ++i) {
        NSLog(@"Making layer %d", i);
        sublayer = [CALayer layer];
        sublayer.bounds = CGRectMake(0.0, 0.0, 20.0, 30.0);
        sublayer.position = CGPointMake(80 + 40.0 * (float)i, 50.0);
        sublayer.cornerRadius = (CGFloat)10.0;
        NSLog(@"frame: %@", NSStringFromCGRect([sublayer frame]));
        sublayer.backgroundColor = [[UIColor blackColor] CGColor];

        [layer addSublayer:sublayer];
    }
    [layer layoutSublayers];
}

- (IBAction)updateColors {
    CGFloat red = [sliderRed value];
    CGFloat green = [sliderGreen value];
    CGFloat blue = [sliderBlue value];
    
    // Make a new color and change the main layer's background
    self.view.layer.backgroundColor = [[UIColor colorWithRed:red
                                                       green:green
                                                        blue:blue
                                                       alpha:1.0] CGColor];
    //NSLog(@"Red: %f\nGreen: %f\nBlue: %f\n", red, green, blue);
    [self changeSublayersToColor:[[UIColor colorWithRed:(CGFloat)(1.0 - red)
                                                  green:(CGFloat)(1.0 - green)
                                                   blue:(CGFloat)(1.0 - blue)
                                                  alpha:1.0] CGColor]];
    // Then invert the color (somehow) and change the sublayers
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return YES;
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
