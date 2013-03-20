//
//  EVRow.h
//  EVCounter
//
//  Created by akimasa on 2013/03/09.
//  Copyright (c) 2013年 Akimasa Shimobayashi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EVRowDelegate;

@interface EVRow : UIView<UITextFieldDelegate>

@property (nonatomic, assign) id<EVRowDelegate> delegate;

- (int)ev;
- (void)setEv: (int)value;
- (void)plusSliderValue;

@end

@protocol EVRowDelegate
- (void) onEVChanged;
@end