//
//  TweetViewController.m
//  TwitterDemo
//
//  Created by  Michael Lin on 2/2/17.
//  Copyright © 2017 codepath. All rights reserved.
//

#import "TweetViewController.h"
#import "TweetListViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface TweetViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *handleLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetLabel;
@property (weak, nonatomic) IBOutlet UILabel *timestampLabel;

@property(nonatomic, strong) Tweet *tweet;

@end

@implementation TweetViewController

- (instancetype)initWithTweet:(Tweet *)tweet {
    self = [super init];
    if (self) {
        self.tweet = tweet;
    }
    
    return self;
}

- (IBAction)didClickHome:(UIBarButtonItem *)sender {
    [self presentViewController:[[TweetListViewController alloc] init] animated:false completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLabel.text = self.tweet.user.name;
    self.handleLabel.text = self.tweet.user.screenname;
    self.tweetLabel.text = self.tweet.text;
    self.timestampLabel.text = [NSString stringWithFormat:@"%@", self.tweet.createdAt];
    [self.profileImage setImageWithURL:[NSURL URLWithString: self.tweet.user.profileImageUrl]];    
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
