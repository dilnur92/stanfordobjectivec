//
//  PlayingCard.m
//  Card
//
//  Created by Dilnur Yuldashev on 4/18/16.
//  Copyright © 2016 Dilnur Yuldashev. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
-(NSString *) contents{
    NSArray * rankStrings = @[@"?", @"A", @"?", @"A", @"2", @"3",@"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}
@synthesize suit = _suit;

-(void)setSuit:(NSString *)suit{
    if([PlayingCard.validSuits containsObject: suit]){
        _suit = suit;
    }
}

-(NSString *) suit{
    return _suit ? _suit : @"?";
}

+(NSArray *) validSuits{
    return @[@"♣︎", @"♦︎", @"♠︎", @"♥︎"];
}

+(NSArray *) rankStrings{
    return @[@"?", @"A", @"?", @"A", @"2", @"3",@"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}
+(NSUInteger) maxRank{
    return [[self rankStrings] count]-1;
}

@end

