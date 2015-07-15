//
//  MergeSortTests.m
//  MergeSortTests
//
//  Created by Davis Koh on 7/15/15.
//  Copyright © 2015 com.DavisKoh. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MergeSort.h"

@interface MergeSortTests : XCTestCase {
    NSArray *result;
    NSArray *expectation;
}

@end

@implementation MergeSortTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testBaseCase {
    result = mergeSort(@[]);
    XCTAssertEqualObjects(result, @[]);
    
    result = mergeSort(@[@1]);
    XCTAssertEqualObjects(result, @[@1]);
    
    result = mergeSort(@[@99]);
    XCTAssertEqualObjects(result, @[@99]);
}

- (void)testSimpleMerge {
    result = mergeSort(@[@2,@1]);
    expectation = @[@1, @2];
    XCTAssertEqualObjects(result, expectation);
    
    result = mergeSort(@[@5,@3]);
    expectation = @[@3, @5];
    XCTAssertEqualObjects(result, expectation);
}

- (void)testOddNumberOfElements {
    
}

#pragma mark - extra credit

- (void)testDuplicateValues {
    
}

@end
