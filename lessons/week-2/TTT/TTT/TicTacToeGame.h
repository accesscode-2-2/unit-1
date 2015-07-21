//
//  TicTacToeGame.h
//  TicTacToe
//
//  Created by Michael Kavouras on 7/19/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TicTacToeGame : NSObject

@property (nonatomic) NSMutableArray *board;

-(void) initializeArray: (int) dimension;
-(void) printBoard;
-(BOOL) isPositionValid: (int) horizontal And: (int) vertical AndIs: (char) userPosition WithUserType: (BOOL) isComputer;
-(BOOL) isWinner;
-(BOOL) isFull;

@end
