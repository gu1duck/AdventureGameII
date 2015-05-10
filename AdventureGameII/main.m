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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Dungeon* dungeon = [Dungeon dungeonWithSizeX:4 andY:4];
        Player* player = [[Player alloc] initWithHealth:100 andLocation:[dungeon randomRoom]];
    }
    return 0;
}
