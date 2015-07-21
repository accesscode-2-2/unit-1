//
//  ViewController.m
//  TTT
//
//  Created by Michael Kavouras on 7/21/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "ViewController.h"
#import "TicTacToeGame.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;

@property (nonatomic) TicTacToeGame *game;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self newGame];
}

- (void)newGame {
    self.game = [[TicTacToeGame alloc] init];
    [self.game initializeArray:3];
}

- (IBAction)buttonTapped:(UIButton *)sender {
    NSUInteger idx = [self.buttons indexOfObject:sender];
    NSInteger row = idx / 3;
    NSInteger col = idx % 3;
    
    [self makeMoveAtColumn:(int)col + 1 row:(int)row + 1 forComputer:NO];
    
    if (![self checkGameOver]) {
        [self makeComputerMove];
    }
    
    [self printBoard];
}

- (void)makeComputerMove {
    int hPosition = 1 + arc4random_uniform(3);
    int vPosition = 1 + arc4random_uniform(3);
    
    if (![self makeMoveAtColumn:hPosition row:vPosition forComputer:YES]) {
        [self makeComputerMove];
    }
    
    [self checkGameOver];
    
    [self printBoard];
}

- (BOOL)makeMoveAtColumn:(int)col row:(int)row forComputer:(BOOL)computer {
    char xOrO = computer ? 'O' : 'X';
    return [self.game isPositionValid:col And:row AndIs:xOrO WithUserType:!computer];
}

- (void)printBoard {
    NSMutableArray *mainArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < self.game.board.count ; i++) {
        [mainArray addObjectsFromArray:[self.game.board objectAtIndex:i]];
    }
    for (int i = 0; i < mainArray.count; i++) {
        UIButton *button = [self.buttons objectAtIndex:i];
        NSString *value = mainArray[i];
        [button setTitle:value forState:UIControlStateNormal];
    }
}

- (BOOL)checkGameOver {
    BOOL won = [self.game isWinner];
    BOOL draw = [self.game isFull];

    if (won) {
        [self newGame];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"WINNER!" message:@"someone won" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"again", nil];
        [alert show];
        NSLog(@"winner");
    } else if (draw) {
        [self newGame];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"TIE!" message:@"this game has no winner" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"again", nil];
        [alert show];
        NSLog(@"full");
    }
    
    return won || draw;
}

@end
