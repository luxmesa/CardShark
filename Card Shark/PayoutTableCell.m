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
}

static NSArray *_typeNames;
NSInteger _index;

+(void) initialize{
    _typeNames = @[@"Pair Jacks or Better", @"Two Pair", @"Three of a Kind", @"Straight", @"Flush", @"Full House", @"Four of a Kind", @"Straight Flush", @"Royal Flush"];

}

-(NSInteger) index {
    return _index;
}

-(void) setIndex:(NSInteger)value {
    _index = value;
    self.textLabel.text = _typeNames[value];
}

-(instancetype) initWithIndex:(NSInteger)value {
    self = [super init];
    if(self) {
        [self setIndex:value];
    }
    return self;
}

- (IBAction)ValueChanged:(id)sender {
    // there is some model that represents this table.  For now, we do nothing
}

@end
