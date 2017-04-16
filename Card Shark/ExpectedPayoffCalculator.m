//
//  ExpectedPayoffCalculator.m
//  Card Shark
//
//  Created by Samuel Vercauteren on 4/16/17.
//  Copyright © 2017 Samuel Vercauteren. All rights reserved.
//

#import "ExpectedPayoffCalculator.h"

@interface ExpectedPayoffCalculator ()

@property NSDictionary *results;

@end

@implementation ExpectedPayoffCalculator

-(instancetype)init {
    self = [super init];
    if(self) {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"results" ofType:@"plist"];
        self.results = [NSKeyedUnarchiver unarchiveObjectWithFile:plistPath];
    }
    return self;
}

-(long long) analyzeHand:(NSMutableArray*)hand withTable:(NSMutableArray*)payout {
    long long keys[32] = { 0LL };
    long long llHand = 0LL;
    int divisors[32];
    divisors[31] = 1;
    divisors[30] = 47;
    divisors[29] = 47;
    divisors[28] = 1081;
    divisors[27] = 47;
    divisors[26] = 1081;
    divisors[25] = 1081;
    divisors[24] = 16215;
    divisors[23] = 47;
    divisors[22] = 1081;
    divisors[21] = 1081;
    divisors[20] = 16215;
    divisors[19] = 1081;
    divisors[18] = 16215;
    divisors[17] = 16215;
    divisors[16] = 178365;
    divisors[15] = 47;
    divisors[14] = 1081;
    divisors[13] = 1081;
    divisors[12] = 16215;
    divisors[11] = 1081;
    divisors[10] = 16215;
    divisors[9] = 16215;
    divisors[8] = 178365;
    divisors[7] = 1081;
    divisors[6] = 16215;
    divisors[5] = 16215;
    divisors[4] = 178365;
    divisors[3] = 16215;
    divisors[2] = 178365;
    divisors[1] = 178365;
    divisors[0] = 1533939;
    for(int i = 0; i< 5;i++)
    {
        for(int j = 0;j < 32;j++)
        {
            if((j & 1<<i) != 0) {
                keys[j] = keys[j] | 1LL<<[hand[i] intValue];
            }
        }
        
        llHand = llHand | 1LL<<[hand[i] intValue];
    }
    NSMutableDictionary *runningPayouts = [[NSMutableDictionary alloc] init];
    for(int i = 0;i < 32;i++)
    {
        [runningPayouts setObject:@0 forKey:[NSNumber numberWithLongLong:keys[i]]];
    }
    
    for(NSNumber *key in [self.results keyEnumerator]) {
        NSNumber *compare = [NSNumber numberWithLongLong:([key longLongValue] & llHand)];
        int newPayout = [[runningPayouts objectForKey:compare] intValue] + [payout[[[self.results objectForKey:key] intValue]] intValue];
        [runningPayouts setObject:[NSNumber numberWithInt:newPayout] forKey:compare];
    }
    
    float maxCurrent = 0.0f;
    long long maxCode = 31;
    
    for(int i = 0;i < 32;i++)
    {
        NSNumber *currentMax = [NSNumber numberWithLongLong:keys[i]];
        
        float current = [[runningPayouts objectForKey:currentMax] floatValue] / divisors[i];
        
        if(current > maxCurrent) {
            maxCurrent = current;
            maxCode = keys[i];
        }
    }
    return ~maxCode;
}

@end
