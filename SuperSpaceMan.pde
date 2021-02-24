import ddf.minim.*; //Sound library
import javax.swing.JOptionPane; 

//Objects required to run program
Coin coin;
Player player;
Ship ship;
SpaceMan spaceMan;
Meteor[] meteor= new Meteor[2], meteorBG= new Meteor[2]; //Object Array- meteors array for default constructor + Overloaded constructor
String catchPhrase[]=new String[3]; //String array of user defined words which will be output as text on screen

//Audio variables
Minim minim;
AudioPlayer pewSound, backTrack; 

/*Current Round Data*/
/*collission detection tracking
**Score variables for score text on screen
**Represents the amount of coins collected in a round - NOT ON SCREEN
**ScoreSingles represents the right most Score digit in the score display
**score & scoreSingles increased by 1 each time a coin is collected
**scoreSingles and scoreTen used to ensure two digits always on screen eg. 1-9
**When score%10=0....scoreTen is increased by one, ScoreSingles is reset. Players lives lost are reset*/
int score=0, scoreSingles = 0, scoreTen=0;

/*Kills epresents the number of ships killed in a round--is reset when hitPointLoss>maxHitPoints
 **hitPointLoss - represents the number of times a player has been hit in the current round
 **maxHitPoints - represents the maximum amount of lives a player has in the current round, visible top left of screen*/
int kills=0, hitPointLoss=0, maxHitPoints=3;

//Total Game Data
PImage backDrop; //Background image
PFont myFont;  //Custom font

/*maxNumberOfRounds = Max number of rounds playable--User Defined at beginning of game
**roundsPlayed = The current round counter,will be increased while this is less than the maximum amount of rounds allowed
**sec = Timer on screen-begins counting at start of game, stops counting when game is over*/
int maxNumberOfRounds, roundsPlayed= 0, sec;

//Setup method
void setup() {
  size(800, 500);
  cursor(HAND);
  surface.setLocation((displayWidth/2)-width/2, (displayHeight/2)-height/2);

  //objects declaration/Instantiation
  for (int i=0; i<meteor.length; i++) {
    meteor[i] = new Meteor();
    meteorBG[i] = new Meteor(25, 3);
  }
  ship = new Ship(7);
  //validation in ship class. Parameter passed to set ship speedX
  //if Ship constructor parameter not >=2&&<10. speedX set to 7
  spaceMan = new SpaceMan(400);
  coin = new Coin();

  //files for font,background and sound
  myFont = loadFont("BritannicBold-25.vlw");
  textFont(myFont); 
  backDrop = loadImage("mars.jpg");
  minim = new Minim(this);
  pewSound = minim.loadFile("pew.wav");
  backTrack = minim.loadFile("backTrack.mp3");

  /*integer.parseInt method used to convert string input from user to an integer
   **Input can then be used as part of in-game data, name and number or rounds to be played*/
  maxNumberOfRounds = Integer.parseInt (JOptionPane.showInputDialog("Welcome, you're playing Super SpaceMan"+
  "\n\nplease enter the number of rounds you would \n\nlike to play:", "3"));
  //Instantiate new player
  player = new Player(JOptionPane.showInputDialog("Enter your name (max 6 characters: "), maxNumberOfRounds);

  /*for loop used to read in array of String objects using JoptionPane input
   **String objects displayed on screen using text method*/
  for (int i=0; i<catchPhrase.length; i++) {
    catchPhrase[i] = (JOptionPane.showInputDialog("Enter Catchphrases"+(i+1)+ " eg; 'Yippee-Ki-Yay': "+"\n(Max 20 characters)"));
    if (catchPhrase[i].length()==0) {
      catchPhrase[i] = "Yipee Ki Yay";
    } else if (catchPhrase[i].length()>=20) {
      catchPhrase[i] = catchPhrase[i].trim().substring(0, 19);
    }
  }
}

void draw() {
  // If the player has hit points remaining call game on method
  if (hitPointLoss<maxHitPoints) {
    gameOn();
  }
  /*else spaceMan has no hit points remaining
   **add 1 to rounds played
   **add scores to addScore method*/
  else {
    roundsPlayed++;
    player.addScore(score, kills);
    //if the spaceMan has rounds remaining in this game
    //ask user if they would like to continue
    //if option yes selected, continue to next round
    if (roundsPlayed<maxNumberOfRounds) {
      int reply = JOptionPane.showConfirmDialog(null, "Round over! You collected " + score + " coins"+
        "\nand killed " + kills + " ships! " + catchPhrase[kills%3].toUpperCase()+"!" +
        "\n"+"Would you like to play the next round?", 
        "Play next round?", JOptionPane.YES_NO_OPTION);
      if (reply==JOptionPane.YES_OPTION) {
        resetGame();
        gameOn();
      }
    } else {
      gameOver();
    }
  }
}

