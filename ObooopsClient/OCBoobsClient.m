//
//  OCBoobsClient.m
//  ObooopsClient
//
//  Created by Chebulaev Oleg on 15.03.13.
//  Copyright (c) 2013 Chebulaev Oleg. All rights reserved.
//

#import "OCBoobsClient.h"
#import "AFJSONRequestOperation.h"

@implementation OCBoobsClient

static NSString * const kAFBoobsAPIBaseURLString = @"http://api.oboobs.ru/";

#pragma mark - Static Methods
+ (OCBoobsClient *)sharedClient {
    static OCBoobsClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[OCBoobsClient alloc] initWithBaseURL:[NSURL URLWithString:kAFBoobsAPIBaseURLString]];
    });
    
    return _sharedClient;
}

#pragma mark - Methods
- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

- (NSURLRequest *)boobsRequestWithOffset:(NSInteger)offset count:(NSInteger)count sort:(NSString *)sort {
    NSString *params = [NSString stringWithFormat:@"%d/%d/%@", offset, count, sort];
    
    NSMutableURLRequest *request = [self requestWithMethod:@"GET" path:[NSString stringWithFormat:@"path/%@", params] parameters:nil];
    return request;
}

@end
