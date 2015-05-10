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

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        Dungeon* dungeon = [Dungeon dungeonWithSizeX:4 andY:4];
        Player* player = [Player playerWithHealth:100 andPosition:[dungeon randomRoom]];
        Cube* cube = [[Cube alloc] initWithPositionOf:[dungeon randomRoom]];
        Gem* gem = [[Gem alloc] initWithPositionOf:[dungeon randomRoom]];
        while([dungeon collisionOf:cube with:player] ||
              [dungeon collisionOf:gem with:player] ||
              [dungeon collisionOf:gem with:cube])
        {
            cube.position = [dungeon randomRoom];
            gem.position = [dungeon randomRoom];
        }
        
      
        
        
        
    }
    return 0;
}
