//
//  MergeSort.h
//  MergeSort
//
//  Created by Davis Koh on 7/15/15.
//  Copyright © 2015 com.DavisKoh. All rights reserved.
//

#import <Cocoa/Cocoa.h>

//! Project version number for MergeSort.
FOUNDATION_EXPORT double MergeSortVersionNumber;

//! Project version string for MergeSort.
FOUNDATION_EXPORT const unsigned char MergeSortVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <MergeSort/PublicHeader.h>


// a little ghetto...
NSArray* (^mergeSort)(NSArray *) = ^(NSArray *array) {
    if (array.count < 2) return array;
    
    return [[NSArray alloc] init];
};