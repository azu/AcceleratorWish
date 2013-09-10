//
//  PersonBaseClass.m
//
//  Created by   on 2013/09/10
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "PersonBaseClass.h"


NSString *const kPersonBaseClassName = @"name";
NSString *const kPersonBaseClassSex = @"sex";
NSString *const kPersonBaseClassAge = @"age";


@interface PersonBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PersonBaseClass

@synthesize name = _name;
@synthesize sex = _sex;
@synthesize age = _age;


+ (PersonBaseClass *)modelObjectWithDictionary:(NSDictionary *)dict
{
    PersonBaseClass *instance = [[PersonBaseClass alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.name = [self objectOrNilForKey:kPersonBaseClassName fromDictionary:dict];
            self.sex = [[self objectOrNilForKey:kPersonBaseClassSex fromDictionary:dict] doubleValue];
            self.age = [[self objectOrNilForKey:kPersonBaseClassAge fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kPersonBaseClassName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sex] forKey:kPersonBaseClassSex];
    [mutableDict setValue:[NSNumber numberWithDouble:self.age] forKey:kPersonBaseClassAge];

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

    self.name = [aDecoder decodeObjectForKey:kPersonBaseClassName];
    self.sex = [aDecoder decodeDoubleForKey:kPersonBaseClassSex];
    self.age = [aDecoder decodeDoubleForKey:kPersonBaseClassAge];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kPersonBaseClassName];
    [aCoder encodeDouble:_sex forKey:kPersonBaseClassSex];
    [aCoder encodeDouble:_age forKey:kPersonBaseClassAge];
}


@end
