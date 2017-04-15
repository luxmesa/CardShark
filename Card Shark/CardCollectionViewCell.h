//
//  CardCollectionViewCell.h
//  Card Shark
//
//  Created by Samuel Vercauteren on 4/9/17.
//  Copyright © 2017 Samuel Vercauteren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardCollectionViewCell : UICollectionViewCell

@property void (^updateCard)(void);

-(NSInteger) cardValue;
-(void) setCardValue:(NSInteger)value;

-(NSInteger) index;

-(void) setIndex:(NSInteger)value;

-(NSMutableArray*)cardValues;

-(void)setCardValues:(NSMutableArray *)tableValues;

-(void) setIsValid:(BOOL) value;
-(void) setUpGestures;

@end