//Game display information relayed to the user life, timer, player name , catch phrases
void gameHud() {
  fill(255, 0, 0);
  textSize(50);
  textAlign(CENTER);
  text(sec, width/2, 50);
  text("Coins: "+scoreTen+scoreSingles, 150, 50);    
  //for loop to draw hit points counter visible on top right of screen
  for (int i=0; i<maxHitPoints-hitPointLoss; i++) {
    strokeWeight(5);
    stroke(0);
    fill(255, 0, 0);
    ellipse(width-200+(50*i), 35, 40, 40);
  } 
  //Speech text box
  //text outputs player name and user defined catch phrases to program screen
  fill(0);
  stroke(255);
  strokeWeight(3);
  rect(100, height-45, width/2, 40);
  triangle(150, height-45, 160, height-45, 150, height-55);
  fill(255);
  textSize(25);
  textAlign(LEFT);
  text(player.getPlayerName()+": \""+catchPhrase[kills%3].toUpperCase()+"\"", 125, height-15);

  /*If statement Controls visible score counter on screen
   **when score%10=0, scoreSingles is reset
   **ScoreTen is incremented by one
   **Player regains maximum hit points*/
  if ((score%10==0)&&(scoreSingles!=0)) {
    scoreSingles=0;
    scoreTen+=1;
    hitPointLoss=0;
  }
}

/*is called when the player has round rounds and hit points remaining remaining
 **calls all onscreen objects*/
void gameOn() { 
  backTrack.play();
  sec=millis()/1000;
  background(backDrop);
  for (int i=0; i<2; i++) {
    meteor[i].update();
    meteor[i].display();
    meteorBG[i].update();
    meteorBG[i].display();
  }
  /*When score displays 9,19,29,39 etc
   **the 10th coin increases in size and flashed various colours*/
  coin.update();
  if (((score+1)%10==0)) {
    coin.display(random(0, 200), 75);
  } else {
    coin.display(0, 50);
  }
  ship.update();
  ship.display();
  spaceMan.display();
  spaceMan.update();
  spaceMan.updateWeapon();
  collissions();
  fill(139, 69, 19);  //Ground 
  rect(0, height-50, width, height);
  /*Do while loop to draw ellips in ground contunuously during program
   **while random <0.5, draw ellipse, if random >0.5 no ellipse drawn*/
  do {
    fill(0);
    ellipse(random(0, width), random(height-40, height), random(3, 10), random(3, 10));
  } while (random(0, 1)<(0.5));
  gameHud();
} 

//is called when the player has no remaining lives in the current round
//resets player death/lives lost counter/scores/kills
void resetGame() {
  hitPointLoss=0;
  scoreSingles=0;
  score=0;
  scoreTen=0;
  kills=0;
}

//is called when the player has no remaining lives and has exceeded the maximum amount of rounds
//calls message dialog with game statistics and toString outlining scores for each round
void gameOver() {
  JOptionPane.showMessageDialog(null, player.getPlayerName()+
    ", your game is over!"  
    +"\nNumber of rounds played: " + roundsPlayed
    + "\n\n" + player.toString() 
    +"\nYour lowest Score was: "+player.lowestScore()
    +"\nYour highest Score was: "+player.highestScore()
    +"\nYour average Score was: "+player.averageScore()
    +"\nTotal number ships killed: " + player.totalKills()
    ); 
  exit();
}

//--------Collission detection logic---------//

//Calculates coin and spaceMan distance on the x and y axis
//if coin/spaceMan x/y distance is within defined distance; return true-collission detected
boolean collectCoin(SpaceMan spaceMan, Coin coin)
{
  float coinDistanceX = abs(coin.getXCoord() - spaceMan.getXCoord());
  float coinDistanceY = abs(coin.getYCoord() - spaceMan.getYCoord());
  if ((coinDistanceX <=25)&&(coinDistanceY <=25)) {
    return true;
  }
  return false;
}

//Calculates ship and spaceMan distance on the x and y axis
//if ship/spaceMan x/y distance is within defined distance; return true-collission detected
boolean spaceManCollission(SpaceMan spaceMan, Ship ship)
{
  float shipDistanceX = abs(spaceMan.getXCoord()-ship.getTargetX());
  float shipDistanceY = abs(spaceMan.getYCoord()-ship.getTargetY());
  if ((shipDistanceX <=60)&&(shipDistanceY <=60)) {
    return true;
  }
  return false;
}

//Calculates ship and spaceMan weapon distance on the x and y axis
//if ship/spaceMan weapon x/y distance is within defined distance; return true-collission detected
boolean shipKill(SpaceMan spaceMan, Ship ship)
{
  float weaponDistanceX = abs(spaceMan.getWeaponXCoord()-ship.getTargetX());
  float weaponDistanceY = abs(spaceMan.getYCoord()-ship.getTargetY());
  if ((weaponDistanceX <=60)&&(weaponDistanceY <=60)) {
    return true;
  }
  return false;
}

//Collission detection method
void collissions() {
  //called if collectCoin is true
  boolean collect = collectCoin(spaceMan, coin);
  if (collect == true) {
    coin.coinCollected(); 
    score+=1;
    scoreSingles+=1;
  }

  //called if spaceManCollission is true
  boolean spaceManHit = spaceManCollission(spaceMan, ship);
  if (spaceManHit == true) {
    ship.shipDown();
    hitPointLoss+=1;
  }

  //called if shipKill is true
  boolean shipHit = shipKill(spaceMan, ship);
  if (shipHit == true) {
    spaceMan.setWeaponXCoord(width+200);
    ship.shipDown();
    kills+=1;
  }
}
