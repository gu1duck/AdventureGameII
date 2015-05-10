//
//  Room.h
//  AdventureGameII
//
//  Created by Jeremy Petter on 2015-05-09.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Room : NSObject

@property(nonatomic) Room* north;
@property(nonatomic) Room* south;
@property(nonatomic) Room* east;
@property(nonatomic) Room* west;
@property(nonatomic) Room* up;
@property(nonatomic) Room* down;
@property(nonatomic) NSDictionary* chalk;

- (void) attachEastOf: (Room*) target;
- (void) attachSouthOf: (Room*) target;
- (instancetype)init;

@end
