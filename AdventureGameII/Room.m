//
//  Room.m
//  AdventureGameII
//
//  Created by Jeremy Petter on 2015-05-09.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "Room.h"

@implementation Room

- (void) attachEastOf: (Room*) target
{
    self.west = target;
    target.east = self;
}

- (void) attachSouthOf: (Room*) target
{
    self.north = target;
    target.south = self;
}

@end
