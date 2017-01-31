//
//  User.m
//  TwitterDemo
//
//  Created by  Michael Lin on 1/30/17.
//  Copyright © 2017 codepath. All rights reserved.
//

#import "User.h"

@implementation User

- (id) initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if(self) {
        self.name = dictionary[@"name"];
        self.screenname = dictionary[@"screen_name"];
        self.profileImageUrl = dictionary[@"profile_image_url_https"];
        self.tagline = dictionary[@"description"];
    }
    return self;
}

@end
