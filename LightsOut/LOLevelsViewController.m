//
//  LOLevelsViewController.m
//  LightsOut
//
//  Created by Eric Sze on 12/20/16.
//  Copyright © 2016 ES Apps. All rights reserved.
//

#import "LOLevelsViewController.h"
#import "LOBoardViewController.h"

@interface LOLevelsViewController ()

@end

@implementation LOLevelsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)levelOne:(UIButton *)sender {
    [self performSegueWithIdentifier:@"sendLevelNum" sender:sender];
}

- (IBAction)levelTwo:(UIButton *)sender {
}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if ([segue.identifier isEqualToString:@"sendLevelNum"]) {
//        LOBoardViewController *controller = (LOBoardViewController *)segue.destinationViewController;
//        controller.
//    }
//}

// This will get called too before the view appears
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([[segue identifier] isEqualToString:@"sendLevelNum"]) {
//        LOBoardViewController *vc = [segue destinationViewController];
//        
//        // Get button tag number (or do whatever you need to do here, based on your object
//        [vc setLevelNumber:[(UIButton *)sender tag]];
//    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
