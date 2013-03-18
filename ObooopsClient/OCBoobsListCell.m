//
//  OCBoobsListCell.m
//  ObooopsClient
//
//  Created by Chebulaev Oleg on 18.03.13.
//  Copyright (c) 2013 Chebulaev Oleg. All rights reserved.
//

#import "OCBoobsListCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@implementation OCBoobsListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _boobsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 300, 300)];
        _boobsImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_boobsImageView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

#pragma mark - Setters
- (void)setBoobsImageFromUrl:(NSURL *)imageUrl {
    [_boobsImageView setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"loading.png"]];
}

- (void)setBoobsRank:(NSString *)rank {
    
}

- (void)setBoobsIdentifer:(NSString *)identifer {
    
}

@end
