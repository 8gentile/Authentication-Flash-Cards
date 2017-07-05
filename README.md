# Authentication-Flash-Cards
## Motivation
This project took me about an hour. I wanted to build an app that would display snippets of code and provide the user with a multiple choice answer key to test their knowledge of OAuth and a custom controller implementation of BCrypt. Writing good model/controller methods is essential when using an MVC framework like Rails.

## Implementation
Some Ruby meta programming techniques were used in the making of this application. Code snippets were formatted to be `puts` in the console in blocks with the answer choices on the bottom. The question numbers are shuffled once, when the application is loaded and the index of each corresponding question number is called on the Propt class using Ruby string interpolation and the `send` method. The numbers iterate through twenty until there are no more questions left and the indices start over again. The score is kept as a streak with the game being won when the player's streak reaches the maximum number of questions: 20. 

## a/A Students
Run the game file in your terminal with `ruby game.rb`

Test a04 is about memorization more than anything else. If you can make it through this exercise, you should have a decent grasp of where the methods belong. You should still drill the practice assessment! This exercise is not a replacement for the actual practice test.

Cheers!
