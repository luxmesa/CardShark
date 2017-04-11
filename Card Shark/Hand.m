//
//  Hand.m
//  Card Shark
//
//  Created by Samuel Vercauteren on 4/9/17.
//  Copyright © 2017 Samuel Vercauteren. All rights reserved.
//

#import "Hand.h"

@implementation Hand

NSArray *_cards;

-(void)viewDidLoad {
    [super viewDidLoad];
    _cards = @[@1, @2, @3, @4, @5];
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell setCardValue:[_cards[indexPath.row] integerValue]];
    [cell setUpGestures];
    
    return cell;
}

-(long long)getHandCode {
    long long int hand = 0;
    long long int mask;
    for(int i = 0;i < 5;i++) {
        mask = 1<<[_cards[i] integerValue];
        hand = hand | mask;
    }
    return hand;
}

-(void)setInvalid:(long long)mark {
}

@end
