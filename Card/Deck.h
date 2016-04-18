//
//  Deck.h
//  Card
//
//  Created by Dilnur Yuldashev on 4/18/16.
//  Copyright © 2016 Dilnur Yuldashev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
-(void) addCard: (Card *)card atTop: (BOOL) atTop;
-(Card *) drawRandomCard;
@end
