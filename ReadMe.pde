/*
Readme file, detailing 
 Developer details
 Program description
 User instructions
 Known issues
 Any References
 ----------------------------------------------------
 Developer details
 Name : Ian Mullins

 
 Program description
 Brief description of the game developed:
 Inspiration taken from Super Mario, Megaman and similar side scroller games.
 SpaceMan character stays stationary while the 'world' moves around him. Objects (coins, meteors and spaceships) enter the screen,
 and move towards '0' on the x-axis. This gives the illusion that the main character is moving.
 
 Objective of the game is to shoot at oncoming enemies, killing (reseting) them while also collecting the Space Dollars and adding to the player score
 -If the SpaceMan collides with the coins, coin is collected, tallied to score and coin is reset
 -If the SpaceMan weapon is fired
 -If the weapon hits a spaceship, kills counter is increased, spaceship is reset 
 -If the SpaceMan collides with spaceship, hitPointLoss is is added, spaceship is reset.
 -If spaceship reaches far left of display, hitPointLoss is is added, spaceship is reset.
 -Once hitPointLoss exceeds maximum maxHitPoints, round is over.
 -Once number of rounds exceeds maximum number of rounds, game is over. Player round statistics are output
 
 *****************
 Controls
 Up arrow(recommended)/W key/ w key - Character up
 Up arrow release - Character Down
 Left mouse button(recommended)/D key/d key/ TAB - Shoot Laser
 
 Begin Game 
 -Select Number of Rounds you wish to play
 --Enter Player name
 ---Enter Player catch phrase1
 ----Enter Player catch phrase2
 -----Enter Player catch phrase3
 ------Enjoy
 *****************
 
 Known bugs/problems:
 -Keyboard Key controls, W/w/D/d/TAB are not as reliable as mouse button + arrow keys
 -Spaceman floats while 'D'/'d' or 'TAB' are held (shoot/fire keys)
 -SpaceMan continuously shoots if target is hit using W/w/D/d/TAB
 -SpaceMan occasionally gets stuck in Flight mode(does not return to ground once key released) possibly processing bug
 
 Any sources referred to during the development of the assignment (be precise and specific with references) {there no need to reference lecture/lab materials}:
 --Background image added using the reference below for guidance
 https://processing.org/examples/backgroundimage.html
 --Image added using the reference below for guidance
 https://processing.org/reference/image_.html
 --Coin symbol, American dollar Symbol char variable added using ASCII code char(36). 
 Character code found using script in link below
 https://www.programiz.com/java-programming/examples/ascii-value-character
 --Font type for program
 https://processing.org/reference/textFont_.html
 --Laser sound sourced
 https://freesound.org/people/SeanSecret/sounds/440661/
 --Backing track sourced
 http://dig.ccmixter.org/files/Karstenholymoly/61117
 --Minim Sound Tutorial  
 https://www.youtube.com/watch?v=LcX36OxgZgg
 --Do while loop using below link for reference, draws gradient on ground in program
 https://processing.org/discourse/beta/num_1221003245.html
 
 ----------------------------------------------------
 */
