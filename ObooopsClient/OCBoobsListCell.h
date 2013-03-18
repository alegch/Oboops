//
//  OCBoobsListCell.h
//  ObooopsClient
//
//  Created by Chebulaev Oleg on 18.03.13.
//  Copyright (c) 2013 Chebulaev Oleg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OCBoobsListCell : UITableViewCell {
    UIImageView *_boobsImageView;
}

#pragma mark - Setters
- (void)setBoobsImageFromUrl:(NSURL *)imageUrl;
- (void)setBoobsRank:(NSString *)rank;
- (void)setBoobsIdentifer:(NSString *)identifer;

@end
