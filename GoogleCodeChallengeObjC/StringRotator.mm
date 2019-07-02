//
//  StringRotator.m
//  GoogleCodeChallengeObjC
//
//  Created by Matt Lintlop on 7/1/19.
//  Copyright © 2019 Matt Lintlop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StringRotator.h"

@implementation StringRotator

// Find the first common rotated strings in a list of input strings .
// Returns an array of common strings.
- (NSArray<NSString*>*) findFirstCommonRotatedStrings:(NSArray<NSString*>*)inputStrings {
    if (inputStrings.count  < 2) {
        return inputStrings;
    }
    NSString *firstString = inputStrings[0];
    NSMutableArray<NSString*>* commonStrings = [[NSMutableArray alloc] initWithObjects:firstString, nil];
    for (NSUInteger index = 1; index < inputStrings.count; index++) {
        NSString *inputString = inputStrings[index];
        if ([self canRotateString:firstString toString:inputString]) {
            [commonStrings addObject:inputString];
        }
    }
    return commonStrings;
    
}

// Find all of the common rotated strings in a list of input strings .
// Returns an array of an array of common strings.
- (NSArray<NSArray<NSString*>*>*) findAllCommonRotatedStringsWithStrings:(NSArray<NSString*>*)inputStrings {
    NSMutableArray<NSArray<NSString*>*>* resultStrings = [[NSMutableArray alloc] init];
    NSMutableArray<NSString*>* remainingStrings = [inputStrings mutableCopy];
    const NSUInteger kMinCommonStringsCount = 1;
    while (remainingStrings.count >= kMinCommonStringsCount) {
        
        // find all common strings in the remaining strings
        NSArray<NSString*>* commonRotatedStrings = [self findFirstCommonRotatedStrings:remainingStrings];
        if (commonRotatedStrings.count >= kMinCommonStringsCount) {
            [resultStrings addObject:commonRotatedStrings];
            if (remainingStrings.count == kMinCommonStringsCount) {
                return (NSArray<NSArray<NSString*>*>*) resultStrings;
            }
        }

        // remove the common strings from the remaining strings
        for (NSString *commonRotatedString in commonRotatedStrings) {
            [remainingStrings removeObject:commonRotatedString];
        }
    }
    return (NSArray<NSArray<NSString*>*>*) resultStrings;
}

// Determine if string #1 can be rotated to string #2 by a constant rotation value
// ex: (+) rotation value 1 = 'a'->'b'
// ex: (-) rotation value -1 = 'b' ->'a'
- (Boolean) canRotateString:(NSString*)string1 toString:(NSString*)string2 {
    if (string1.length != string2.length) {
        return NO;
    }
    SInt8 firstCharRotateCount = 0;
    const char *string1UTF8 = string1.UTF8String;
    const char *string2UTF8 = string2.UTF8String;
    for (NSUInteger index = 0; index < string1.length; index++) {
        SInt8 charRotateCount = string2UTF8[index] - string1UTF8[index];
        while (charRotateCount < 0) {
            charRotateCount += 26;
        }
        while (charRotateCount > 25) {
            charRotateCount -= 26;
        }
        if (index == 0) {
            firstCharRotateCount = charRotateCount;
        }
        else {
            if (charRotateCount != firstCharRotateCount) {
                return NO;
            }
        }
    }
    return YES;
}

@end

