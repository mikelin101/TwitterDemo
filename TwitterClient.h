//
//  TwitterClient.h
//  TwitterDemo
//
//  Created by  Michael Lin on 1/30/17.
//  Copyright © 2017 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import <BDBOAuth1Manager/BDBOAuth1RequestOperationManager.h>

@interface TwitterClient : BDBOAuth1RequestOperationManager

+ (TwitterClient *) sharedInstance;

- (void) loginWithCompletion: (void (^)(User *user, NSError *error)) completion;
- (void) openURL: (NSURL *) url;
- (void) postTweet:(NSString *) tweet withCompletion: (void (^)(NSError *error))completion;
- (void) getTweets: (void (^)(NSArray *array, NSError *error)) completion;
@end
