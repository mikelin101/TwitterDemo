//
//  User.h
//  TwitterDemo
//
//  Created by  Michael Lin on 1/30/17.
//  Copyright © 2017 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *screenname;
@property(nonatomic, strong) NSString *profileImageUrl;
@property(nonatomic, strong) NSString *tagline;


- (id) initWithDictionary:(NSDictionary *)dictionary;

@end
