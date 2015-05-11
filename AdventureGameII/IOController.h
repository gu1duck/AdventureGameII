//
//  IOController.h
//  AdventureGameII
//
//  Created by Jeremy Petter on 2015-05-10.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "Room.h"

@interface IOController : NSObject

- (void) promptPlayer:(Player*) player;
+ (NSString*) getInput;
- (void)parseInput: (NSString*) input forPlayer:(Player*)player;

@end
