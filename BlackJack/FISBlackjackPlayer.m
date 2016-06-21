//
//  FISBlackjackPlayer.m
//  BlackJack
//
//  Created by Bettina on 6/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackPlayer.h"

@implementation FISBlackjackPlayer


-(instancetype)init{

    return [self initWithName:@""];
}
-(instancetype)initWithName:(NSString *)name{
    
    self = [super init];
    if(self){
    
        _name = name;
        _cardsInHand =[[NSMutableArray alloc]init];
        _handscore = 0;
        _wins = 0;
        _losses = 0;
        _aceInHand = NO;
        _blackjack = NO;
        _busted = NO;
        _stayed = NO;
    
    }
    return self;
}

-(void)resetForNewGame {
    [self.cardsInHand removeAllObjects];
    self.handscore = 0;
    
    [self setAceInHand:NO];
    [self setBlackjack:NO];
    [self setBusted:NO];
    [self setStayed:NO];
}

-(void)acceptCard:(FISCard *)card{
   [self.cardsInHand addObject:card];
    self.handscore = self.handscore + card.cardValue;
    
    for(FISCard *card in self.cardsInHand){
        
        
        if ([card.rank isEqualToString:@"A"]){ //why didn't [self.cardsInHands containsObject:@"A"] work? because it contains FISCards not strings  so must access individual cards to get card value/rank and compare to Ace "A" string.  must be checked against same data type array contains.
            self.aceInHand = YES;
        }
    }
    
    if(self.aceInHand && self.handscore <= 11){
            self.handscore = self.handscore + 10;
    }
    
    if (self.handscore > 21){
        self.busted = YES;
    }
    
    if (self.cardsInHand.count == 2 && self.handscore == 21 ){
        self.blackjack = YES;
    }
    
}


-(BOOL)shouldHit{
    
    if (self.handscore >= 16 || self.handscore >= 17){
        _stayed = YES;
        return NO;
    }
        return YES;

}



-(NSString *)description{

    NSString *playerDescription = [NSString stringWithFormat:@"FISBlackjacPlayer: name: %@\n cards: %@\n handscore: %lu\n ace in hand : %d\n stayed: %d\n blackjack: %d\n busted: %d\n wins: %lu\n losses:%lu\n", self.name, self.cardsInHand, self.handscore, self.aceInHand, self.stayed, self.blackjack, self.busted, self.wins, self.losses];
    
    return playerDescription;
}
@end
