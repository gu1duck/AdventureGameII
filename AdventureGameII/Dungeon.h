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

@interface Dungeon : NSObject
@property (nonatomic) int sizeX;
@property (nonatomic) int sizeY;
@property (nonatomic) int sizeZ;
@property (nonatomic) Room* origin;
@property (nonatomic) DungeonBuilderDelegate* builder;

+ (instancetype) dungeonWithSizeX: (int) sizeX andY: (int) sizeY;
- (BOOL) collisionOf: (DungeonInhabitant*) object1 with: (DungeonInhabitant*) object2;
- (Room*) randomRoom;
//- (void) positionInSeperateRooms:(NSArray*) elementsToPosition;

@end
