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

-(id)init {
    if (self = [super init]) {
        NSLog(@"Initialize the StringRotator");
    }
    return self;
}

- (NSArray<NSArray<NSString*>*>*) findAllCommonRotatedStringsWithStrings:(NSArray<NSString*>*)inputStrings {
    NSMutableArray<NSArray<NSString*>*>* resultStrings = [[NSMutableArray alloc] init];
    NSMutableArray<NSString*>* remainingStrings = [inputStrings mutableCopy];
    while (remainingStrings.count >= 1) {
        
        // find all common strings in the remaining strings
        NSArray<NSString*>* commonRotatedStrings = [self findCommonRotatedStringsWithStrings:remainingStrings];
        if (commonRotatedStrings.count >= 2) {
            [resultStrings addObject:commonRotatedStrings];
        }

        // remove the common strings from the remaining strings
        for (NSString *commonRotatedString in commonRotatedStrings) {
            [remainingStrings removeObject:commonRotatedString];
        }
    }
    return (NSArray<NSArray<NSString*>*>*) resultStrings;
}

- (NSArray<NSString*>*) findCommonRotatedStringsWithStrings:(NSArray<NSString*>*)inputStrings {
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

