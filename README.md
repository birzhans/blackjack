# blackjack
Thinknetica Basic Ruby module's project

# Recommendations for project implementation:
Make the project in a separate repository
In the process, make a lot of small commits
First, carefully analyze the task and divide it into subtasks.
Start by thinking about the object model - what classes will be needed, what they will be responsible for, and how they will be related.
Start development with the simplest and most understandable section for you

# Mechanics and rules of the game:
There is a player (user) and a dealer (controlled by the program).
First, we ask the user for a name and then the game starts.
At the beginning of the game the user and the dealer have 100 dollars in the Bank
The user is given random 2 cards that he sees (cards are indicated by symbols, for example, "K+" - king of hearts, "K<3" - king of hearts, "K^" - king of spades, "K<>" - king of diamonds, etc. If desired, you can use Unicode characters for suits.)
Also, 2 random cards are issued to the "dealer" that the user is playing against. The user does not see the dealer's cards, instead they are shown asterisks.
The user sees the amount of their points. The amount is calculated as follows: from 2 to 10-at the face value of the card, all "pictures" - 10, ACE-1 or 11, depending on which value is closer to 21 and that does not lead to a loss (the amount is more than 21).
After the hand is dealt, a $ 10 bet is automatically placed in the game's pot from the player and dealer. (The player and dealer have 10 deducted from the pot)
After that, the move goes to the user. The user has 3 options to choose from:
- Skip it. In this case, the move goes to the dealer (see below)
- Add a map. (only if the user is holding 2 cards). In this case, another random card is added to the player, the amount of points is recalculated, and the move goes to the dealer. Only one map can be added.
- Open card. The dealer's and player's cards are opened, the player sees the amount of the dealer's points, and the game results are counted (see below).
Dealer's move (controlled by the program, the goal is to win, i.e. to get the amount of points as close as possible to 21). The dealer can:
- Skip a move (if the dealer has 17 points or more). The move goes to the player.
- Add a map (if the score is less than 17). The dealer gets a new card (closed for the user). After that, the move goes to the player. Only one map can be added.
Players reveal their cards either when they reach 3 cards each (automatically), or when the user selects the "Open cards"option. After that, the user sees the dealer's cards and the amount of his points, as well as the result of the game (who won and who lost).
Counting results:
- The player who has a score closer to 21 wins
- If a player has more than 21 points, they lose
- If the player and dealer have the same amount of points, then a draw is declared and the money from the Bank is returned to the players
- The amount from the game Bank goes to the winner
After the game ends, we ask the user if they want to play again. If Yes, then the game starts again with the distribution of cards, if not, then we finish the work.
