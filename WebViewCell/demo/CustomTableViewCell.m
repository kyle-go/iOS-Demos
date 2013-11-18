//
//  CustomTableViewCell.m
//  demo
//
//  Created by kyle on 11/18/13.
//  Copyright (c) 2013 kyle. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell {
    CGFloat webViewHeight;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.webView sizeToFit];
    if (webViewHeight == self.webView.scrollView.contentSize.height) {
        return;
    }
    
    webViewHeight = self.webView.scrollView.contentSize.height;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"freshTableView" object:nil userInfo:@{@"height": [[NSNumber alloc] initWithFloat:webViewHeight + 70], @"index": [[NSNumber alloc] initWithInt:self.index]}];
    static int j = 0;
    NSLog(@"jjjjjjjjjjjj = %d", ++j);
}

- (void)updateCell:(NSString *)data index:(NSInteger)index
{
    self.index = index;
    
    //set webview content
    self.webView.delegate = self;
    self.webView.scrollView.scrollEnabled = NO;
    self.webView.scrollView.bounces = NO;
    self.webView.opaque = NO;
    //self.webView.suppressesIncrementalRendering = YES;
    
    NSString *temp_path = [[[NSBundle mainBundle] resourcePath] stringByAppendingFormat:@"/demo.html"];
    NSData *tmp_data = [[NSFileManager defaultManager] contentsAtPath:temp_path];
    NSString *templateContent = [[NSString alloc] initWithData:tmp_data encoding:NSUTF8StringEncoding];
    NSString *html = [templateContent stringByReplacingOccurrencesOfString:@"WEIBO-BODY" withString:data];
    [self.webView loadHTMLString:html baseURL:nil];
    
    static int i = 0;
    NSLog(@"iiiiiiiiiii = %d", ++i);
}

@end
