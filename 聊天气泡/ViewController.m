//
//  ViewController.m
//  聊天气泡
//
//  Created by huochaihy on 16/10/14.
//  Copyright © 2016年 CHL. All rights reserved.
//

#import "ViewController.h"
#import "ChatTableViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ChatTableViewController * chat = [[ChatTableViewController alloc]initWithStyle:UITableViewStylePlain];
    [self addChildViewController:chat];
    chat.tableView.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64);
    [self.view addSubview:chat.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
