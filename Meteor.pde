/*Meteor class-meteors raining down at an angle towards bottom left corner of program. 
 **Is reset once the meteor hits the ground
 **Aray of meteors called in program
 **Cannot interact */
public class Meteor
{
  private float xCoord, yCoord;     //xy coordinate of meteor
  private float speedX, speedY;     //speed of which the meteor travels along the x-axis and y-axis
  private float meteorDimensions;   //determines the height and width of meteor

  //Default meteor constructor which calls the resetMeteor method to initialise the meteor location, sex speed and dimensions
  public Meteor() {
    this.meteorDimensions= 15;
    resetMeteor();
  }
  //Overloaded constructor--Calls private helpder method, takes parameters for meteorDimensions and speedX
  public Meteor(float meteorDimensions, float speedX) {
    this.speedX = speedX;
    this.meteorDimensions= meteorDimensions;
    resetMeteor();
  }

  //display method used to display meteor in program
  //Nested for loop used to give illusion of realistic meteor shape
  public void display() {
    for (int i=10; i>0; i--) {
      stroke(0);
      strokeWeight(1);
      ellipse(xCoord, yCoord, meteorDimensions, meteorDimensions); 
      for (int j=5; j>0; j--) {
        fill(255, 128, 0);
        ellipse(xCoord+(5*i), yCoord-(10*i), meteorDimensions/(i), meteorDimensions/(i));
        fill(120);
        ellipse(xCoord+random(-10, 10), yCoord+random(-10, 10), meteorDimensions/2, meteorDimensions/2);
      }
    }
  }

  //Meteor movement and calls private helper method when meteor hits ground  
  //Updates x and y coordinates us speedX and speedY
  public void update() {
    this.yCoord = yCoord + speedY;
    this.xCoord = xCoord - speedX;
    if (yCoord > height-50-(meteorDimensions/2)) {
      resetMeteor();
    }
  }       

  //------Getters/Accessors--------//
  public float getxCoord() {
    return xCoord;
  }

  public float getyCoord() {
    return yCoord;
  }

  public float getSpeedX() {
    return speedX;
  }

  public float getSpeedY() {
    return speedY;
  }

  public float getMeteorDimensions() {
    return meteorDimensions;
  }

  //------Setters/Mutators--------//  
  public void setxCoord(float xCoord) {
    this.xCoord = xCoord;
  }

  public void setyCoord(float yCoord) {
    this.yCoord = yCoord;
  }

  public void setSpeedX(float speedX) {
    this.speedX = speedX;
  }

  public void setSpeedY(float speedY) {
    this.speedY = speedY;
  }

  public void setmeteorDimensions(float meteorDimensions) {
    this.meteorDimensions = meteorDimensions;
  }

  //------Private Helper Method-------//
  //Only called wihin this class
  //Is called to set initial coordinates and reset meteor coordinates
  private void resetMeteor() {
    this.yCoord = 0-meteorDimensions/2;
    //xCoord set to greater than program width defined in setup
    //allows for meteor speedY to ensure bottom right of program is hit
    this.xCoord=(random(0, 900)); 
    this.speedY = random(3, 5);
  }
}
