//
//  CardCollectionViewCell.m
//  Card Shark
//
//  Created by Samuel Vercauteren on 4/9/17.
//  Copyright © 2017 Samuel Vercauteren. All rights reserved.
//

#import "CardCollectionViewCell.h"

@interface CardCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation CardCollectionViewCell{
    NSInteger _cardValue;
    BOOL _isValid;
}

-(instancetype)initWithCardValue:(NSInteger)value {
    self = [super init];
    if (self) {
        [self setCardValue:value];
    }
    return self;
}

-(NSInteger)cardValue {
    return _cardValue;}

-(void) setCardValue:(NSInteger)value {
    _cardValue = value;
    
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"Card%li", self.cardValue]];
    self.image.image = image;
}

-(BOOL)isValid {
    return _isValid;
}

-(void) setIsValid:(BOOL)value {
    _isValid = value;
    self.backgroundColor = _isValid ? [UIColor clearColor] : [UIColor redColor];
}

@end
