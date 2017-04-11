//
//  PayoutTable.m
//  Card Shark
//
//  Created by Samuel Vercauteren on 4/9/17.
//  Copyright © 2017 Samuel Vercauteren. All rights reserved.
//

#import "PayoutTable.h"

@implementation PayoutTable


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 9; //going to get this from the base
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PayoutTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    [cell setIndex:indexPath.row];
    
    return cell;
}

- (IBAction)DonePressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
