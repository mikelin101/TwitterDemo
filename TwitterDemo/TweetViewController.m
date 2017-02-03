//
//  TweetViewController.m
//  TwitterDemo
//
//  Created by  Michael Lin on 2/2/17.
//  Copyright © 2017 codepath. All rights reserved.
//

#import "TweetViewController.h"
#import "TweetListViewController.h"

@interface TweetViewController ()

@end

@implementation TweetViewController

- (IBAction)didClickHome:(UIBarButtonItem *)sender {
    [self presentViewController:[[TweetListViewController alloc] init] animated:false completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
