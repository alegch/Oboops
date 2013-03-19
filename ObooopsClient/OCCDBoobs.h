//
//  OCCDBoobs.h
//  ObooopsClient
//
//  Created by Chebulaev Oleg on 19.03.13.
//  Copyright (c) 2013 Chebulaev Oleg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface OCCDBoobs : NSManagedObject

@property (nonatomic, retain) NSString * model;
@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSString * previewPath;
@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSNumber * rank;

@end
