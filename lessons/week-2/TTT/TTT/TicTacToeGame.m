//
//  TicTacToeGame.m
//  TicTacToe
//
//  Created by Michael Kavouras on 7/19/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "TicTacToeGame.h"

@implementation TicTacToeGame

-(void) initializeArray: (int) dimension{
    //NSMutableArray *array = [[NSMutableArray alloc]init];
    _board = [[NSMutableArray alloc] init];
    
    for (int i = 0; i<dimension; i++) {
        NSMutableArray * row = [NSMutableArray arrayWithObjects:@" ", @" ", @" ", nil];
        [_board addObject:row];
    }
}

-(void)printBoard {
    
    NSArray *row1 = [_board objectAtIndex:0];
    NSArray *row2 = [_board objectAtIndex:1];
    NSArray *row3 = [_board objectAtIndex:2];
    
    NSLog(@"\n\t\t|%@|%@|%@| \n\t\t|%@|%@|%@| \n\t\t|%@|%@|%@|", [row1 objectAtIndex:0], [row1 objectAtIndex:1], [row1 objectAtIndex:2], [row2 objectAtIndex:0], [row2 objectAtIndex:1], [row2 objectAtIndex:2], [row3 objectAtIndex:0], [row3 objectAtIndex:1], [row3 objectAtIndex:2]);
}

-(BOOL) isPositionValid: (int) horizontal And: (int) vertical AndIs: (char) userPosition WithUserType: (BOOL) isComputer{

    horizontal = horizontal-1;    // this is the position on the row-array we want to check
    vertical = vertical-1;    // this is the position in our board array we want the row-array from
    
    if ([[[_board objectAtIndex:vertical] objectAtIndex: horizontal] isEqualToString:@" "]) { // get row-array from board, get element from row-array and then compare
        if (userPosition == 'X') {
            
            [[_board objectAtIndex:vertical] replaceObjectAtIndex:horizontal withObject:@"X"];
            
        }
        else{
            [[_board objectAtIndex:vertical] replaceObjectAtIndex:horizontal withObject:@"O"];
        }
        
        return YES;
    }
    else if(isComputer) {
        return NO;
    }
    else {
        NSLog(@"This is a not valid position");
        return NO;
    }
    
}

-(BOOL) isWinner {
    NSString *winner;
    
    //horizontal cases
    
    for (int i =0; i<3; i++) {
        if( [[[_board objectAtIndex:i] objectAtIndex:0] isEqualToString: [[_board objectAtIndex:i] objectAtIndex:1]] &&
           [[[_board objectAtIndex:i] objectAtIndex:1] isEqualToString: [[_board objectAtIndex:i] objectAtIndex:2]] &&
           ![[[_board objectAtIndex:i] objectAtIndex:0] isEqualToString: @" "]
           ){
            
            winner = [[_board objectAtIndex:i] objectAtIndex:0];
            NSLog(@"%@ won", winner);
            return YES;
            
        }
        
    }
    
    //vertical cases
    
    for ( int i = 0; i < 3; i++) {
        if( [[[_board objectAtIndex:0] objectAtIndex:i] isEqualToString: [[_board objectAtIndex:1] objectAtIndex:i]] &&
           [[[_board objectAtIndex:1] objectAtIndex:i] isEqualToString: [[_board objectAtIndex:2] objectAtIndex:i]] &&
           ![[[_board objectAtIndex:0] objectAtIndex:i] isEqualToString: @" "]
           ){
            winner = [[_board objectAtIndex:0] objectAtIndex:i];
            NSLog(@"%@ won", winner);
            return YES;
            
            
        }
    }
    
    //diagnol case
    if ([[[_board objectAtIndex:0] objectAtIndex:0] isEqualToString: [[_board objectAtIndex:1] objectAtIndex:1]] &&
        [[[_board objectAtIndex:1] objectAtIndex:1] isEqualToString: [[_board objectAtIndex:2] objectAtIndex:2]] &&
        ![[[_board objectAtIndex:0] objectAtIndex:0] isEqualToString: @" "]
        ){
        winner = [[_board objectAtIndex:0] objectAtIndex:0];
        NSLog(@"%@ won", winner);
        return YES;
        
    }
    //backwards diagnol case
    if ([[[_board objectAtIndex:0] objectAtIndex:2] isEqualToString: [[_board objectAtIndex:1] objectAtIndex:1]] &&
        [[[_board objectAtIndex:1] objectAtIndex:1] isEqualToString: [[_board objectAtIndex:2] objectAtIndex:0]] &&
        ![[[_board objectAtIndex:0] objectAtIndex:2] isEqualToString: @" "]
        ){
        winner = [[_board objectAtIndex:0] objectAtIndex:2];
        NSLog(@"%@ won", winner);
        return YES;
        
    }
    
    return NO;
}

-(BOOL) isFull {
    for (int i = 0; i < 3; i ++) {
        if ([ [ [_board objectAtIndex:i] objectAtIndex:0] isEqualToString: @" "] ||
            [ [ [_board objectAtIndex:i] objectAtIndex:1] isEqualToString: @" "] ||
            [ [ [_board objectAtIndex:i] objectAtIndex:2] isEqualToString: @" "]
            ){
            
            return NO;
        }
        
    }
    NSLog(@"No more plays, game over :(");
    return YES;
    
}

@end

@interface Person : NSObject

-(void)setName:(NSString *)name;

-(void)won;



@end


@implementation Person { // class
    
    // instance variable
    NSString *_name;
    int _pointsEarned;
}
    // methods

-(void)setName:(NSString *)name {
    
    _name = name;
    _pointsEarned = 0;
    
}

-(void)won{
    _pointsEarned = _pointsEarned + 1;
}


@end
