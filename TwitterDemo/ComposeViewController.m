//
//  ComposeViewController.m
//  TwitterDemo
//
//  Created by  Michael Lin on 2/2/17.
//  Copyright © 2017 codepath. All rights reserved.
//

#import "ComposeViewController.h"
#import "TwitterClient.h"
#import "TweetListViewController.h"

@interface ComposeViewController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *tweet;

@end

@implementation ComposeViewController

- (void) goBack {
    [self presentViewController:[[TweetListViewController alloc] init] animated:false completion:nil];
}

- (IBAction)cancelClick:(UIBarButtonItem *)sender {
    [self goBack];
}

- (IBAction)tweetClick:(UIBarButtonItem *)sender {
    NSLog(@"%@", self.tweet.text);
    [[TwitterClient sharedInstance] postTweet:self.tweet.text withCompletion:^(NSError *error) {
        if (error) {
            NSLog(@"error: %@", error);
        } else {
            NSLog(@"SUCCESS");
            [self goBack];
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.tweet.delegate = self;
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
