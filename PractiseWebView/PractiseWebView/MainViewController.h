//
//  MainViewController.h
//  PractiseWebView
//
//  Created by kyle on 11/8/13.
//  Copyright (c) 2013 kyle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)runJS:(id)sender;

@end
