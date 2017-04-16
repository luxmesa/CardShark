//
//  Hand.h
//  Card Shark
//
//  Created by Samuel Vercauteren on 4/9/17.
//  Copyright © 2017 Samuel Vercauteren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CardCollectionViewCell.h"
#import "PayoutTable.h"
#import "ExpectedPayoffCalculator.h"

@interface HandViewController : UIViewController <UICollectionViewDataSource>

-(long long int) getHandCode;
-(void)handUpdated;
-(void)setInvalid:(long long)mark;

-(NSMutableArray*)tableValues;
-(void)setTableValues:(NSMutableArray*)value;

@end
