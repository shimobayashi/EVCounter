//
//  EVRow.m
//  EVCounter
//
//  Created by akimasa on 2013/03/09.
//  Copyright (c) 2013年 Akimasa Shimobayashi. All rights reserved.
//

#import "EVRow.h"

@implementation EVRow {
    UILabel *evLabel;
    UITextField *evTextField;
    UIStepper *evStepper;
    UIButton *plus1Button;
    UIButton *plus2Button;
    UIButton *plus3Button;
    UIButton *plus4Button;
    UIButton *plus5Button;
    UIButton *plus6Button;
    UIButton *plus100Button;
    UISlider *plusSlider;
    UILabel *plusSliderLabel;
    UIButton *plusSliderButton;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]){
        // Get instances
        evLabel = (UILabel*)[self viewWithTag:13];
        evTextField = (UITextField*)[self viewWithTag:1];
        evStepper = (UIStepper*)[self viewWithTag:2];
        plus1Button = (UIButton*)[self viewWithTag:3];
        plus2Button = (UIButton*)[self viewWithTag:4];
        plus3Button = (UIButton*)[self viewWithTag:5];
        plus4Button = (UIButton*)[self viewWithTag:6];
        plus5Button = (UIButton*)[self viewWithTag:7];
        plus6Button = (UIButton*)[self viewWithTag:8];
        plus100Button = (UIButton*)[self viewWithTag:9];
        plusSlider = (UISlider*)[self viewWithTag:10];
        plusSliderLabel = (UILabel*)[self viewWithTag:11];
        plusSliderButton = (UIButton*)[self viewWithTag:12];
        
        // Enable done button
        evTextField.returnKeyType = UIReturnKeyDone;
        evTextField.delegate = self;
        
        // Sync EV
        [evTextField addTarget:self action:@selector(onTextFieldChanged:) forControlEvents:UIControlEventEditingChanged];
        [evStepper addTarget:self action:@selector(onStepperChanged:) forControlEvents:UIControlEventValueChanged];
        
        // Sync plus amount
        [plusSlider addTarget:self action:@selector(onSliderChanged:) forControlEvents:UIControlEventValueChanged];
        
        // Setup plus buttons
        [plus1Button addTarget:self action:@selector(onPlusButtonPushed:) forControlEvents:UIControlEventTouchUpInside];
        [plus2Button addTarget:self action:@selector(onPlusButtonPushed:) forControlEvents:UIControlEventTouchUpInside];
        [plus3Button addTarget:self action:@selector(onPlusButtonPushed:) forControlEvents:UIControlEventTouchUpInside];
        [plus4Button addTarget:self action:@selector(onPlusButtonPushed:) forControlEvents:UIControlEventTouchUpInside];
        [plus5Button addTarget:self action:@selector(onPlusButtonPushed:) forControlEvents:UIControlEventTouchUpInside];
        [plus6Button addTarget:self action:@selector(onPlusButtonPushed:) forControlEvents:UIControlEventTouchUpInside];
        [plus100Button addTarget:self action:@selector(onPlusButtonPushed:) forControlEvents:UIControlEventTouchUpInside];
        [plusSliderButton addTarget:self action:@selector(onPlusButtonPushed:) forControlEvents:UIControlEventTouchUpInside];
        
        // Lets fucnking go
        [self setEv:0];
    }
    return self;
}

- (int)ev
{
    return [evTextField.text intValue];
}

- (void)setEv: (int)value
{
    if (value < 0)
        value = 0;
    else if (value > 255)
        value = 255;
    
    if (value > 0)
        evLabel.textColor = [UIColor redColor];
    else
        evLabel.textColor = [UIColor blackColor];
    
    [evTextField setText:[NSString stringWithFormat:@"%d", value]];
    [evStepper setValue:value];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)onTextFieldChanged: (UITextField*)sender
{
    [self setEv:[sender.text intValue]];
}

- (void)onStepperChanged: (UIStepper*)sender
{
    [self setEv:sender.value];
}

- (void)onSliderChanged: (UISlider*)sender
{
    [plusSliderLabel setText:[NSString stringWithFormat:@"+%2s", [[NSString stringWithFormat:@"%d", (int)[sender value]] UTF8String]]];
}

- (void)onPlusButtonPushed: (id)sender
{
    int amount = 0;
    if (sender == plus1Button) {
        amount = 1;
    } else if (sender == plus2Button) {
        amount = 2;
    } else if (sender == plus3Button) {
        amount = 3;
    } else if (sender == plus4Button) {
        amount = 4;
    } else if (sender == plus5Button) {
        amount = 5;
    } else if (sender == plus6Button) {
        amount = 6;
    } else if (sender == plus100Button) {
        amount = 100;
    } else if (sender == plusSliderButton) {
        amount = [plusSlider value];
    }
    
    [self setEv:([self ev] + amount)];
}

@end
