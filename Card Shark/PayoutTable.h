//
//  PayoutTable.h
//  Card Shark
//
//  Created by Samuel Vercauteren on 4/9/17.
//  Copyright © 2017 Samuel Vercauteren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayoutTableCell.h"
#import "HandViewController.h"

@interface PayoutTable : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property NSMutableArray *tableValues;

@end
