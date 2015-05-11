//
//  Player.m
//  AdventureGameII
//
//  Created by Jeremy Petter on 2015-05-10.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "Player.h"

@implementation Player

+ (instancetype)playerWithHealth: (int) health andPosition: (Room*) position
{
    Player* player = [[Player alloc]init];
    player.health = 100;
    player.position = position;
    player.invenotory = [NSMutableArray array];
    return player;
}

- (Room*)reportPosition
{
    return self.position;
}

- (BOOL) moveInto: (Room*) room
{
    if (room)
    {
        self.position = room;
        return YES;
    }
    else
    {
        return NO;
    }
    
}


@end
