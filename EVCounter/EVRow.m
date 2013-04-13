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
    UIButton *minus1Button;
    UIButton *plus1Button;
    UIButton *plus2Button;
    UIButton *plus3Button;
    UIButton *plus4Button;
    UIButton *plus5Button;
    UIButton *plus6Button;
    UIButton *plus100Button;
    UISlider *plusSlider;
    UIButton *plusSliderButton;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]){
        // Get instances
        evLabel = (UILabel*)[self viewWithTag:13];
        evTextField = (UITextField*)[self viewWithTag:1];
        minus1Button = (UIButton*)[self viewWithTag:14];
        plus1Button = (UIButton*)[self viewWithTag:3];
        plus2Button = (UIButton*)[self viewWithTag:4];
        plus3Button = (UIButton*)[self viewWithTag:5];
        plus4Button = (UIButton*)[self viewWithTag:6];
        plus5Button = (UIButton*)[self viewWithTag:7];
        plus6Button = (UIButton*)[self viewWithTag:8];
        plus100Button = (UIButton*)[self viewWithTag:9];
        plusSlider = (UISlider*)[self viewWithTag:10];
        plusSliderButton = (UIButton*)[self viewWithTag:12];
        
        // Enable done button
        evTextField.returnKeyType = UIReturnKeyDone;
        evTextField.delegate = self;
        
        // Sync EV
        [evTextField addTarget:self action:@selector(onTextFieldChanged:) forControlEvents:UIControlEventEditingChanged];
        
        // Sync plus amount
        [plusSlider addTarget:self action:@selector(onSliderChanged:) forControlEvents:UIControlEventValueChanged];
        
        // Setup plus buttons
        NSArray *fixedPlusButtons;
        fixedPlusButtons = [NSArray arrayWithObjects:minus1Button, plus1Button, plus2Button, plus3Button, plus4Button, plus5Button, plus6Button, plus100Button, nil];
        for (UIButton* button in fixedPlusButtons) {
            [button addTarget:self action:@selector(onPlusButtonPushed:) forControlEvents:UIControlEventTouchUpInside];
        }
        [plusSliderButton addTarget:self action:@selector(onPlusButtonPushed:) forControlEvents:UIControlEventTouchUpInside];
        
        // Lets fucnking go
        [self setEv:0];
        
        // Fucking looks good
        UIImage *greenButton = [[UIImage imageNamed:@"greenButton.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
        UIImage *greenButtonHighlighted = [[UIImage imageNamed:@"greenButtonHighlight.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
        [plusSliderButton setBackgroundImage:greenButton forState:UIControlStateNormal];
        [plusSliderButton setBackgroundImage:greenButtonHighlighted forState:UIControlStateHighlighted];
        UIImage *tanButton = [[UIImage imageNamed:@"tanButton.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
        UIImage *tanButtonHighlighted = [[UIImage imageNamed:@"tanButtonHighlight.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
        for (UIButton* button in fixedPlusButtons) {
            [button setBackgroundImage:tanButton forState:UIControlStateNormal];
            [button setBackgroundImage:tanButtonHighlighted forState:UIControlStateHighlighted];
        }
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
    [self.delegate onEVChanged];
}

- (void)plusSliderValue
{
    [self setEv:([self ev] + [plusSlider value])];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)onTextFieldChanged: (UITextField*)sender
{
    [self setEv:[sender.text intValue]];
}

- (void)onSliderChanged: (UISlider*)sender
{
    NSString *title = [NSString stringWithFormat:@"+%d", (int)[sender value]];
    [plusSliderButton setTitle:title forState:UIControlStateNormal];
    [plusSliderButton setTitle:title forState:UIControlStateSelected];
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
    } else if (sender == minus1Button) {
        amount = -1;
    } else if (sender == plusSliderButton) {
        [self plusSliderValue];
    }
    
    [self setEv:([self ev] + amount)];
}

@end
