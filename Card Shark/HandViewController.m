//
//  Hand.m
//  Card Shark
//
//  Created by Samuel Vercauteren on 4/9/17.
//  Copyright © 2017 Samuel Vercauteren. All rights reserved.
//

#import "HandViewController.h"

@interface HandViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *handCollectionView;

@end

@implementation HandViewController {

    NSMutableArray *_cards;
    NSMutableArray *_tableValues;
    NSInteger _valid;
    ExpectedPayoffCalculator *_calculator;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    _cards = [[NSMutableArray alloc] initWithObjects: @0, @1, @2, @3, @4, nil];
    _tableValues = [[NSMutableArray alloc] initWithObjects: @1, @2, @3, @4, @6, @9, @25, @50, @250, nil];
    _calculator = [[ExpectedPayoffCalculator alloc] init];
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell setIsValid:(_valid & 1LL<<[_cards[indexPath.row] integerValue]) == 0];
    [cell setCardValues:_cards];
    [cell setIndex:indexPath.row];
    [cell setUpdateCard:^ {[self handUpdated];}];
    [cell setUpGestures];
    
    return cell;
}

-(long long)getHandCode {
    long long int hand = 0;
    long long int mask;
    for(int i = 0;i < 5;i++) {
        mask = 1LL<<[_cards[i] integerValue];
        hand = hand | mask;
    }
    return hand;
}

-(void)handUpdated {
    long long mark = 0;
    for(int i = 0;i < 5;i++)
    {
        for(int j = 0;j < 5;j++)
        {
            if(i != j && [_cards[i] integerValue] == [_cards[j] integerValue])
            {
                mark = mark | 1LL<<[_cards[i] integerValue];
                
            }
        }
    }
    [self setInvalid:mark];
}

- (IBAction)CalculateHand:(id)sender {
    [self setInvalid:[_calculator analyzeHand:_cards withTable:_tableValues]];
}

-(void)setInvalid:(long long)mark {
    _valid = mark;
    [self.handCollectionView reloadData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    PayoutTable *table = [segue destinationViewController];
    
    [table setTableValues:_tableValues];
}

-(void)setTableValues:(NSMutableArray *)tableValues {
    _tableValues = tableValues;
}

-(NSMutableArray*)tableValues {
    return _tableValues;
}



@end
