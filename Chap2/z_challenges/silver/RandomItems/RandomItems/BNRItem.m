//
//  BNRItem.m
//  RandomItems
//
//  Created by Benjamin Pearson on 12/28/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

// Designated Initializer
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber
{
    // Call the superclass's designated initializer
    self = [super init];
    
    // Did the superclass's designated initializer succeed?
    if (self){
        // Give the instance variables initial values
        _itemName = name;
        _serialNumber = sNumber;
        _valueInDollars = value;
        // Set _dateCreated to current date and time
        _dateCreated = [[NSDate alloc] init];
    }
    
    // Return the address of the newly initialized object
    return self;
}

// Secondary initializer, calling the designated initializer
- (instancetype)initWithItemName:(NSString *)name
{
    return [self initWithItemName:name
                   valueInDollars:0
                     serialNumber:@""];
}
// Third initializer
- (instancetype)initWithItemName:(NSString *)name
                    serialNumber:(NSString *)sNumber
{
    return [self initWithItemName:name
                   valueInDollars:0
                     serialNumber:sNumber];
}

// Create custom implementation of setContainedItem to provide additional functionality
- (void)setContainedItem:(BNRItem *)containedItem
{
    _containedItem = containedItem;
    self.containedItem.container = self;
}

// Call initWithItemName: (which calls designated initializer),
// passing it the default item values
- (instancetype)init
{
    return [self initWithItemName:@"Item"];
}

// Create, configure and return a randomItem
+ (instancetype)randomItem
{
    // Create an immutable array of three adjectives
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    
    // Create an immutable array of three nouns
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    // Get the index of a random adjective/noun from the lists
    // Note: The % operator, called the modulo operator, gives you the remainder.
    // So adjectiveIndex is a random from 0 - 2 inclusive.
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    // Note that NSInteger is not an object, but a type definition for "long"
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@", randomAdjectiveList[adjectiveIndex],
                            randomNounList[nounIndex]];
    
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    'O' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    'O' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    'O' + arc4random() % 10];
    
    BNRItem *newItem = [[self alloc] initWithItemName:randomName
                                       valueInDollars:randomValue
                                         serialNumber:randomSerialNumber];
    
    return newItem;
    
}

// Display a message when an object is dellocated by ARC
- (void)dealloc
{
    NSLog(@"Object Destroyed!", self);
}

// Override the description of NSObject
- (NSString *)description
{
    NSString *descriptionString =
        [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
         self.itemName,
         self.serialNumber,
         self.valueInDollars,
         self.dateCreated];
    
    return descriptionString;
}

@end
