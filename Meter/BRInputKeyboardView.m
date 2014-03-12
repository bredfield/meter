//
//  BRTextInputKeyboardView.m
//  Meter
//
//  Created by Ben Redfield on 3/6/14.
//  Copyright (c) 2014 Rounded. All rights reserved.
//

#import "BRInputKeyboardView.h"

@implementation BRInputKeyboardView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupKeyboard];
    }
    return self;
}



- (void)setupKeyboard
{
    //Create the keyboard toolbar
    UIToolbar *keyboardToolbar = [[UIToolbar alloc] init];
    [keyboardToolbar sizeToFit];
    
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneSelector:)];
    
    [keyboardToolbar setItems:@[spaceItem, doneItem]];
    
    [self setInputAccessoryView:keyboardToolbar];

}


@end
