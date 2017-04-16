//
//  main.m
//  HandResultsGenerator
//
//  Created by Samuel Vercauteren on 4/15/17.
//  Copyright © 2017 Samuel Vercauteren. All rights reserved.
//

#import <Foundation/Foundation.h>

// gets the results for a hand.  Assumes hand is sorted
int getResult(int* hand) {
    int values[13] = { 0 };
    int commonValue, highValue, lowValue, uniqueValues;
    BOOL isFlush;
    uniqueValues = 1;
    commonValue = hand[0] % 13;
    highValue = hand[0] % 13;
    lowValue = hand[0] % 13;
    values[hand[0] % 13] = 1;
    isFlush = hand[0] / 13 == hand[4] / 13;
    
    
    for(int i = 1;i < 5;i++) {
        int value = hand[i] %13;
        values[value]++;
        if(values[value] == 1)
            uniqueValues++;
        if(values[value] > values[commonValue])
            commonValue = value;
        if(value < lowValue)
            lowValue = value;
        if(value > highValue)
            highValue = value;
    }
    
    BOOL extraStraight = values[0] == 1 && values[1] == 1 && values[2] == 1 && values[3] == 1 && values[12] == 1;
    
    // -1 nothing
    // 0 pair jacks or better
    // 1 two pair
    // 2 three of a kind
    // 3 straight
    // 4 flush
    // 5 full house
    // 6 four of a kind
    // 7 straight flush
    // 8 royal flush
    
    if(isFlush) {
        if(highValue - lowValue == 4 || extraStraight) {
            if(highValue == 12 && !extraStraight)
                return 8;
            return 7;
        }
        return 4;
    }
    if(uniqueValues == 2) {
        if(values[commonValue] == 4)
            return 6;
        return 5;
    }
    if(uniqueValues == 5 && (highValue - lowValue == 4 || extraStraight))
        return 3;
    if(uniqueValues == 3) {
        if(values[commonValue] == 3)
            return 2;
        return 1;
    }
    if(uniqueValues == 4 && commonValue >= 9)
        return 0;
    return -1;
}

int main(int argc, const char * argv[]) {
    int result;
    int hand[5];
    int results[9] = { 0 };
    long long encodeHand;
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    for(int a = 0;a < 52;a++) {
        for(int b = a + 1;b < 52;b++) {
            for(int c = b + 1;c < 52;c++) {
                for(int d = c +1;d < 52;d++) {
                    for(int e = d + 1;e < 52;e++){
                        hand[0] = a;
                        hand[1] = b;
                        hand[2] = c;
                        hand[3] = d;
                        hand[4] = e;
                        result = getResult(hand);
                        if(result != -1) {
                            encodeHand = 0LL;
                            encodeHand = encodeHand | 1LL<<a | 1LL<<b | 1LL<<c | 1LL<<d | 1LL<<e;
                            [dictionary setObject:[NSNumber numberWithInt:result] forKey:[NSNumber numberWithLongLong:encodeHand]];
                            //NSLog(@"%i %i %i %i %i: %i", a, b, c, d, e, result);
                            results[result]++;
                        }
                    }
                }
            }
        }
    }
    
    for(int i = 0;i < 9;i++)
    {
        NSLog(@"%i %i", i, results[i]);
    }
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *downloads = [fileManager URLForDirectory:NSDownloadsDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
    NSURL *path = [downloads URLByAppendingPathComponent:@"results.plist"];
    [NSKeyedArchiver archiveRootObject:dictionary toFile:[path path]];

    return 0;
}
