//
//  IOController.m
//  AdventureGameII
//
//  Created by Jeremy Petter on 2015-05-10.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "IOController.h"

@implementation IOController

+ (NSString*) getInput
{
    char str [100];
    scanf("%100s", str);
    NSString *nsInput = [[NSString alloc] initWithUTF8String: str];
    
    return nsInput;
}

- (void)parseInput: (NSString*) input forPlayer:(Player*)player
{
    char controlChar = [input characterAtIndex:0];
    
    switch (controlChar) {
        case 'n':
        case 'N':
            [self movePlayer:player toRoom:player.position.north withOutput:@"NORTH"];
            break;
        case 's':
        case 'S':
            [self movePlayer:player toRoom:player.position.south withOutput:@"SUOTH"];
            break;
        case 'e':
        case 'E':
            [self movePlayer:player toRoom:player.position.east withOutput:@"EAST"];
            break;
        case 'w':
        case 'W':
            [self movePlayer:player toRoom:player.position.west withOutput:@"WEST"];
            break;
        case 'u':
        case 'U':
            [self movePlayer:player toRoom:player.position.up withOutput:@"UP"];
            break;
        case 'd':
        case 'D':
            [self movePlayer:player toRoom:player.position.down withOutput:@"DOWN"];
            break;
            
        default:
            NSLog(@"Sorry, what?\n>");
            NSString* input = [IOController getInput];
            [self parseInput:input forPlayer:player];
            break;
    }
}

- (void) promptPlayer:(Player*) player
{
    NSString* output = @"You are in a dark room. You see exits in the following directions:\n";
    output = [self appendExitIfOpenTo:output forDirection:player.position.north withString: @"NORTH "];
    output = [self appendExitIfOpenTo:output forDirection:player.position.south withString: @"SOUTH "];
    output = [self appendExitIfOpenTo:output forDirection:player.position.east withString: @"EAST "];
    output = [self appendExitIfOpenTo:output forDirection:player.position.west withString: @"WEST "];
    output = [self appendExitIfOpenTo:output forDirection:player.position.up withString: @"UP "];
    output = [self appendExitIfOpenTo:output forDirection:player.position.down withString: @"DOWN "];
    
    output = [output stringByAppendingString:@"\n"];
    
    output = [self appendChalkIn:@"north" inRoom:player.position ifPresentTo:output];
    output = [self appendChalkIn:@"south" inRoom:player.position ifPresentTo:output];
    output = [self appendChalkIn:@"east" inRoom:player.position ifPresentTo:output];
    output = [self appendChalkIn:@"west" inRoom:player.position ifPresentTo:output];
    output = [self appendChalkIn:@"ceiling" inRoom:player.position ifPresentTo:output];
    output = [self appendChalkIn:@"floor" inRoom:player.position ifPresentTo:output];
    
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
    if (room.chalk[chalkPosition] != [NSNull null])
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

-(void)movePlayer: (Player*) player toRoom: (Room*) room withOutput: (NSString*) output {
    if ([player moveInto: room]){
        NSLog(@"Moved %@", output);
    } else {
        NSLog(@"You can't move there. What do you want to do?\n>");
        NSString* input = [IOController getInput];
        [self parseInput:input forPlayer:player];
    }
}




@end
