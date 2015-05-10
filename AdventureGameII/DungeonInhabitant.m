//
//  DungeonInhabitant.m
//  AdventureGameII
//
//  Created by Jeremy Petter on 2015-05-10.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "DungeonInhabitant.h"

@implementation DungeonInhabitant

- (Room*)reportPosition
{
    return self.position;
}

-(instancetype)initWithPositionOf:(Room*) position
{
    self = [super init];
    if (self)
    {
        self.position = position;
    }
    return self;
}

@end
