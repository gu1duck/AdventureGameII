//
//  Dungeon.m
//  AdventureGameII
//
//  Created by Jeremy Petter on 2015-05-10.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "Dungeon.h"

@implementation Dungeon : NSObject


+ (instancetype) dungeonWithSizeX: (int) sizeX andY: (int) sizeY{
    Dungeon* dungeon = [[Dungeon alloc] init];
    dungeon.sizeX = sizeX;
    dungeon.sizeY = sizeY;
    dungeon.builder = [RoomBuilder roomBuilder];
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

- (Room*) navigateWest: (int) number startingFrom: (Room*) origin{
    if (number > 0 && origin.west){
        return [self navigateWest:number-1 startingFrom:origin.west];
    }
    return origin;
}

- (Room*) navigateSouth: (int) number startingFrom: (Room*) origin{
    if (number > 0 && origin.west){
        return [self navigateSouth:number-1 startingFrom:origin.west];
    }
    return origin;
}

- (Room*) navigateUp: (int) number startingFrom: (Room*) origin{
    if (number > 0 &&origin.west){
        return [self navigateUp:number-1 startingFrom:origin.west];
    }
    return origin;
}

@end