//
//  MainViewController.m
//  PractiseWebView
//
//  Created by kyle on 11/8/13.
//  Copyright (c) 2013 kyle. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.webView.delegate = self;
    
    NSString *html = @"<html>"
    "<head>"
    "<script>"
    "function jsFunction() {"
    "    var text = \"input text is:\" + document.getElementById(\"input1\").value;"
    "    alert(text);"
    "}"
    "</script>"
    "</head>"
    "<body bgcolor='white'>"
    "<p>It's a text!</p>"
    "<input id=\"input1\"></input>"
    "<button type=\"button\" onclick=\"jsFunction()\">Click Me!</button>"
    "</br>"
    "<a href=\"https://github.com/kylescript\">https://github.com/kylescript</a>"
    "</body>"
    "</html>";
    [self.webView loadHTMLString:html baseURL:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UIWebViewDelegate
- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"shouldStartLoadWithRequest");
    
    NSString *requestString = [[request URL] absoluteString];
    
    if ([requestString isEqualToString:@"https://github.com/kylescript"]) {
        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"click link" message:@"click \"https://github.com/kylescript\"" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [view show];
        return NO;
    }
    return YES;
}

#pragma mark ---- run js-----
- (IBAction)runJS:(id)sender {
    [self.webView stringByEvaluatingJavaScriptFromString:@"jsFunction();"];
}
@end
