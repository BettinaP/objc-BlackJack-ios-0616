//
//  FISCardDeck.h
//  OOP-Cards-Model
//
//  Created by Bettina on 6/17/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISCard.h"

@interface FISCardDeck : NSObject

@property (strong, nonatomic) NSMutableArray *remainingCards;
@property (strong, nonatomic) NSMutableArray *dealtCards;


-(instancetype)init;

-(void)generateCardDeck;

-(FISCard *)drawNextCard;

-(void)resetDeck;

-(void)gatherDealtCards;

-(void)shuffleRemainingCards;




@end
