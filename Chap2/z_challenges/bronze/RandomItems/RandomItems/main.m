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
        
        // Challenge: create a bug by asking for the eleventh item in the array
        NSLog(@"%@", items[10]);
        
        for (BNRItem *item in items) {
            NSLog(@"%@", item);
        }
        
        // Destroy the mutable array object
        items = nil;
        
    }
    return 0;
}
