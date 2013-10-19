//
//  ViewController.h
//  Storage
//
//  Created by kyle on 10/19/13.
//  Copyright (c) 2013 nad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UISlider *silder1;
@property (weak, nonatomic) IBOutlet UISlider *silder2;

-(IBAction)closeKeyboard:(id)sender;
-(IBAction)save;

@end
