//
//  DungeonInhabitant.h
//  AdventureGameII
//
//  Created by Jeremy Petter on 2015-05-10.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Room.h"

@interface DungeonInhabitant : NSObject

@property (nonatomic) Room* position;

- (Room*)reportPosition;
-(instancetype)initWithPositionOf:(Room*) position;

@end
