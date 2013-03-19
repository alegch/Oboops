//
//  OCBoobsDetailPanelView.h
//  ObooopsClient
//
//  Created by Chebulaev Oleg on 19.03.13.
//  Copyright (c) 2013 Chebulaev Oleg. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OCBoobsDetailPanelViewDelegate;

@interface OCBoobsDetailPanelView : UIView {
    UILabel *_rankLabel;
    UIButton *_favoriteButton;
    UIButton *_upRankButton;
    UIButton *_downRankButton;
}
#pragma mark - Properties
@property (nonatomic, weak) id<OCBoobsDetailPanelViewDelegate>delegate;

#pragma mark - Methods
- (void)setRank:(NSNumber *)rank;
@end


@protocol OCBoobsDetailPanelViewDelegate
- (void)onUpRankTapped:(OCBoobsDetailPanelView *)panel;
- (void)onDownRankTapped:(OCBoobsDetailPanelView *)panel;
- (void)onAddToFavorites:(OCBoobsDetailPanelView *)panel;
@end


