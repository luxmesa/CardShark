//
//  CardCollectionViewCell.h
//  Card Shark
//
//  Created by Samuel Vercauteren on 4/9/17.
//  Copyright © 2017 Samuel Vercauteren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardCollectionViewCell : UICollectionViewCell

-(NSInteger) cardValue;
-(void) setCardValue:(NSInteger)value;

-(BOOL) isValid;
-(void) setIsValid:(BOOL) value;

-(instancetype) initWithCardValue:(NSInteger)value;

@end
