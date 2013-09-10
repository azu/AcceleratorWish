//
//  PersonBaseClass.h
//
//  Created by   on 2013/09/10
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PersonBaseClass : NSObject <NSCoding>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double sex;
@property (nonatomic, assign) double age;

+ (PersonBaseClass *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
