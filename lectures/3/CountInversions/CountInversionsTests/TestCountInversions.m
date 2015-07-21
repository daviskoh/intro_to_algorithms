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
    NSDictionary *expectation;
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
    XCTAssertEqualObjects([array countInversions][@"inversions"], @0);
    
    array = @[@1];
    XCTAssertEqualObjects([array countInversions][@"inversions"], @0);
}

- (void)testSingleOccurrence {
    array = @[@2,@1];
    XCTAssertEqualObjects([array countInversions][@"inversions"], @1);
    
    array = @[@9,@5];
    XCTAssertEqualObjects([array countInversions][@"inversions"], @1);
}

- (void)testRecursiveCase {
    array = @[@1, @3, @5, @2, @4, @6];
    XCTAssertEqualObjects([array countInversions][@"inversions"], @3);
    
    array = @[@9, @5, @3, @6, @8];
    XCTAssertEqualObjects([array countInversions][@"inversions"], @5);
}

@end
