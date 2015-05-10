//
//  IOController.m
//  AdventureGameII
//
//  Created by Jeremy Petter on 2015-05-10.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "IOController.h"

@implementation IOController

- (void) promptPlayer:(Player*) player
{
    NSString* output = @"You are in a dark room. You see exits in the following Directions:\n";
    output = [self appendExitIfOpenTo:output forDirection:player.position.north withString: @"NORTH "];
    output = [self appendExitIfOpenTo:output forDirection:player.position.south withString: @"SOUTH "];
    output = [self appendExitIfOpenTo:output forDirection:player.position.east withString: @"EAST "];
    output = [self appendExitIfOpenTo:output forDirection:player.position.west withString: @"WEST "];
    output = [self appendExitIfOpenTo:output forDirection:player.position.up withString: @"UP "];
    output = [self appendExitIfOpenTo:output forDirection:player.position.down withString: @"DOWN "];
    
    output = [output stringByAppendingString:@"\n"];
    
//    output = [self appendChalkIn:@"north" inRoom:player.position ifPresentTo:output];
//    output = [self appendChalkIn:@"south" inRoom:player.position ifPresentTo:output];
//    output = [self appendChalkIn:@"east" inRoom:player.position ifPresentTo:output];
//    output = [self appendChalkIn:@"west" inRoom:player.position ifPresentTo:output];
//    output = [self appendChalkIn:@"ceiling" inRoom:player.position ifPresentTo:output];
//    output = [self appendChalkIn:@"floor" inRoom:player.position ifPresentTo:output];
    
    output = [output stringByAppendingString:@"What will you do?\n>"];
    NSLog(@"%@",output);
    
}

- (NSString*) appendExitIfOpenTo:(NSString*)output forDirection:(Room*)exitDirection withString:(NSString*) exitDescription{
    if (exitDirection)
    {
        output = [output stringByAppendingString: exitDescription];
    }
    return output;
}

- (NSString*) appendChalkIn:(NSString*) chalkPosition inRoom: (Room*) room ifPresentTo:(NSString*)output{
    if (room.chalk[chalkPosition])
    {
        output = [output stringByAppendingString:@"Somebody has written \""];
        output = [output stringByAppendingString:room.chalk[chalkPosition]];
        output = [output stringByAppendingString:@"\" on the "];
        output = [output stringByAppendingString:chalkPosition];
        if (![chalkPosition isEqualToString:@"ceiling"] ||
            ![chalkPosition isEqualToString:@"floor"])
        {
            output = [output stringByAppendingString:@" wall"];
        }
        output = [output stringByAppendingString:@".\n"];
    }
    return output;
}

@end
