//
//  LOBoardViewController.m
//  LightsOut
//
//  Created by Eric Sze on 9/20/16.
//  Copyright © 2016 ES Apps. All rights reserved.
//

#import "LOBoardViewController.h"
#import "LOBoardLayout.h"
#import "LOBoardLogic.h"

#import <QuartzCore/QuartzCore.h>

@interface LOBoardViewController ()

@property (strong, nonatomic) NSMutableArray *lightArray;
//@property (strong, nonatomic) NSMutableArray *twoDimensionalLightArray;
//@property (strong, nonatomic) UIButton *light;
@property (strong, nonatomic) NSMutableArray *tagArray;

@property (nonatomic, assign) int actions;

@end

@implementation LOBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", self.lightArray);
//    self.twoDimensionalLightArray = [[NSMutableArray alloc] init];
    [self setupUI];
    NSLog(@"%@", [self.lightArray objectAtIndex:0]);
}

- (void)setupUI {
//    CGFloat width = self.view.bounds.size.width;
//
//    CGFloat xx = self.view.frame.size.width / 2;
//    CGFloat yy = self.view.frame.size.height / 2;
//    
//    UIView *lightContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
//    lightContainer.center = CGPointMake(xx, yy);
//    [[lightContainer layer] setBorderWidth:4.0f];
//    [[lightContainer layer] setBorderColor:[UIColor whiteColor].CGColor];
//    
//    [self.view addSubview:lightContainer];
//    
//    CGFloat x = lightContainer.frame.origin.x;
//    CGFloat y = lightContainer.frame.origin.y;
//    int titleNumber = 0;
//    int index = 0;
//    NSInteger lightTag = 0;
//    self.tagArray = [[NSMutableArray alloc] init];
//
//    for (int i = 0; i < 5; i++) {
//        self.lightArray = [[NSMutableArray alloc] init];
//        for (int j = 0; j < 5; j++) {
//            self.light = [UIButton buttonWithType:UIButtonTypeCustom];
//            [self.light addTarget:self action:@selector(lightAction:) forControlEvents:UIControlEventTouchUpInside];
//            
//            [self.light setFrame:CGRectMake(x, y, width / 5, width / 5)];
//            [self.light setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//            [[self.light layer] setBorderWidth:2.0f];
//            [[self.light layer] setBorderColor:[UIColor whiteColor].CGColor];
//            [[self.light layer] setBackgroundColor:[UIColor blackColor].CGColor];
//            
//            NSNumber *number = [NSNumber numberWithInt:titleNumber];
//            [self.light setTitle:[NSString stringWithFormat:@"%@", number] forState:UIControlStateNormal];
//            titleNumber++;
//            
//            
//            [self.light setTag:lightTag];
//            lightTag++;
//            [self.tagArray addObject:self.light];
//            [self.lightArray addObject:self.light];
//            
//            [self.view addSubview:self.light];
//            
//            x += width / 5;
//        }
//        [self.twoDimensionalLightArray insertObject:self.lightArray atIndex:index];
//        index++;
//        
//        x = 0;
//        y += width / 5;
//    }
//////////////////////////////////////////////////////////////////////////////
    // create a mutable array to add 'light buttons to'
//    NSMutableArray *lightArray = [[NSMutableArray alloc] init];
    
    CGFloat viewWidth = self.view.bounds.size.width;
    CGFloat viewHeight = self.view.bounds.size.height;
    
    CGFloat buttonWidthAndHeight = viewWidth / 5;
    
    CGFloat x = self.view.bounds.origin.x;
    CGFloat y = (viewHeight - viewWidth) / 2;
    
    self.lightArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 25; i++) {
        // create a 25 'light button' array
        UIButton *lightButton = [[UIButton alloc] initWithFrame:CGRectMake(x, y, buttonWidthAndHeight, buttonWidthAndHeight)];
        [lightButton addTarget:self action:@selector(lightAction:) forControlEvents:UIControlEventTouchUpInside];
        [lightButton setTag:i];
        
        [self.lightArray addObject:lightButton];
    
        NSLog(@"%ld", self.lightArray.count);
//        NSLog(@"%ld", lightButton.tag);
        
        // setup UI for each light button
        [[lightButton layer] setBorderWidth:1.0f];
        [[lightButton layer] setBorderColor:[UIColor whiteColor].CGColor];
        [[lightButton layer] setBackgroundColor:[UIColor blackColor].CGColor];
        
        [lightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [lightButton setTitle:[NSString stringWithFormat:@"%i", i] forState:UIControlStateNormal];
        
        [self.view addSubview:lightButton];
        
        // on the view, achieve a 5x5 square of 'light buttons'
        x += buttonWidthAndHeight;
        // for every 5 buttons created set x back to 0 add 'buttonWidthAndHeight' to y
        if ((i + 1) % 5 == 0) {
            x = 0;
            y += buttonWidthAndHeight;
        }
    }
    
    [self levelOneSetup];
}

