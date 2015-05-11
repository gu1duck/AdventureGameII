//
//  main.m
//  AdventureGameII
//
//  Created by Jeremy Petter on 2015-05-09.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dungeon.h"
#import "player.h"
#import "cube.h"
#import "gem.h"
#import "Treasure.h"
#import "IOController.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        Dungeon* dungeon = [Dungeon dungeonWithSizeX:4 andY:4];
        IOController* io = [IOController new];
        
        Player* player = [Player playerWithHealth:100 andPosition:[dungeon randomRoom]];
        Cube* cube = [[Cube alloc] init];
        Gem* gem = [[Gem alloc] init];
        Treasure* treasure = [[Treasure alloc] init];
        [dungeon ensureSeperateRoomsForPlayer:player cube:cube gem:gem andTreasure:treasure];
        
        while (dungeon.gameOver == NO) {
            [io promptPlayer:player];
            NSString* input = [IOController getInput];
            [io parseInput:input forPlayer:player];
            [dungeon resolveCollisionsBetweenPlayer:player cube:cube gem:gem andTreasure:treasure];
        }
        
        
    }
    return 0;
}
