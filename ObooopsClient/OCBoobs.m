//
//  OCBoobs.m
//  ObooopsClient
//
//  Created by Chebulaev Oleg on 18.03.13.
//  Copyright (c) 2013 Chebulaev Oleg. All rights reserved.
//

#import "OCBoobs.h"

@implementation OCBoobs

#pragma mark - Static Method
+ (OCBoobs *)boobsFromDictionary:(NSDictionary *)dictionary {
    OCBoobs *boobs = [[OCBoobs alloc] init];
    boobs.author = [dictionary objectForKey:@"author"];
    boobs.identifer = [dictionary objectForKey:@"id"];
    boobs.model = [dictionary objectForKey:@"model"];
    boobs.previewPath = [dictionary objectForKey:@"preview"];
    boobs.rank = [dictionary objectForKey:@"rank"];
    
    return boobs;
}

@end