- (void)levelOneSetup {
    [[self.lightArray objectAtIndex:0] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex:4] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex:20] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex:24] sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void)lightAction:(id)sender {
    if ([sender backgroundColor] == (__bridge CGColorRef _Nullable)([UIColor blueColor])) {
        [sender setBackgroundColor:[UIColor blackColor]];
    } else {
        [sender setBackgroundColor:[UIColor blueColor]];
    }
    
    NSInteger left = (long)[sender tag];
    if (left % 5 == 0) {
        NSLog(@"There is no left");
    } else {
        if ([[self.lightArray objectAtIndex:--left] backgroundColor] == (__bridge CGColorRef _Nullable)([UIColor blueColor])) {
            [[self.lightArray objectAtIndex:left] setBackgroundColor:[UIColor blackColor]];
            NSLog(@"black");
        } else {
            [[self.lightArray objectAtIndex:left] setBackgroundColor:[UIColor blueColor]];
            NSLog(@"blue %@ %ld", [self.lightArray objectAtIndex:left], left);
        }
    }
    
    NSInteger top = (long)[sender tag];
    if (top < 5) {
        NSLog(@"There is no top");
    } else {
        top -= 5;
        if ([[self.lightArray objectAtIndex:top] backgroundColor] == (__bridge CGColorRef _Nullable)([UIColor blueColor])) {
            [[self.lightArray objectAtIndex:top] setBackgroundColor:[UIColor blackColor]];
        } else {
            [[self.lightArray objectAtIndex:top] setBackgroundColor:[UIColor blueColor]];
        }
    }
    
    NSInteger right = (long)[sender tag];
    if ((right += 1) % 5 == 0) {
        NSLog(@"There is no right");
    } else {
        if ([[self.lightArray objectAtIndex:right] backgroundColor] == (__bridge CGColorRef _Nullable)([UIColor blueColor])) {
            [[self.lightArray objectAtIndex:right] setBackgroundColor:[UIColor blackColor]];
        } else {
            [[self.lightArray objectAtIndex:right] setBackgroundColor:[UIColor blueColor]];
        }
    }
    
    NSInteger bottom = (long)[sender tag];
    if (bottom > 19 ) {
        NSLog(@"There is no bottom");
    } else {
        bottom += 5;
        if ([[self.lightArray objectAtIndex:bottom] backgroundColor] == (__bridge CGColorRef _Nullable)([UIColor blueColor])) {
            [[self.lightArray objectAtIndex:bottom] setBackgroundColor:[UIColor blackColor]];
        } else {
            [[self.lightArray objectAtIndex:bottom] setBackgroundColor:[UIColor blueColor]];
        }
    }
    
    self.actions++;
    
    if (self.actions >= 4) {
        [self didUserWin];
    }
}

- (void)didUserWin {
    int blueColorCount = 0;
    
    for (int i = 0; i < 25; i++) {
        CGColorRef color = (CGColorRef)[[self.lightArray objectAtIndex:i] backgroundColor];
        if (color == (__bridge CGColorRef)[UIColor blueColor]) {
            blueColorCount++;
        }
    }
    
    NSLog(@"%i BLUE LIGHTS ON", blueColorCount);
    
    if (blueColorCount == 0) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"You win!" message:@"Go to level two" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

@end