//
//  LoginViewController.m
//  TwitterDemo
//
//  Created by  Michael Lin on 1/30/17.
//  Copyright © 2017 codepath. All rights reserved.
//

#import "LoginViewController.h"
#import "TwitterClient.h"
#import "TweetListViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (IBAction)onLogin:(id)sender {
    [[TwitterClient sharedInstance] loginWithCompletion:^(User *user, NSError *error) {
        if (user != nil) {
            // Modally present tweets view
            TweetListViewController *viewController = [[TweetListViewController alloc] initWithNibName:@"TweetListViewController" bundle:nil];

            [self presentViewController:viewController animated:false completion:nil];
            NSLog(@"Welcome %@", user.name);
        } else {
            // Present error view
        }
    }];
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
