//
//  ViewController.m
//  CustomTableViewCell
//
//  Created by kyle on 13-11-1.
//  Copyright (c) 2013年 kyle. All rights reserved.
//

#import "ViewController.h"
#include "CustomCellController.h"
#import "CustomCellData.h"

@interface ViewController ()

@end

@implementation ViewController {

    NSArray *cellsData;
    NSArray *cellsWeiboHeight;
}

- (CGFloat) getCellWeiboHeight:(NSString *)weibo
{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 280, 1000)];
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.numberOfLines = 0;
    
    label.text = weibo;
    [label sizeToFit];
    
    CGFloat x = label.frame.size.height;
    
    return label.frame.size.height;
}

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
    self.title = @"自定义表元素示例";
    
    CustomCellData *a = [[CustomCellData alloc] init];
    a.image = @"userA";
    a.name = @"程序猿卡尔";
    a.sign = @"程序员的世界你不懂～";
    a.weibo = @"微博求粉啊！http://weibo.com/u/1656746442";
    NSNumber *aHeight = [[NSNumber alloc] initWithFloat:[self getCellWeiboHeight:a.weibo]];
    
    CustomCellData *b = [[CustomCellData alloc] init];
    b.image = @"userB";
    b.name = @"悟空";
    b.sign = @"二师兄，师傅呢？";
    b.weibo = @"悟空：黑熊精，这身皮革好fashion哪买的呀？ 黑熊：哪比的上大圣的齐B小短裙啊。 悟空：你那熊子熊孙被那归真堂，活生生的取用熊胆做为药引子啦。";
    NSNumber *bHeight = [[NSNumber alloc] initWithFloat:[self getCellWeiboHeight:b.weibo]];
    
    CustomCellData *c = [[CustomCellData alloc] init];
    c.image = @"userC";
    c.name = @"八戒";
    c.sign = @"大师兄，师傅被妖精抓走了！";
    c.weibo = @"散了吧，我要回高老庄！";
    NSNumber *cHeight = [[NSNumber alloc] initWithFloat:[self getCellWeiboHeight:c.weibo]];
    
    CustomCellData *d = [[CustomCellData alloc] init];
    d.image = @"userD";
    d.name = @"沙僧";
    d.sign = @"我挑担子啊，挑担子！";
    d.weibo = @"其实我和大师兄，二师兄早已破了荤戒。我们经常背着师傅一起去化斋。在路上，我们捉到个兔子、野鸡什么的就马上烤来吃，可解馋了！然后再化点儿斋饭带回去给师傅吃。";
    NSNumber *dHeight = [[NSNumber alloc] initWithFloat:[self getCellWeiboHeight:d.weibo]];
    
    cellsData = [[NSArray alloc] initWithObjects: a, b, c, d, nil];
    cellsWeiboHeight = [[NSArray alloc] initWithObjects:aHeight, bHeight, cHeight, dHeight, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -------------------- table delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [cellsData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentify = @"customCellIdentity";
    
    //register
    static BOOL isRegCustomTableCellNib = NO;
    if (!isRegCustomTableCellNib) {
        [tableView registerNib:[UINib nibWithNibName:@"CustomCellController" bundle:nil] forCellReuseIdentifier:cellIdentify];
        isRegCustomTableCellNib = YES;
    }
    
    CustomCellController *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (!cell) {
        cell = [[CustomCellController alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
    }
    
    //set cell data.
    [cell updateViewWithCustomCellData:[cellsData objectAtIndex:indexPath.row]];
    
    //set cell weibo's height
    [cell.weibo sizeToFit];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[cellsWeiboHeight objectAtIndex:indexPath.row] floatValue] + 145 - 21;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}

@end
