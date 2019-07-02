//
//  StringRotatorCPP.cpp
//  GoogleCodeChallengeObjC
//
//  Created by Matt Lintlop on 7/1/19.
//  Copyright © 2019 Matt Lintlop. All rights reserved.
//

#include "StringRotatorCPP.hpp"

vector<vector<char*>*>* StringRotatorCPP::findAllCommonRotatedStringsWithStrings(vector<char*>* inputStrings) {
    return NULL;
}
vector<char*>* StringRotatorCPP::findFirstCommonRotatedStrings(vector<char*>* inputStrings) {
    return NULL;
}

bool StringRotatorCPP::canRotateStrings(char* string1, char*string2) {
    if ((string1 == NULL) || (string2 == NULL)) {
        return false;
    }
    size_t string1Length = strlen(string1);
    size_t string2Length = strlen(string2);
    if (string1Length != string2Length) {
        return false;
    }
    int firstCharRotateCount = 0;
    for (int index = 0; index < string1Length; index++) {
        int charRotateCount = string2[index] - string1[index];
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
                return false;
            }
        }
    }
    return true;
}
