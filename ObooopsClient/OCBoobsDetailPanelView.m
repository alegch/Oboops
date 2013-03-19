//
//  OCBoobsDetailPanelView.m
//  ObooopsClient
//
//  Created by Chebulaev Oleg on 19.03.13.
//  Copyright (c) 2013 Chebulaev Oleg. All rights reserved.
//

#import "OCBoobsDetailPanelView.h"

@implementation OCBoobsDetailPanelView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor purpleColor];
        
        _favoriteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _favoriteButton.frame = CGRectMake(10, 10, 50, 50);
        [_favoriteButton addTarget:self action:@selector(onFavoriteTapped) forControlEvents:UIControlEventTouchUpInside];
        [_favoriteButton setTitle:@"F" forState:UIControlStateNormal];
        [self addSubview:_favoriteButton];
        
        _downRankButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _downRankButton.frame = CGRectMake(60, 10, 50, 50);
        [_downRankButton addTarget:self action:@selector(onDownRankTapped) forControlEvents:UIControlEventTouchUpInside];
        [_downRankButton setTitle:@"D" forState:UIControlStateNormal];
        [self addSubview:_downRankButton];
        
        _upRankButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _upRankButton.frame = CGRectMake(210, 10, 50, 50);
        [_upRankButton setTitle:@"U" forState:UIControlStateNormal];
        [_upRankButton addTarget:self action:@selector(onUpRankTapped) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_upRankButton];
        
        _rankLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 10, 100, 50)];
        _rankLabel.textAlignment = NSTextAlignmentCenter;
        _rankLabel.backgroundColor = [UIColor redColor];
        [self addSubview:_rankLabel];
    }
    return self;
}

#pragma mark - Setters
- (void)setRank:(NSNumber *)rank {
    _rankLabel.text = [NSString stringWithFormat:@"%d", [rank integerValue]];
}

#pragma mark - Event Handlers
- (void)onFavoriteTapped {
    NSLog(@"Tap");
    [self.delegate onAddToFavorites:self];
}

- (void)onDownRankTapped {
    NSLog(@"Tap");
    [self.delegate onDownRankTapped:self];
}

- (void)onUpRankTapped  {
    NSLog(@"Tap");
    [self.delegate onUpRankTapped:self];
}

@end
