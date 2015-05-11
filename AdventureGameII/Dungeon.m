//
//  Dungeon.m
//  AdventureGameII
//
//  Created by Jeremy Petter on 2015-05-10.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "Dungeon.h"

@implementation Dungeon : NSObject


+ (instancetype) dungeonWithSizeX: (int) sizeX andY: (int) sizeY
{
    Dungeon* dungeon = [[Dungeon alloc] init];
    dungeon.sizeX = sizeX;
    dungeon.sizeY = sizeY;
    dungeon.sizeZ = 1;
    dungeon.builder = [DungeonBuilderDelegate dungeonBuilder];
    dungeon.origin = [dungeon.builder buildDungeonWithDimensionsX:sizeX andY:sizeY];
    return dungeon;
}

- (Room*) randomRoom
{
    int randX = arc4random_uniform(self.sizeX);
    int randY = arc4random_uniform(self.sizeY);
    int randZ = arc4random_uniform(self.sizeZ);
    
    Room* room = self.origin;
    room = [self navigateEast:randX startingFrom:room];
    room = [self navigateSouth:randY startingFrom:room];
    room = [self navigateUp:randZ startingFrom:room];
    
    return room;
}

- (Room*) navigateEast: (int) number startingFrom: (Room*) origin
{
    if (number > 0 && origin.east)
    {
        return [self navigateEast:number-1 startingFrom:origin.east];
    }
    return origin;
}

- (Room*) navigateSouth: (int) number startingFrom: (Room*) origin
{
    if (number > 0 && origin.south)
    {
        return [self navigateSouth:number-1 startingFrom:origin.south];
    }
    return origin;
}

- (Room*) navigateUp: (int) number startingFrom: (Room*) origin{
    if (number > 0 &&origin.up)
    {
        return [self navigateUp:number-1 startingFrom:origin.up];
    }
    return origin;
}

- (BOOL) collisionOf: (DungeonInhabitant*) object1 with: (DungeonInhabitant*) object2{
    if ([object1 reportPosition] == [object2 reportPosition]){
        return YES;
    }
    return NO;
}

- (void) ensureSeperateRoomsForPlayer: (Player*) player cube: (Cube*) cube gem: (Gem*) gem andTreasure: (Treasure*) treasure{
    while([self collisionOf:cube with:player])
    {
        cube.position = [self randomRoom];
    }
    while([self collisionOf:gem with:player] ||
          [self collisionOf:gem with:cube])
    {
        gem.position = [self randomRoom];
    }
    while ([self collisionOf:treasure with:player] ||
           [self collisionOf:treasure with:cube] ||
           [self collisionOf:treasure with:gem])
    {
        treasure.position = [self randomRoom];
    }
}

//- (void) positionInSeperateRooms:(NSArray*) elementsToPosition{
//    NSMutableArray* itemsPlaced = [NSMutableArray array];
//    elementsToPosition[1]
//}


@end
