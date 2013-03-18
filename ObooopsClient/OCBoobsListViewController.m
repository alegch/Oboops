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


@interface OCBoobsListViewController () <UITableViewDelegate,
                                         UITableViewDataSource>
{
    NSMutableArray *_boobs;
    
    __weak UITableView *_tableView;
}

@end

@implementation OCBoobsListViewController

- (id)init {
    self = [super init];
    if (self) {
        _boobs = [NSMutableArray array];
        [self requestBoobs];
        
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
- (void)requestBoobs {
    NSURLRequest *request = [[OCBoobsClient sharedClient] boobsRequestWithOffset:0 count:10 sort:@"rank"];
    AFHTTPRequestOperation *op = [[OCBoobsClient sharedClient] HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@", responseObject);
        
        NSArray *jsonArray = (NSArray *)responseObject;
        for (NSDictionary *dictJson in jsonArray) {
            OCBoobs *boobsObject = [OCBoobs boobsFromDictionary:dictJson];
            [_boobs addObject:boobsObject];
        }
        [_tableView reloadData];
        
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
    
//    cell.textLabel.text = [NSString stringWithFormat:@"%d", [boobs.rank integerValue]];
    
    NSString *imagePath = [[OCBoobsClient sharedClient] previewPathFromBoobsPreview:boobs.previewPath];
//    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imagePath]];
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
