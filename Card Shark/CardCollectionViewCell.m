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
    UISwipeGestureRecognizer *_up;
    UISwipeGestureRecognizer *_down;
    UISwipeGestureRecognizer *_left;
    UISwipeGestureRecognizer *_right;
}

-(void) setUpGestures {
    if(_up == nil)
    {
        _up = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
        _up.direction = UISwipeGestureRecognizerDirectionUp;
        [self addGestureRecognizer:_up];
    }
    
    if(_down == nil)
    {
        _down = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
        _down.direction = UISwipeGestureRecognizerDirectionDown;
        [self addGestureRecognizer:_down];
    }
    
    if(_left == nil)
    {
        _left = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
        _left.direction = UISwipeGestureRecognizerDirectionLeft;
        [self addGestureRecognizer:_left];
    }
    
    if(_right == nil)
    {
        _right = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
        _right.direction = UISwipeGestureRecognizerDirectionRight;
        [self addGestureRecognizer:_right];
    }
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)recognizer {
    
    switch (recognizer.direction)
    {
        case (UISwipeGestureRecognizerDirectionRight):
            if(self.cardValue < 13)
               [self setCardValue:self.cardValue + 39];
            else
                [self setCardValue:self.cardValue - 13];
            break;
            
        case (UISwipeGestureRecognizerDirectionLeft):
            if(self.cardValue > 38)
                [self setCardValue:self.cardValue - 39];
            else
                [self setCardValue:self.cardValue + 13];
            break;
            
        case (UISwipeGestureRecognizerDirectionUp):
            if(self.cardValue % 13 == 0)
                [self setCardValue:self.cardValue + 12];
            else
                [self setCardValue:self.cardValue - 1];
            break;
            
        case(UISwipeGestureRecognizerDirectionDown):
            if(self.cardValue % 13 == 12)
                [self setCardValue:self.cardValue - 12];
            else
                [self setCardValue:self.cardValue + 1];
            break;
            
        default:
            break;
    }
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
