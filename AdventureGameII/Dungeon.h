//
//  Dungeon.h
//  AdventureGameII
//
//  Created by Jeremy Petter on 2015-05-09.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Room.h"
#import "DungeonBuilderDelegate.h"
#import "DungeonInhabitant.h"
#import "Player.h"
#import "Cube.h"
#import "Gem.h"
#import "Treasure.h"

@interface Dungeon : NSObject
@property (nonatomic) int sizeX;
@property (nonatomic) int sizeY;
@property (nonatomic) int sizeZ;
@property (nonatomic) Room* origin;
@property (nonatomic) DungeonBuilderDelegate* builder;
@property (nonatomic) BOOL gameOver;

+ (instancetype) dungeonWithSizeX: (int) sizeX andY: (int) sizeY;
- (BOOL) collisionOf: (DungeonInhabitant*) object1 with: (DungeonInhabitant*) object2;
- (Room*) randomRoom;
- (void) ensureSeperateRoomsForPlayer: (Player*) player cube: (Cube*) cube gem: (Gem*) gem andTreasure: (Treasure*) treasure;
- (void) resolveCollisionsBetweenPlayer: (Player*) player cube: (Cube*) cube gem: (Gem*) gem andTreasure: (Treasure*) treasure;
- (Room*) roomUnoccupiedByPlayer: (Player*) player cube: (Cube*) cube gem:(Gem*) gem orTreasure:(Treasure*)treasure;

@end
