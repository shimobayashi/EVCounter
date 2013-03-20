//
//  ViewController.m
//  EVCounter
//
//  Created by akimasa on 2013/03/09.
//  Copyright (c) 2013年 Akimasa Shimobayashi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSArray* rows;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    rows = [NSArray arrayWithObjects:self.hRow, self.aRow, self.bRow, self.cRow, self.dRow, self.sRow, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onResetButtonPushed:(UIButton*)sender {
    for (EVRow* row in rows) {
        [row setEv:0];
    }
}
- (IBAction)onPlusAllButtonPushed:(UIButton *)sender {
    for (EVRow* row in rows) {
        [row plusSliderValue];
    }
}

@end
