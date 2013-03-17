//
//  EVRow.h
//  EVCounter
//
//  Created by akimasa on 2013/03/09.
//  Copyright (c) 2013年 Akimasa Shimobayashi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EVRow : UIView<UITextFieldDelegate>

@property (nonatomic, strong) UILabel *evLabel;
@property (nonatomic, strong) UITextField *evTextField;
@property (nonatomic, strong) UIStepper *evStepper;
@property (nonatomic, strong) UIButton *plus1Button;
@property (nonatomic, strong) UIButton *plus2Button;
@property (nonatomic, strong) UIButton *plus3Button;
@property (nonatomic, strong) UIButton *plus4Button;
@property (nonatomic, strong) UIButton *plus5Button;
@property (nonatomic, strong) UIButton *plus6Button;
@property (nonatomic, strong) UIButton *plus100Button;
@property (nonatomic, strong) UISlider *plusSlider;
@property (nonatomic, strong) UILabel *plusSliderLabel;
@property (nonatomic, strong) UIButton *plusSliderButton;

@end