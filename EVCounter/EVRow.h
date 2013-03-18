//
//  EVRow.h
//  EVCounter
//
//  Created by akimasa on 2013/03/09.
//  Copyright (c) 2013年 Akimasa Shimobayashi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EVRow : UIView<UITextFieldDelegate>

- (int)ev;
- (void)setEv: (int)value;

@end