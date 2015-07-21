//
//  NSArray+CountInversions.m
//  CountInversions
//
//  Created by Davis Koh on 7/19/15.
//  Copyright © 2015 com.DavisKoh. All rights reserved.
//

#import "NSArray+CountInversions.h"

// TODO: try returning struct instead of NSArray
NSMutableDictionary* (^merge)(NSArray*, NSArray*, int) = ^(NSArray *array1, NSArray *array2, int resultLen) {
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithDictionary: @{
                                                                                   @"array": [[NSMutableArray alloc] init],
                                                                                   @"inversions": @0
                                                                                   }];
    
    int i = 0;
    int j = 0;
    
    for (int k = 0; k <= resultLen - 1; k++) {
        // TODO: optimize ghetto conditionals
        if (j == array2.count) {
            result[@"array"][k] = array1[i++];
        } else if (i == array1.count) {
            result[@"array"][k] = array2[j++];
             result[@"inversions"] = [NSNumber numberWithInt:[result[@"inversions"] intValue] + 1];
        } else if (array1[i] < array2[j]) {
            result[@"array"][k] = array1[i++];
        } else if (array2[j] < array1[i]) {
            result[@"array"][k] = array2[j++];
            result[@"inversions"] = [NSNumber numberWithInt:[result[@"inversions"] intValue] + 1];
        } else {
            result[@"array"][k] = array1[i++];
            result[@"array"][(k++) + 1] = array2[j++];
        }
    }
    
    return [result copy];
};

@implementation  NSArray (CountInversions)

// countInversions keeps track of total inversions
// merge keeps track of split inversions

- (NSMutableDictionary *)countInversions {
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithDictionary: @{
                                                                                   @"array": self,
                                                                                   @"inversions": @0
                                                                                   }];
    
    if (self.count < 2) return result;
    
    NSArray *firstHalf;
    NSArray *secondHalf;
    NSRange halfOfInput;
    NSUInteger halfOfArray = self.count / 2;
    NSUInteger remainder = self.count % 2;
    
    halfOfInput.location = 0;
    halfOfInput.length = halfOfArray;
    firstHalf = [self subarrayWithRange: halfOfInput];
    NSMutableDictionary *left = [firstHalf countInversions];
    
    halfOfInput.location = firstHalf.count;
    halfOfInput.length = remainder ? halfOfArray + remainder : halfOfArray;
    secondHalf = [self subarrayWithRange: halfOfInput];
    NSMutableDictionary *right = [secondHalf countInversions];
    
    NSMutableDictionary *merged = merge(left[@"array"], right[@"array"], (int)self.count);
    
    result[@"array"] = merged[@"array"];
    result[@"inversions"] = @([left[@"inversions"] intValue] + [right[@"inversions"] intValue] + [merged[@"inversions"] intValue]);
    
    return result;
}

@end
