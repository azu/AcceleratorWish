//
//  WishPersonBaseClass.m
//
//  Created by   on 2013/09/10
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "WishPersonBaseClass.h"


NSString *const kWishPersonBaseClassName = @"name";
NSString *const kWishPersonBaseClassSex = @"sex";
NSString *const kWishPersonBaseClassAge = @"age";


@interface WishPersonBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WishPersonBaseClass

@synthesize name = _name;
@synthesize sex = _sex;
@synthesize age = _age;

// <CLASS NAME> * -> instancetype
+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    // // [<CLASS NAME> alloc] -> [self alloc]
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.name = [self objectOrNilForKey:kWishPersonBaseClassName fromDictionary:dict];
            self.sex = [[self objectOrNilForKey:kWishPersonBaseClassSex fromDictionary:dict] doubleValue];
            self.age = [[self objectOrNilForKey:kWishPersonBaseClassAge fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kWishPersonBaseClassName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sex] forKey:kWishPersonBaseClassSex];
    [mutableDict setValue:[NSNumber numberWithDouble:self.age] forKey:kWishPersonBaseClassAge];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.name = [aDecoder decodeObjectForKey:kWishPersonBaseClassName];
    self.sex = [aDecoder decodeDoubleForKey:kWishPersonBaseClassSex];
    self.age = [aDecoder decodeDoubleForKey:kWishPersonBaseClassAge];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kWishPersonBaseClassName];
    [aCoder encodeDouble:_sex forKey:kWishPersonBaseClassSex];
    [aCoder encodeDouble:_age forKey:kWishPersonBaseClassAge];
}


@end
