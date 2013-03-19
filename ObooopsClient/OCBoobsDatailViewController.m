//
//  OCBoobsDatailViewController.m
//  ObooopsClient
//
//  Created by Chebulaev Oleg on 18.03.13.
//  Copyright (c) 2013 Chebulaev Oleg. All rights reserved.
//

#import "OCBoobsDatailViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "OCBoobsClient.h"
#import "OCBoobsDetailPanelView.h"

@interface OCBoobsDatailViewController () <OCBoobsDetailPanelViewDelegate>
{
    __weak UIImageView *_imageView;
}

@end

@implementation OCBoobsDatailViewController

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)loadView {
    [super loadView];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIImageView *imageView  = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 300, 300)];
    [self.view addSubview:imageView];
    
    _imageView = imageView;
    
    
    OCBoobsDetailPanelView *panel = [[OCBoobsDetailPanelView alloc] initWithFrame:CGRectMake(0, 320, 320, 70)];
    panel.delegate = self;
    [panel setRank:self.boobs.rank];
    [self.view addSubview:panel];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[OCBoobsClient sharedClient] previewPathFromBoobsPreview:self.boobs.previewPath];
    
    
    [_imageView setImageWithURL:[NSURL URLWithString:path] placeholderImage:[UIImage imageNamed:@"loading.png"]];
}

#pragma mark - OCBoobsDetailViewDelegate
- (void)onUpRankTapped:(OCBoobsDetailPanelView *)panel {
    NSLog(@"Up rank");
}

- (void)onDownRankTapped:(OCBoobsDetailPanelView *)panel {
    NSLog(@"Down rank");
}

- (void)onAddToFavorites:(OCBoobsDetailPanelView *)panel {
    NSLog(@"Add to farovites");
}

@end
