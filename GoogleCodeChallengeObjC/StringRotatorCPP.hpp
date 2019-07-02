//
//  StringRotatorCPP.hpp
//  GoogleCodeChallengeObjC
//
//  Created by Matt Lintlop on 7/1/19.
//  Copyright © 2019 Matt Lintlop. All rights reserved.
//

#ifndef StringRotatorCPP_hpp
#define StringRotatorCPP_hpp

#include <stdio.h>
#include <cstdlib>
#include <vector>

using namespace std;

class StringRotatorCPP {
    
public:
    vector<vector<char*>*>* findAllCommonRotatedStringsWithStrings(vector<char*>* inputStrings);
    vector<char*>* findFirstCommonRotatedStrings(vector<char*>* inputStrings);

private:
    bool canRotateStrings(char* string1, char*string2);
};

#endif /* StringRotatorCPP_hpp */
