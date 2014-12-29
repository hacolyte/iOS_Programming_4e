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
        
        for (int i = 0; i < 10; i++) {
            BNRItem *item = [BNRItem randomItem];
            [items addObject:item];
        }
        
        // Add new item with initializer to array for test
        BNRItem *itemForSerials = [[BNRItem alloc] initWithItemName:@"Green Sofa" serialNumber:@"A1B2CC"];
        [items addObject:itemForSerials];
        
        for (BNRItem *item in items) {
            NSLog(@"%@", item);
        }
        
        // Destroy the mutable array object
        items = nil;
        
    }
    return 0;
}
