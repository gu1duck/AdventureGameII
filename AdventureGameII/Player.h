//
//  Player.h
//  AdventureGameII
//
//  Created by Jeremy Petter on 2015-05-10.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Room.h"

@interface Player : NSObject

@property (nonatomic) int health;
@property (nonatomic) Room* location;
@property (nonatomic) NSMutableArray* invenotory;

- (instancetype)initWithHealth: (int) health andLocation: (Room*) location;
@end
