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

static NSString *colorList[8] = {@"redColor", @"orangeColor",
                                 @"yellowColor", @"greenColor",
                                 @"cyanColor", @"blueColor",
                                 @"purpleColor", @"magentaColor"};

@implementation LayerFunViewController

@synthesize sliderVal;

- (IBAction)buttonPressed:(id)sender {
    UIButton *button = (UIButton *)sender;
    
    NSLog(@"%@ button pressed", button.titleLabel.text);

    SEL mySel = NSSelectorFromString(colorList[self.sliderVal]);
    
    self.view.layer.backgroundColor = [[UIColor performSelector:mySel] CGColor];
    
    mySel = NSSelectorFromString(colorList[(self.sliderVal + 4) % 8]);
    [self changeSublayersToColor:[UIColor performSelector:mySel]];
}

- (void)changeSublayersToColor:(UIColor *)color {
    CALayer *layer = self.view.layer;
    
    for (CALayer *sublayer in [layer sublayers]) {
        if ([sublayer cornerRadius] != (CGFloat)0.0) {
            sublayer.backgroundColor = [color CGColor];
        }
    }
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    int i;
    
    [super viewDidLoad];
    CALayer *layer = [[self view] layer];
    NSLog(@"Main layer: %@", layer);
    NSLog(@"Bounds: %@", NSStringFromCGRect([layer bounds]));

    [slider addObserver:self forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:nil];
    
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

- (void)observeValueForKeyPath:(NSString *)keyPath 
                      ofObject:(id)object 
                        change:(NSDictionary *)change 
                       context:(void *)context {
    if ([keyPath isEqual: @"value"]) {
        if ([[change objectForKey:NSKeyValueChangeKindKey] intValue] == NSKeyValueChangeSetting) {
            id newValue = [change objectForKey:NSKeyValueChangeNewKey];
            self.sliderVal = [newValue intValue];
        } else {
            NSLog(@"Not the right kind of change message");
        }

    } else {
        NSLog(@"Got an unexpected observer message");
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }

}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
