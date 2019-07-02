//
//  StringRotator.h
//  GoogleCodeChallengeObjC
//
//  Created by Matt Lintlop on 7/1/19.
//  Copyright © 2019 Matt Lintlop. All rights reserved.
//

#ifndef StringRotator_h
#define StringRotator_h

@interface StringRotator : NSObject

- (id) init;
- (NSArray<NSArray<NSString*>*>*) findAllCommonRotatedStringsWithStrings:(NSArray<NSString*>*)inputStrings;
- (NSArray<NSString*>*) findCommonRotatedStringsWithStrings:(NSArray<NSString*>*)inputStrings;
- (Boolean) canRotateString:(NSString*)string1 toString:(NSString*)string2;

@end


#endif /* StringRotator_h */
