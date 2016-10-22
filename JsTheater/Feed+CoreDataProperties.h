//
//  Feed+CoreDataProperties.h
//  JsTheater
//
//  Created by Ian Rahman on 10/21/16.
//  Copyright © 2016 illyabbi. All rights reserved.
//

#import "Feed+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Feed (CoreDataProperties)

+ (NSFetchRequest<Feed *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *url;

@end

NS_ASSUME_NONNULL_END
