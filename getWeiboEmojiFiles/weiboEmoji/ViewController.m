//
//  ViewController.m
//  weiboEmoji
//
//  Created by kyle on 12/1/13.
//  Copyright (c) 2013 kyle. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSMutableArray *arrayFolders;
    NSInteger count;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        arrayFolders = [[NSMutableArray alloc] init];
        count = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#define PATH_OF_DOCUMENT [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

- (IBAction)parse:(id)sender {
    //get face.txt from "http://open.weibo.com/wiki/2/emotions"
    count = 0;
    NSError *error;
    NSStringEncoding encode = NSUTF8StringEncoding;
    NSString *faceFile = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"face.txt"];
    NSString *faceString = [NSString stringWithContentsOfFile:faceFile usedEncoding:&encode error:&error];
    
    NSData *data = [faceString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    for (NSDictionary *item in json) {
        [self parseItem:item];
    }
}

- (void)parseItem:(NSDictionary *)item
{
    NSString *category = [item objectForKey:@"category"];
    if ([category length] == 0) {
        category = @"默认";
    }
    
    NSString *url = [item objectForKey:@"icon"];
    NSString *name = [item objectForKey:@"phrase"];
    
    if (![arrayFolders containsObject:category]) {
        [arrayFolders addObject:category];
        [self createFolder:category];
    }
    
    [self downloadOneFile:url folder:category name:[name stringByAppendingString:@".gif"]];
}

- (void)createFolder:(NSString *)folder
{
    NSString *imagesPath = [PATH_OF_DOCUMENT stringByAppendingPathComponent:folder];
    NSError *error;
    [[NSFileManager defaultManager] createDirectoryAtPath:imagesPath withIntermediateDirectories:NO attributes:nil error:&error];
    if (error) {
        NSLog(@"Create folder failed. folder=%@, error=%@", folder, error);
    }
}

- (void)downloadOneFile:(NSString *)url folder:(NSString *)folder name:(NSString *)fileName
{
    //从网络上下载文件
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSString *filePath = [PATH_OF_DOCUMENT stringByAppendingPathComponent:folder];
        NSString *file = [[NSString alloc] initWithFormat:@"%@/%@", filePath, fileName];
        return [NSURL fileURLWithPath:file isDirectory:NO];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        //failed.
        if (error) {
            NSLog(@"download failed. file=%@, error=%@", url, error);
        }
        
        //succeed.
        if (!error) {
            count++;
        //...
        }
    }];
    
    [downloadTask resume];
}

@end
