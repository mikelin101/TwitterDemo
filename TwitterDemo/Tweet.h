//
//  Tweet.h
//  TwitterDemo
//
//  Created by  Michael Lin on 1/30/17.
//  Copyright © 2017 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Tweet : NSObject

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) User *user;

+ (NSArray *)tweetsWithArray:(NSArray *) array;

@end
