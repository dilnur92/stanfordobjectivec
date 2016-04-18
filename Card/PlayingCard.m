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
    NSArray * rankStrings = @[@"?", @"A", @"2", @"3",@"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}
@synthesize suit = _suit;

-(void)setSuit:(NSString *)suit{
    if([PlayingCard.validSuits containsObject: suit]){
        _suit = suit;
    }
}
-(int) match:(NSArray *) otherCards{
    int score = 0;
    NSLog(@"Playing Card Match!!!!");
    PlayingCard *otherCard = [otherCards lastObject];
    if([otherCards count]==1){
        if([self.suit isEqualToString:otherCard.suit]){
            score = 1;
        }else if(self.rank==otherCard.rank){
            score = 4;
        }
    }
    return score;
}
-(NSString *) suit{
    return _suit ? _suit : @"?";
}

+(NSArray *) validSuits{
    return @[@"♣︎", @"♦︎", @"♠︎", @"♥︎"];
}

+(NSArray *) rankStrings{
    return @[@"?", @"A", @"2", @"3",@"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}
+(NSUInteger) maxRank{
    return [[self rankStrings] count]-1;
}

@end

