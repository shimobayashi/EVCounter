//
//  ViewController.m
//  EVCounter
//
//  Created by akimasa on 2013/03/09.
//  Copyright (c) 2013年 Akimasa Shimobayashi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    EVRow* rows[6];
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    rows[0] = self.hRow;
    rows[1] = self.aRow;
    rows[2] = self.bRow;
    rows[3] = self.cRow;
    rows[4] = self.dRow;
    rows[5] = self.sRow;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onResetButtonPushed:(UIButton*)sender {
    NSLog(@"%@", sender);
}

@end
