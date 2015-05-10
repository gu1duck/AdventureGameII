//
//  RoomBuilder.h
//  AdventureGameII
//
//  Created by Jeremy Petter on 2015-05-09.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Room.h"

@interface RoomBuilder : NSObject

- (Room*)buildDungeonWithDimensionsX: (int) xDimension andY: (int) yDimension;
+ (instancetype)roomBuilder;

@end
