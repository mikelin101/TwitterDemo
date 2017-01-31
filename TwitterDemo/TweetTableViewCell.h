//
//  TweetTableViewCell.h
//  TwitterDemo
//
//  Created by  Michael Lin on 1/30/17.
//  Copyright © 2017 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface TweetTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *retweetContainerHeightConstraint;

- (void) populateFromTweet:(Tweet *) tweet;

@end

