//
//  AcceleratorWishTests.m
//  AcceleratorWishTests
//
//  Created by azu on 2013/09/10.
//  Copyright (c) 2013 azu. All rights reserved.
//

#import "AcceleratorWishTests.h"
#import "InheritancePerson.h"
#import "WishInheritancePerson.h"

@implementation AcceleratorWishTests

- (void)setUp {
    [super setUp];

    // Set-up code here.
}

- (void)tearDown {
    // Tear-down code here.

    [super tearDown];
}

- (void)testInheritancePerson {
    InheritancePerson *person = (InheritancePerson *)[InheritancePerson modelObjectWithDictionary:@{}];
    STAssertTrue([person isKindOfClass:[InheritancePerson class]], @"should be kind of InheritancePerson");
}

- (void)testWishInheritancePerson {
    WishInheritancePerson *person = [WishInheritancePerson modelObjectWithDictionary:@{}];
    STAssertTrue([person isKindOfClass:[WishInheritancePerson class]], @"should be kind of WishInheritancePerson");
}


@end
