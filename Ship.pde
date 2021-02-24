/*Spaceship class - User can interact with space ships
 **User must shoot and kill spaceships with laser before user is hit or spaceship reaches xCoord-Zero
 */

public class Ship
{
  private PImage spaceShip; //Declaring spaceship field : Getter+Setter not required
  private float xCoord, yCoord;     //xy coordinate of ship
  private float targetX, targetY; //Used to determine center point of image, image X/Y coordinates are top left situated
  private int shipDimensions, speedX;   //height width of ship, speed ship travelsalong the x-axis

  //Default Constructor,not used
  public Ship() {
  }
  //Ship constructor which calls the resetShip method to initialise the ship location
  //parameter passed to set ship speedX
  //xCoord, yCoord, targetX, targetY set to width*3 to give user time to prepare
  public Ship(int speedX) {
    this.xCoord = width*3;
    this.yCoord = height/2;
    this.targetX=xCoord+60;  
    this.targetY=yCoord+60;  
    this.shipDimensions= 120;
    setSpeedX(this.speedX = speedX);
  }

  //display method used to draw and display ship in program       
  public void display() {
    spaceShip=loadImage("spaceShip.png");      
    image(spaceShip, xCoord, yCoord, shipDimensions, shipDimensions);
  }

  //Responsible for ship movement and calls private helper method when ship leaves screen    
  public void update() {
    this.xCoord = xCoord - speedX;
    this.targetX = targetX- speedX;
    if (xCoord < 0 - shipDimensions) {
      hitPointLoss++;
      resetShip();
    }
  }

  public void shipDown() {
    resetShip();
  }

  //------Getters/Accessors--------//
  public float getXCoord() {
    return xCoord;
  }
  public float getYCoord() {
    return yCoord;
  }
  public float getTargetX() {
    return targetX;
  }
  public float getTargetY() {
    return targetY;
  }
  public int getshipDimensions() {
    return shipDimensions;
  }  
  public float getSpeedX() {
    return speedX;
  }  

  //------Setters/Mutators--------//  
  public void setxCoord(float xCoord) {
    this.xCoord=xCoord;
  }
  public void setyCoord(float yCoord) {
    this.yCoord=yCoord;
  }
  public void setTargetX(float targetX) {
    this.targetX=targetX;
  }
  public void setTargetY(float targetY) {
    this.targetY=targetY;
  }
  public void setshipDimensions(int shipDimensions) {
    this.shipDimensions=shipDimensions;
  }
  //validation in place as speedX passed as parameter in constructor method
  //speedX must be greater than 2 and less than 10
  //otherwise speedX will be set to 7
  public void setSpeedX(int speedX) {
    if ((speedX>=2)&&(speedX<=10)) {
      this.speedX=speedX;
    } else {
      this.speedX=7;
    }
  } 

  //------Private Helper Method-------//
  //Only called wihin this class
  //Is called to set initial coordinates and reset coordinates
  private void resetShip() {
    this.xCoord = width;
    this.yCoord = random(150, 350); 
    this.targetX=xCoord+60;  
    this.targetY=yCoord+60;         
  }
}
