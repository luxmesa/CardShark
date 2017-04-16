//
//  ExpectedPayoffCalculator.h
//  Card Shark
//
//  Created by Samuel Vercauteren on 4/16/17.
//  Copyright © 2017 Samuel Vercauteren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExpectedPayoffCalculator : NSObject

-(long long) analyzeHand:(NSMutableArray*)hand withTable:(NSMutableArray*)payout;

@end
