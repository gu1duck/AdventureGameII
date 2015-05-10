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
    room = [self navigateWest:randX startingFrom:room];
    room = [self navigateSouth:randY startingFrom:room];
    room = [self navigateUp:randZ startingFrom:room];
    
    return room;
}

- (Room*) navigateWest: (int) number startingFrom: (Room*) origin
{
    if (number > 0 && origin.west)
    {
        return [self navigateWest:number-1 startingFrom:origin.west];
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

//- (void) positionInSeperateRooms:(NSArray*) elementsToPosition{
//    NSMutableArray* itemsPlaced = [NSMutableArray array];
//    elementsToPosition[1]
//}


@end
