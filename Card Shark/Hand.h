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

@interface Hand : UIViewController <UICollectionViewDataSource>

-(long long int) getHandCode;

-(void) setInvalid:(long long int)mark;

@end
