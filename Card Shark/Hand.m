//
//  Hand.m
//  Card Shark
//
//  Created by Samuel Vercauteren on 4/9/17.
//  Copyright © 2017 Samuel Vercauteren. All rights reserved.
//

#import "Hand.h"

@implementation Hand{
    NSMutableArray *cards;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    cards = [[NSMutableArray alloc] init];
    for(int i = 0;i < 5;i++)
    {
        [cards addObject:[[CardCollectionViewCell alloc] initWithCardValue:i]];
        [cards[i] setIsValid:NO];
    }
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [cards count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell setIsValid:[cards[indexPath.row] isValid]];
    [cell setCardValue:[cards[indexPath.row] cardValue]];
    
    return cell;
}

-(long long)getHandCode {
    long long int hand = 0;
    long long int mask;
    for(int i = 0;i < [cards count];i++) {
        mask = 1<<[cards[i] cardValue];
        hand = hand | mask;
    }
    return hand;
}

-(void)setInvalid:(long long)mark {
    long long mask;
    for(int i = 0;i < [cards count];i++) {
        mask = 1<<[cards[i] cardValue];
        [cards[i] setIsValid:(mark & mask) == 0];
    }
}

@end
