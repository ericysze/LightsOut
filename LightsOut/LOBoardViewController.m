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

@property (nonatomic, assign) int actions;
@property (nonatomic, assign) int lvlNumber;

@end

@implementation LOBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
}

- (void)setupUI {
    
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
    
    [self lvlOne];
}

- (void)lvlOne {
    self.lvlNumber = 1;
    [[self.lightArray objectAtIndex: 0] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex: 4] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex:20] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex:24] sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void)lvlTwo {
    [[self.lightArray objectAtIndex: 6] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex: 8] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex:16] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex:18] sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void)lvlThree {
    [[self.lightArray objectAtIndex: 1] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex: 9] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex:11] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex:17] sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void)lvlFour {
    [[self.lightArray objectAtIndex: 2] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex: 5] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex:10] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex: 8] sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void)lvlFive {
    [[self.lightArray objectAtIndex:15] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex: 1] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex:6] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex:20] sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void)lvlSix {
    [[self.lightArray objectAtIndex: 8] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex: 9] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex:11] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex:15] sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void)lvlSeven {
    [[self.lightArray objectAtIndex: 1] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex:10] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex:11] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex:22] sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void)lvlEight {
    [[self.lightArray objectAtIndex:10] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex:17] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex:20] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex:12] sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void)lvlNine {
    [[self.lightArray objectAtIndex:16] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex:17] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex:18] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex:14] sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void)lvlTen {
    [[self.lightArray objectAtIndex: 8] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex: 9] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex:15] sendActionsForControlEvents:UIControlEventTouchUpInside];
    [[self.lightArray objectAtIndex:16] sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void)lightAction:(id)sender {
    if ([sender backgroundColor] == (__bridge CGColorRef _Nullable)([UIColor blueColor])) {
        [sender setBackgroundColor:[UIColor blackColor]];
    } else {
        [sender setBackgroundColor:[UIColor blueColor]];
    }
    
    NSInteger left = (long)[sender tag];
    if (left % 5 == 0) {
//        NSLog(@"There is no left");
    } else {
        if ([[self.lightArray objectAtIndex:--left] backgroundColor] == (__bridge CGColorRef _Nullable)([UIColor blueColor])) {
            [[self.lightArray objectAtIndex:left] setBackgroundColor:[UIColor blackColor]];
        } else {
            [[self.lightArray objectAtIndex:left] setBackgroundColor:[UIColor blueColor]];
        }
    }
    
    NSInteger top = (long)[sender tag];
    if (top < 5) {
//        NSLog(@"There is no top");
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
//        NSLog(@"There is no right");
    } else {
        if ([[self.lightArray objectAtIndex:right] backgroundColor] == (__bridge CGColorRef _Nullable)([UIColor blueColor])) {
            [[self.lightArray objectAtIndex:right] setBackgroundColor:[UIColor blackColor]];
        } else {
            [[self.lightArray objectAtIndex:right] setBackgroundColor:[UIColor blueColor]];
        }
    }
    
    NSInteger bottom = (long)[sender tag];
    if (bottom > 19 ) {
//        NSLog(@"There is no bottom");
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
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"You win!" message:@"Go to next level" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        // on completion, it should go to the next level after
        // - * making a positive rewarding sound, (maybe a little action, spinning star rising up screen *
        // reuse the same screen, unneccesary to push a new one onto the stack to
        // - *** lights are already off, just need to turn on next level's lights ***
        self.lvlNumber += 1;
        [self presentViewController:alertController animated:YES completion:^{[self nextLvl:self.lvlNumber];}];
    }
}

- (void)nextLvl:(int)lvlNum {
    switch (lvlNum) {
        case 2:
            [self lvlTwo];
            break;
        case 3:
            [self lvlThree];
            break;
        case 4:
            [self lvlFour];
            break;
        case 5:
            [self lvlFive];
            break;
        case 6:
            [self lvlSix];
            break;
        case 7:
            [self lvlSeven];
            break;
        case 8:
            [self lvlEight];
            break;
        case 9:
            [self lvlNine];
            break;
        case 10:
            [self lvlTen];
            break;
        case 11:
//            [self lvlEleven];
            break;
        case 12:
//            [self lvlTwelve];
            break;
        case 13:
//            [self lvlThirteen];
            break;
        case 14:
//            [self lvlFourteen];
            break;
        case 15:
//            [self lvlFifteen];
            break;
        case 16:
//            [self lvlSixteen];
            break;
        case 17:
//            [self lvlSeventeen];
            break;
        default:
            NSLog(@"default selected");
            break;
    }
}

@end
