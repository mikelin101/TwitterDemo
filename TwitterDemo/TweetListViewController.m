//
//  TweetListViewController.m
//  TwitterDemo
//
//  Created by  Michael Lin on 1/30/17.
//  Copyright © 2017 codepath. All rights reserved.
//

#import "TweetListViewController.h"
#import "TweetTableViewCell.h"
#import "TwitterClient.h"
#import "ComposeViewController.h"
#import "TweetViewController.h"

@interface TweetListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray* tweets;

@end

@implementation TweetListViewController

- (IBAction)onNewClicked:(UIBarButtonItem *)sender {
    ComposeViewController *viewController = [[ComposeViewController alloc] init];
    [self presentViewController:viewController animated:false completion:nil];
}

- (void)refresh:(id)sender  {
    [[TwitterClient sharedInstance] getTweets:^(NSArray *array, NSError *error) {
        if (array) {
            self.tweets = array;
            NSLog(@"tweet count: %ld", self.tweets.count);
            [self.tableView reloadData];
            [sender endRefreshing];
        } else {
            NSLog(@"Error when getting tweets");
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.estimatedRowHeight = 200;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    UINib *nib = [UINib nibWithNibName:@"TweetTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"TweetTableViewCell"];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:refreshControl atIndex:0];
    
    [self refresh:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TweetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetTableViewCell" forIndexPath:indexPath];

//    if (indexPath.row % 2)  {
//        cell.retweetContainerHeightConstraint.constant = 0;
//    } else {
//        cell.retweetContainerHeightConstraint.constant = 24 * indexPath.row;
//    }
//    [cell setNeedsUpdateConstraints];

    
    [cell populateFromTweet:self.tweets[indexPath.row]];

//    cell
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Tweet *tweet = self.tweets[indexPath.row];
    
    [self presentViewController:[[TweetViewController alloc] initWithTweet:tweet] animated:NO completion:nil];
}

@end
