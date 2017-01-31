//
//  TweetTableViewCell.m
//  TwitterDemo
//
//  Created by  Michael Lin on 1/30/17.
//  Copyright © 2017 codepath. All rights reserved.
//

#import "TweetTableViewCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface TweetTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *handleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timestampLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;


@end

@implementation TweetTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.nameLabel.text = @"My Twitter Name";
    self.handleLabel.text = @"@somebody";
    self.timestampLabel.text = @"4h";
    self.contentLabel.text = @"A really long repeated message. A really long repeated message. A really long repeated message. A really long repeated message.";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)populateFromTweet:(Tweet *)tweet {
    self.nameLabel.text = tweet.user.name;
    self.handleLabel.text = tweet.user.screenname;
    self.contentLabel.text = tweet.text;
    
//    NSLog(@"%@", tweet.user.profileImageUrl);
    
    self.timestampLabel.text = [NSString stringWithFormat:@"%@", tweet.createdAt];
    [self.profileImageView setImageWithURL:[NSURL URLWithString: tweet.user.profileImageUrl]];
//    [self.profileImageView setImage:[UIImage imageNamed:@"image.png"]];
}

@end
