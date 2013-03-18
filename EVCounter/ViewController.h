//
//  ViewController.h
//  EVCounter
//
//  Created by akimasa on 2013/03/09.
//  Copyright (c) 2013年 Akimasa Shimobayashi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EVRow.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet EVRow *hRow;
@property (weak, nonatomic) IBOutlet EVRow *aRow;
@property (weak, nonatomic) IBOutlet EVRow *bRow;
@property (weak, nonatomic) IBOutlet EVRow *cRow;
@property (weak, nonatomic) IBOutlet EVRow *dRow;
@property (weak, nonatomic) IBOutlet EVRow *sRow;

@end
