//
//  OCBoobsClient.h
//  ObooopsClient
//
//  Created by Chebulaev Oleg on 15.03.13.
//  Copyright (c) 2013 Chebulaev Oleg. All rights reserved.
//

#import "AFHTTPClient.h"

@interface OCBoobsClient : AFHTTPClient


#pragma mark - Static Methods
+ (OCBoobsClient *)sharedClient;

#pragma mark - Methods
- (NSURLRequest *)boobsRequestWithOffset:(NSInteger)offset count:(NSInteger)count sort:(NSString *)sort;

- (NSString *)previewPathFromBoobsPreview:(NSString *)preview;
@end
