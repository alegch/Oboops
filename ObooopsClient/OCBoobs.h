//
//  OCBoobs.h
//  ObooopsClient
//
//  Created by Chebulaev Oleg on 18.03.13.
//  Copyright (c) 2013 Chebulaev Oleg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OCBoobs : NSObject

#pragma mark - Properties
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSNumber *identifer;
@property (nonatomic, strong) NSString *model;
@property (nonatomic, strong) NSString *previewPath;
@property (nonatomic, strong) NSNumber *rank;

#pragma mark - Static Method
+ (OCBoobs *)boobsFromDictionary:(NSDictionary *)dictionary;


@end
