//
//  BNRContainer.h
//  RandomItems
//
//  Created by Benjamin Pearson on 12/29/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRItem.h"

@interface BNRContainer : BNRItem

{
    NSMutableArray *_subitems;
    NSString *_containerName;
}

- (void)setContainerName:(NSString *)str;
- (NSString *)containerName;

- (NSArray *)items;

- (void)addItem:(BNRItem *)item;
- (BNRItem *)itemAtIndex:(int)index;

- (int)valueInDollars;

@end
