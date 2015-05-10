//
//  Player.m
//  AdventureGameII
//
//  Created by Jeremy Petter on 2015-05-10.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)initWithHealth: (int) health andLocation: (Room*) location {
    self = [super init];
    if (self){
        self.health = 100;
        self.location = location;
        self.invenotory = [NSMutableArray array];
    }
    return self;
}

@end
