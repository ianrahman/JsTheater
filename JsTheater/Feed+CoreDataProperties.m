//
//  Feed+CoreDataProperties.m
//  JsTheater
//
//  Created by Ian Rahman on 10/21/16.
//  Copyright © 2016 illyabbi. All rights reserved.
//

#import "Feed+CoreDataProperties.h"

@implementation Feed (CoreDataProperties)

+ (NSFetchRequest<Feed *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Feed"];
}

@dynamic name;
@dynamic url;

@end
