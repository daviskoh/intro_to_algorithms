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

NSArray* (^merge)(NSArray*, NSArray*, int) = ^(NSArray *array1, NSArray *array2, int resultLen) {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    int i = 0;
    int j = 0;

    for (int k = 0; k <= resultLen - 1; k++) {
        if (j == array2.count) {
            result[k] = array1[i];
            i++;
        } else if (i == array1.count) {
            result[k] = array2[j];
            j++;
        } else if (array1[i] < array2[j]) {
            result[k] = array1[i];
            i++;
        } else if (array2[j] < array1[i]) {
            result[k] = array2[j];
            j++;
        }
    }
    
    return [result copy];
};

NSArray* (^mergeSort)(NSArray *) = ^(NSArray *array) {
    if (array.count < 2) return array;
    
    NSArray *firstHalf;
    NSArray *secondHalf;
    NSRange halfOfInput;
    NSUInteger halfOfArray = array.count / 2;
    NSUInteger remainder = array.count % 2;
    
    halfOfInput.location = 0;
    halfOfInput.length = halfOfArray;
    firstHalf = mergeSort([array subarrayWithRange: halfOfInput]);
    
    NSLog(@"firstHalf: %@", firstHalf);
    
    halfOfInput.location = firstHalf.count;
    halfOfInput.length = remainder ? halfOfArray + remainder : halfOfArray;
    secondHalf = mergeSort([array subarrayWithRange: halfOfInput]);

    NSLog(@"secondHalf: %@", secondHalf);
    
    return merge(firstHalf, secondHalf, (int)array.count);
};