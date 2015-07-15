//
//  MergeSortTests.m
//  MergeSortTests
//
//  Created by Davis Koh on 7/15/15.
//  Copyright © 2015 com.DavisKoh. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MergeSort.h"

@interface MergeSortTests : XCTestCase

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
    NSArray *result;
    
    result = mergeSort(@[]);
    XCTAssertEqualObjects(result, @[]);
    
    result = mergeSort(@[@1]);
    XCTAssertEqualObjects(result, @[@1]);
    
    result = mergeSort(@[@99]);
    XCTAssertEqualObjects(result, @[@99]);
}

//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
