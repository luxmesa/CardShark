//
//  PayoutTableCell.h
//  Card Shark
//
//  Created by Samuel Vercauteren on 4/9/17.
//  Copyright © 2017 Samuel Vercauteren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayoutTableCell : UITableViewCell

@property NSInteger index;

-(void)setTableValues:(NSMutableArray *)tableValues;
-(NSMutableArray*)tableValues;

-(NSInteger) index;
-(void) setIndex:(NSInteger)value;

@end
