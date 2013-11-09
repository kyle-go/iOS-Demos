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
    "    var text = \"[JS Code]input text is:\" + document.getElementById(\"input1\").value;"
    "    alert(text);"
    "}"
    "function objc_function1() {"
    "    window.open('http://objc-function1');"
    "}"
    "function objc_function2() {"
    "    window.open('http://objc-function2%func2-param-string');"
    "}"
    "</script>"
    "</head>"
    "<body bgcolor='white'>"
    "<p>It's a text!</p>"
    "<input id=\"input1\"></input>"
    "<button type=\"button\" onclick=\"jsFunction()\">Click Me!</button>"
    "</br>"
    "<a href=\"https://github.com/kylescript\">https://github.com/kylescript</a>"
    "</br>"
    "<button type=\"button\" onclick=\"objc_function1()\">objc_function1</button>"
    "<button type=\"button\" onclick=\"objc_function2()\">objc_function2</button>"
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
    if ([requestString isEqualToString:@"http://objc-function1/"]) {
        [self objc_function1];
        return NO;
    }
    if ([requestString isEqualToString:@"http://objc-function2%25func2-param-string/"]) {
        [self objc_function2:@"func2-param-string"];
        return NO;
    }
    return YES;
}

#pragma mark ---- objective-c call js -----
- (IBAction)runJS:(id)sender {
    [self.webView stringByEvaluatingJavaScriptFromString:@"jsFunction();"];
}

#pragma mark ---- js call objective-c
- (void)objc_function1
{
    NSLog(@"objc_function1 called.");
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"[Objc Code]js call objc" message:@"objc_function1 called." delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [view show];
}

- (void)objc_function2:(NSString *)param
{
    NSLog(@"objec_function2 called. param=%@", param);
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"[Objc Code]js call objc" message:@"objc_function2 called." delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [view show];
}

@end
