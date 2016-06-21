//
//  FISBlackjackGame.m
//  BlackJack
//
//  Created by Bettina on 6/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackGame.h"

@implementation FISBlackjackGame


-(instancetype)init{
    
    return [self initWithDeck:[[FISCardDeck alloc]init] house:[[FISBlackjackPlayer alloc]initWithName:@"House"] player:[[FISBlackjackPlayer alloc] initWithName:@"Player" ]];
    }

//the only way you can create an empty instance of a custom class is by {[customClass alloc]init]...if a name is given or it's telling you to set it to something then [[custom class alloc]initWith____: ] whatever data type/default variable it's telling you to set it equal to.

-(instancetype)initWithDeck:(FISCardDeck *)deck house:(FISBlackjackPlayer *)house player:(FISBlackjackPlayer *)player{
    
    self =[super init];
    
    if(self) {
        _deck = deck;
        _house = house;
        _player = player;
    }
    
    return self;
}

-(void)playBlackjack{
    [self.deck resetDeck];
    [self.player resetForNewGame];
    [self.house resetForNewGame];
    [self dealNewRound];
    
    for (NSUInteger i = 0; i <3; i++){
        [self dealCardToPlayer];
        [self dealCardToHouse];
        if (self.player.busted == YES || self.house.busted ==YES){
            break;
        }
    }
    [self incrementWinsAndLossesForHouseWins:[self houseWins]];//use the return  of houseWins method (which is a BOOL) as argument that will be assesed by incrementWinsAndLosses method (which takes a BOOL) which will then determine whether house or player gets to increment its wins or losses.
    
    NSLog(@"%@", self.player.description);
    NSLog(@"%@",self.house.description);
    
    
}

-(void)dealNewRound{
    
    [self dealCardToPlayer];
    [self dealCardToHouse];
    [self dealCardToPlayer];
    [self dealCardToHouse];
    
}

//how do i know when i can .count versus [count]?

-(void)dealCardToPlayer{
    FISCard *nextCard = [self.deck drawNextCard];
    [self.player acceptCard:nextCard];
}


-(void)dealCardToHouse{
    FISCard *nextCard =[self.deck drawNextCard];
    [self.house acceptCard:nextCard];
}


-(void)processPlayerTurn{
    if (!self.player.busted && !self.player.stayed){
        if(self.player.shouldHit == YES){
            [self dealCardToPlayer];
        }
    }
}


-(void)processHouseTurn{
    if (!self.house.busted && !self.house.stayed){
        if(self.house.shouldHit == YES){
            [self dealCardToHouse];
        }
    }
}


-(BOOL)houseWins{
    
    if( self.house.busted == YES ||self.player.handscore > self.house.handscore){
        return NO;
    }else if (self.house.blackjack == YES && self.player.blackjack == YES){
        return NO;
    }else {
        return YES;
    }
}


-(void)incrementWinsAndLossesForHouseWins:(BOOL)houseWins{
    
    if (houseWins == YES){
        
        self.house.wins++;
        self.player.losses++;
        
    } else if(houseWins == NO){
        self.house.losses++;
        self.player.wins++;
    }
}




@end
