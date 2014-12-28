//
//  main.m
//  RandomItems
//
//  Created by Benjamin Pearson on 12/27/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Create a mutable array object, store its address in items variable
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        // Send the message addObject: to the NSMUtableArray pointed to
        // by the variable items, passing a string each time
        [items addObject:@"one"];
        [items addObject:@"two"];
        [items addObject:@"three"];
        
        // Send another message to add to the index
        [items insertObject:@"zero" atIndex:0];
        
        // For every item in the items array...
        for (NSString *item in items) {
            NSLog(@"%@", item);
        }
        
        BNRItem *item = [[BNRItem alloc] init];
        
        // This creates two strings and sets them to the BNRItem object using dot syntax
        item.itemName = @"Red Sofa";
        item.serialNumber = @"A1B2C";
        
        // Same thing, but with an integer
        item.valueInDollars = 100;
        
        NSLog(@"%@ %@ %@ %d", [item itemName], [item dateCreated], [item serialNumber], [item valueInDollars]);
        
        // Destroy the mutable array object
        items = nil;
        
    }
    return 0;
}
