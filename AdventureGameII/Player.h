//
//  Player.h
//  AdventureGameII
//
//  Created by Jeremy Petter on 2015-05-10.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DungeonInhabitant.h"


@interface Player : DungeonInhabitant

@property (nonatomic) int health;
@property (nonatomic) NSMutableArray* invenotory;

+ (instancetype)playerWithHealth: (int) health andPosition: (Room*) position;
@end
