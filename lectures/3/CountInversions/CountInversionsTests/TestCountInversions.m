//
//  TestCountInversions.m
//  CountInversions
//
//  Created by Davis Koh on 7/19/15.
//  Copyright © 2015 com.DavisKoh. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+CountInversions.h"

@interface TestCountInversions : XCTestCase {
    NSArray *array;
}

@end

@implementation TestCountInversions

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testBaseCase {
    array = @[];
    XCTAssertEqual([array countInversions], 0);
    
    array = @[@1];
    XCTAssertEqual([array countInversions], 0);
}



@end
