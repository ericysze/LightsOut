//
//  LOTestBoardViewController.m
//  LightsOut
//
//  Created by Eric Sze on 1/3/17.
//  Copyright © 2017 ES Apps. All rights reserved.
//

#import "LOTestBoardViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface LOTestBoardViewController ()

@end

@implementation LOTestBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // the point of the game is to turn off all the lights that are in a 5x5 grid

    // create a mutable array to add 'light buttons to'
    NSMutableArray *lightArray = [[NSMutableArray alloc] init];
    
    CGFloat viewWidth = self.view.bounds.size.width;
    CGFloat viewHeight = self.view.bounds.size.height;
    
    CGFloat buttonWidthAndHeight = viewWidth / 5;
    
    CGFloat x = self.view.bounds.origin.x;
    CGFloat y = (viewHeight - viewWidth) / 2;
    
    for (int i = 1; i < 26; i++) {
        // create a 25 'light button' array
        UIButton *lightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [lightButton addTarget:self action:@selector(lightAction:) forControlEvents:UIControlEventTouchUpInside];
        [lightButton setTag:i];
        
        [lightArray addObject:lightButton];
        
        
        // setup UI for each light button
        [[lightButton layer] setBorderWidth:1.0f];
        [[lightButton layer] setBorderColor:[UIColor whiteColor].CGColor];
        [[lightButton layer] setBackgroundColor:[UIColor blackColor].CGColor];
        
        // on the view, make each 'light button' a square
        [lightButton setFrame:CGRectMake(x, y, buttonWidthAndHeight, buttonWidthAndHeight)];
        
        [self.view addSubview:lightButton];
        
        // on the view, achieve a 5x5 square of 'light buttons'
        x += buttonWidthAndHeight;
        // for every 5 buttons created set x back to 0 add 'buttonWidthAndHeight' to y
        if (i % 5 == 0) {
            x = 0;
            y += buttonWidthAndHeight;
        }
    }
}

- (void)lightAction:(id)sender {
    NSLog(@"light button tapped");
}

@end
