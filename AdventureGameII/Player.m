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

- (BOOL) encounterCube: (Cube*) cube withOrWithoutGem: (Gem*) gem
{
    NSLog(@"******* YOU ENCOUNTER A FEARSOME GELATINOUS CUBE! *******");
    if ([self searchInventoryFor:gem]){
        [self killCube: cube];
        return NO;
    }
    else
    {
        NSLog(@"******* THE CUBE SPITS ACID ON YOU, DISSOLVING YOUR FLESH *******.");
        return [self takeDamage:50];
    }
}

- (void) killCube: (Cube*) cube{
    NSLog(@"******* THE GEM YOU FOUND FLASHES WITH LIGHT, DESTROYING THE CUBE *******");
    cube.position = nil;
}

- (BOOL) takeDamage: (int)amount
{
    NSLog(@"******* HEALTH -50 *******");
    self.health -= 50;
    if (self.health > 0)
    {
        return NO;
    }
    else
    {
        NSLog(@"******* THE CUBE HAS DISSOLVED YOU, ENTIRELY. GAME OVER. ******");
        return YES;
    }
}

- (void) acquireGem: (Gem*) gem
{
    NSLog(@"******* YOU'VE FOUND A MYSTERIOUS GEM. YOU STICK IT IN YOUR BACKPACK *******");
    [self.invenotory addObject:gem];
    gem.position = nil;
}

- (void) acquireTreasure: (Treasure*) treasure
{
    NSLog(@"******* YOU'VE FOUND THE TREASURE!! YOU WIN!!*******");
}

- (BOOL)searchInventoryFor:(DungeonInhabitant*) objective
{
    for (id object in self.invenotory)
    {
        if (object == objective){
            return true;
        }
    }
    return false;
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
