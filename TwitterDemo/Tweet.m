//
//  Tweet.m
//  TwitterDemo
//
//  Created by  Michael Lin on 1/30/17.
//  Copyright © 2017 codepath. All rights reserved.
//

#import "Tweet.h"
#import "User.h"

@implementation Tweet

- (id) initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.user = [[User alloc] initWithDictionary:dictionary[@"user"]];
        
        self.text = dictionary[@"text"];
        
        NSString *createdAtString = dictionary[@"created_at"];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"EEE MMM d HH:mm:ss Z y";

        self.createdAt = [formatter dateFromString:createdAtString];
    }
    
    return self;
}

+ (NSArray *)tweetsWithArray:(NSArray *) array {
    NSMutableArray *tweets = [NSMutableArray array];
    
    for (NSDictionary * dictionary in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:dictionary]];
    }
    
    return tweets;
}
@end
