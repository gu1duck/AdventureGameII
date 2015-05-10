//
//  Dungeon.h
//  AdventureGameII
//
//  Created by Jeremy Petter on 2015-05-09.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Room.h"
#import "RoomBuilder.h"

@interface Dungeon : NSObject
@property (nonatomic) int sizeX;
@property (nonatomic) int sizeY;
@property (nonatomic) int sizeZ;
@property (nonatomic) Room* origin;
@property (nonatomic) RoomBuilder* builder;

+ (instancetype) dungeonWithSizeX: (int) sizeX andY: (int) sizeY;
- (Room*) randomRoom;

@end
