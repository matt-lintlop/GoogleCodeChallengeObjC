//
//  AppDelegate.m
//  GoogleCodeChallengeObjC
//
//  Created by Matt Lintlop on 7/1/19.
//  Copyright © 2019 Matt Lintlop. All rights reserved.
//

#import "AppDelegate.h"
#import "StringRotator.h"
#import "StringRotatorCPP.hpp"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self doGoogleCodeChallengeObjC];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void)doGoogleCodeChallengeObjC {
    NSArray<NSString *>* inputStrings = @[@"abbc",@"cdde",@"zaab",@"cat",@"thfg",@"ed",@"bzs"];
    StringRotator *stringRotator = [[StringRotator alloc] init];
    NSLog(@"\n\n********************************************************");
    NSLog(@"Google Objective-C Code Challenge Obj-C:");
    NSLog(@"Input Strings: %@", inputStrings);
    NSArray<NSArray<NSString*>*>* resultStrings = [stringRotator findAllCommonRotatedStringsWithStrings:inputStrings];
    if ((resultStrings != nil) && (resultStrings.count >= 1)) {
        NSLog(@"Result has %lu strings: %@", (unsigned long)resultStrings.count, resultStrings);
    }
    else {
        NSLog(@"Result is nil");
    }
}

@end
