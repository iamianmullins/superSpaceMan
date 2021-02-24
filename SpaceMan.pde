/*Spaceman class - User controlled object
 */
class SpaceMan {
  private float xCoord, yCoord, weaponXCoord; //xCoord, yCoord of spaceMan, xCoord of laser beam
  private int spaceManDimensions, speedX; //spaceman dimensions, laser beam speed

  //Default Constructor,not used
  public SpaceMan() {
  }
  //Overloaded constructor
  public SpaceMan(float yCoord)
  {
    minim = new Minim(this);
    pewSound = minim.loadFile("pew.mp3");
    this.spaceManDimensions= 100;
    this.weaponXCoord=xCoord;
    this.yCoord = yCoord;
    this.xCoord = 100;
  }


  public void display()
  {
    //Character laser
    stroke(0);
    fill(50, 205, 50);
    for (int i=5; i>0; i--) {
      noStroke();
      ellipse(weaponXCoord+20*i, yCoord+20, weaponXCoord/20, weaponXCoord*i/30);
    }

    //Character Body and jetpack
    if (yCoord<400) {
      fill(255, random(100, 225), 0);
      triangle(xCoord-25, yCoord+30, xCoord-10, yCoord+30, xCoord-20+(random(-5, 5)), yCoord+30+random(10, 25));
    }
    fill(75);
    rect(xCoord-25, yCoord, spaceManDimensions/5, spaceManDimensions-65);
    fill(0);
    rect(xCoord+random(0, 5), yCoord+20, random(5, 10), 30);
    rect(xCoord-random(5, 10), yCoord+20, random(5, 10), 30);
    rect(xCoord+spaceManDimensions/10, yCoord+20, spaceManDimensions/10, spaceManDimensions/10);   
    rect(xCoord-spaceManDimensions/10, yCoord, spaceManDimensions/5, spaceManDimensions-65);

    //Character Head & eyes    
    ellipse(xCoord, yCoord, 35, 35);  
    strokeWeight(3);
    strokeWeight(1);
    stroke(0);
    fill(225);
    //Character Eyes    
    fill(0, 0, 255);
    arc(xCoord, yCoord, 35, 35, radians(0), radians(50));
  }

  //Controls speed and movement
  public void update()
  {
    if ((keyPressed==true)&&(this.yCoord>200)) {
      if ((keyCode==UP)||(keyCode=='w')||(keyCode=='W')) {//keycode UP recommended
        this.yCoord-=5;
      }
    } else if ((keyPressed==false)&&(this.yCoord<400)) {
      this.yCoord+=5;
    } 

    //Logic to ensure weaponXCoord does not continue to increase in value
    if (weaponXCoord<width+100) {
      this.speedX = 15;
    } else
    {
      speedX = 0;
    }
    this.weaponXCoord = weaponXCoord + speedX;
  }

  //Shoot weapon method
  public void updateWeapon()
  {
    weaponXCoord = weaponXCoord + speedX;
    if ((((mousePressed)&&(mouseButton==LEFT))||(keyCode=='D')||(keyCode=='d')//mousebutton LEFT recommended
    ||(keyCode==TAB))&&(weaponXCoord >width)) {
      pewSound.rewind();
      pewSound.play();
      resetWeapon();
    }
  }  

  //------Getters/Accessors--------//
  //Allows other classes access to private variables within this class
  public float getXCoord() {
    return xCoord;
  }
  public float getYCoord() {
    return yCoord;
  }
  public float getWeaponXCoord() {
    return weaponXCoord;
  }
  public int getSpaceManDimensions() {
    return spaceManDimensions;
  }
  public int getSpeedX() {
    return speedX;
  }

  //------Setters/Mutators--------//  
  public void setxCoord(float xCoord) {
    this.xCoord=xCoord;
  }
  public void setyCoord(float yCoord) {
    this.yCoord=yCoord;
  }
  public void setWeaponXCoord(float weaponXCoord) {
    this.weaponXCoord=weaponXCoord;
  }
  public void setSpaceManDimensions(int spaceManDimensions) {
    this.spaceManDimensions=spaceManDimensions;
  }
  public void setSpeedX(int speedX) {
    this.speedX=speedX;
  }

  //------Private Helper Method-------//
  //Only called wihin this class
  //Is called to set initial coordinates and reset weapon coordinates
  private void resetWeapon()
  {          
    this.weaponXCoord = xCoord;
  }
}
