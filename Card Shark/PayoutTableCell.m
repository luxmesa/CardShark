//
//  PayoutTableCell.m
//  Card Shark
//
//  Created by Samuel Vercauteren on 4/9/17.
//  Copyright © 2017 Samuel Vercauteren. All rights reserved.
//

#import "PayoutTableCell.h"

@interface PayoutTableCell()

@property (weak, nonatomic) IBOutlet UITextField *valueField;

@end

@implementation PayoutTableCell {
    NSInteger _index;
    NSMutableArray *_tableValues;
}

static NSArray *_typeNames;

+(void) initialize{
    _typeNames = @[@"Pair Jacks or Better", @"Two Pair", @"Three of a Kind", @"Straight", @"Flush", @"Full House", @"Four of a Kind", @"Straight Flush", @"Royal Flush"];

}

-(NSInteger) index {
    return _index;
}

-(void) setIndex:(NSInteger)value {
    _index = value;
    self.textLabel.text = _typeNames[value];
    if(self.tableValues != nil) {
        [self updateValue];
    }
}

-(NSMutableArray*)tableValues {
    return _tableValues;
}

-(void)setTableValues:(NSMutableArray *)tableValues {
    _tableValues = tableValues;
    [self updateValue];
}

-(void)updateValue {
    self.valueField.text = [self.tableValues[self.index] stringValue];
}

- (IBAction)ValueChanged:(id)sender {
    NSInteger integer = [self.valueField.text integerValue];
    self.tableValues[self.index] = [NSNumber numberWithInteger:integer];
}

@end
