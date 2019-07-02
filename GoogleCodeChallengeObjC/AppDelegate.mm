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
    [self doGoogleCodeChallengeCPP];
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

- (void)doGoogleCodeChallengeCPP {
    StringRotatorCPP *stringRotatorCPP = new StringRotatorCPP();
    vector<char*>* inputStrings = new vector<char*>;
    inputStrings->push_back((char*)"abbc");
    inputStrings->push_back((char*)"cdde");
    inputStrings->push_back((char*)"zaab");
    inputStrings->push_back((char*)"cat");
    inputStrings->push_back((char*)"thfg");
    inputStrings->push_back((char*)"ed");
    inputStrings->push_back((char*)"bzs");
    NSLog(@"\n\n********************************************************");
    NSLog(@"Google Objective-C Code Challenge C++:");
    vector<vector<char*>*>* resultString = stringRotatorCPP->findAllCommonRotatedStringsWithStrings(inputStrings);
    if (resultString != nil) {
        printf("Result has %d strings\n", resultString->size());
    }
    else {
        printf("Result in NULL\n");
    }
    delete stringRotatorCPP;
}

@end
