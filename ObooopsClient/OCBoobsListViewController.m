//
//  OCBoobsListViewController.m
//  ObooopsClient
//
//  Created by Chebulaev Oleg on 15.03.13.
//  Copyright (c) 2013 Chebulaev Oleg. All rights reserved.
//

#import "OCBoobsListViewController.h"
#import "OCBoobsDatailViewController.h"
#import "OCBoobsListCell.h"

#import "OCBoobsClient.h"
#import "OCBoobs.h"
#import <SVPullToRefresh/SVPullToRefresh.h>


@interface OCBoobsListViewController () <UITableViewDelegate,
                                         UITableViewDataSource>
{
    NSMutableArray *_boobs;
    
    __weak UITableView *_tableView;
    
    NSInteger _lastOffset;
}

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *boobs;

@end

@implementation OCBoobsListViewController

@synthesize tableView = _tableView;
@synthesize boobs = _boobs;

- (id)init {
    self = [super init];
    if (self) {
        _boobs = [NSMutableArray array];
        [self requestBoobsWithOffset:_lastOffset];
        
    }
    return self;
}

#pragma mark - LIfe Cycle
- (void)loadView {
    [super loadView];
    
    self.view.backgroundColor = [UIColor redColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    [tableView addInfiniteScrollingWithActionHandler:^{
        [self setLastOffset:_lastOffset + 10];
        [self requestBoobsWithOffset:_lastOffset];
    }];
    
    _tableView = tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    _tableView.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Methods
- (void)setLastOffset:(NSInteger)offset {
    _lastOffset = offset;
}


- (void)requestBoobsWithOffset:(NSInteger)offset {
    
    
    NSURLRequest *request = [[OCBoobsClient sharedClient] boobsRequestWithOffset:offset count:10 sort:@"rank"];
    
    __weak OCBoobsListViewController *weakSelf = self;
    
    AFHTTPRequestOperation *op = [[OCBoobsClient sharedClient] HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@", responseObject);
        
        NSArray *jsonBoobs = (NSArray *)responseObject;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView beginUpdates];
            
            NSMutableArray *indexes = [NSMutableArray array];
            for (int i = weakSelf.boobs.count; i < weakSelf.boobs.count + jsonBoobs.count; i++) {
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
                [indexes addObject:indexPath];
            }
            
            NSArray *jsonArray = (NSArray *)responseObject;
            for (NSDictionary *dictJson in jsonArray) {
                OCBoobs *boobsObject = [OCBoobs boobsFromDictionary:dictJson];
                [weakSelf.boobs addObject:boobsObject];
            }
            
            [weakSelf.tableView insertRowsAtIndexPaths:indexes withRowAnimation:UITableViewRowAnimationFade];
            
            [weakSelf.tableView endUpdates];
            
            [weakSelf.tableView.infiniteScrollingView stopAnimating];
        });
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Fail %@", [error localizedDescription]);
    }];
    
    [[OCBoobsClient sharedClient] enqueueHTTPRequestOperation:op];

}

#pragma mark - UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_boobs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OCBoobsListCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[OCBoobsListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    OCBoobs *boobs = [_boobs objectAtIndex:indexPath.row];
    
    NSString *imagePath = [[OCBoobsClient sharedClient] previewPathFromBoobsPreview:boobs.previewPath];
    NSURL *imageUrl = [NSURL URLWithString:imagePath];
    [cell setBoobsImageFromUrl:imageUrl];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 320.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Select row with index: %d", indexPath.row);
    OCBoobsDatailViewController *vc = [[OCBoobsDatailViewController alloc] init];

    OCBoobs *boobsObject = [_boobs objectAtIndex:indexPath.row];
    vc.boobs = boobsObject;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
