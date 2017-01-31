//
//  TwitterClient.m
//  TwitterDemo
//
//  Created by  Michael Lin on 1/30/17.
//  Copyright © 2017 codepath. All rights reserved.
//

#import "TwitterClient.h"
#import "Tweet.h"

NSString * const kTwitterConsumerKey =  @"I8v5MfipGUMMcNx0aMbxHeQr0";
NSString * const kTwitterConsumerSecret = @"xOUBIfMVLRsO2bJkuoSRyIDQIJwwH1FWuhmtyepVULmZumRetf";
NSString * const kTwitterBaseUrl = @"https://api.twitter.com";

@interface TwitterClient()
@property (nonatomic, strong) void(^loginCompletion)(User *user, NSError *error);

@end

@implementation TwitterClient

+ (TwitterClient *) sharedInstance {
    static TwitterClient *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (instance == nil){
            instance = [[TwitterClient alloc] initWithBaseURL:[NSURL URLWithString: kTwitterBaseUrl] consumerKey:kTwitterConsumerKey consumerSecret:kTwitterConsumerSecret];
        }
    });

    return instance;
}

- (void) loginWithCompletion:(void (^)(User *user, NSError *error))completion {
    self.loginCompletion = completion;
    [self.requestSerializer removeAccessToken];
    [self fetchRequestTokenWithPath:@"oauth/request_token"
                                                       method:@"GET"
                                                  callbackURL:[NSURL URLWithString:@"cptwitterdemo://oauth"]
                                                        scope:nil
                                                      success:^(BDBOAuthToken *requestToken) {
                                                          NSLog(@"Got the request token!");
                                                          
                                                          NSURL *authUrl = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.twitter.com/oauth/authorize?oauth_token=%@", requestToken.token]];
                                                          
                                                          [[UIApplication sharedApplication] openURL:authUrl];
                                                      }
                                                      failure:^(NSError *error) {
                                                          NSLog(@"Failed to get the request token!");
                                                          self.loginCompletion(nil, error);
                                                      }];
   
}

- (void) getTweets:(void (^)(NSArray *array, NSError *error))completion {
    [[TwitterClient sharedInstance] GET:@"1.1/statuses/home_timeline.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//         NSLog(@"tweets: %@", responseObject);
        NSArray *tweets = [Tweet tweetsWithArray:responseObject];
        completion(tweets, nil);

//        for (Tweet* tweet in tweets) {
//            NSLog(@"tweet: %@, created: %@", tweet.text, tweet.createdAt);
//        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"failed getting tweets");
        completion(nil, error);
    }];
}

- (void) openURL:(NSURL *)url {
    [self fetchAccessTokenWithPath:@"oauth/access_token" method:@"POST" requestToken:[BDBOAuthToken tokenWithQueryString:url.query] success:^(BDBOAuthToken *accessToken) {
        NSLog(@"got the access token!");
        
        [self.requestSerializer saveAccessToken:accessToken];
        
        [self GET:@"1.1/account/verify_credentials.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            User *user = [[User alloc] initWithDictionary: responseObject];
            NSLog(@"current user: %@", user.name);
            self.loginCompletion(user, nil);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"failed getting current user");
            self.loginCompletion(nil, error);
        }];
        
//        [[TwitterClient sharedInstance] GET:@"1.1/statuses/home_timeline.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            //            NSLog(@"tweets: %@", responseObject);
//            NSArray *tweets = [Tweet tweetsWithArray:responseObject];
//            for (Tweet* tweet in tweets) {
//                NSLog(@"tweet: %@, created: %@", tweet.text, tweet.createdAt);
//            }
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            NSLog(@"failed getting tweets");
//        }];
    } failure:^(NSError *error) {
        NSLog(@"failed to get the access token!");
        self.loginCompletion(nil, error);
    }];
}

@end
