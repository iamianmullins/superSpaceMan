/*Coin class-gold coin moving right to left. Is reset once the coin leaves the screen
**when collected, score is increased by 1*/
public class Coin {
  private float xCoord, yCoord;       //xy coordinates of coin
  private int coinDimensions; //height and width of coin
  private float speedX;       //speed along the x-axis
  private float coinColor;    //Colour modifier 
  private char currency;      //character code for coin currency

  //Default coin constructor which calls the resetCoin 
  public Coin() {
    this.speedX = 5;   
    this.currency = char(36);//currency set to american dollar character code
    resetCoin();
  }

  /*Displays coin in program-
   **coinColor used with modulo operator in game on method-changes color of every 10th coin*/
  public void display(float coinColor, int coinDimensions) {
    this.coinColor=coinColor;
    this.coinDimensions=coinDimensions;
    strokeWeight(2);
    stroke(0);
    fill(255-coinColor, 223-coinColor, 0+coinColor);
    ellipse(xCoord, yCoord, coinDimensions, coinDimensions);
    fill(0);
    textAlign(CENTER);
    textSize(coinDimensions);
    text(currency, xCoord, yCoord+coinDimensions/3);
  }

  //Responsible for coin movement and calls private helper method when coin leaves screen    
  public void update() {
    this.xCoord = xCoord - speedX;
    if (xCoord < 0 - coinDimensions/2) {
      resetCoin();
    }
  }

  //resets coin when spaceman collects coin
  public void coinCollected() {
    resetCoin();
  }

  //------Getters/Accessors--------//
  public float getXCoord() {
    return xCoord;
  }

  public float getYCoord() {
    return yCoord;
  }

  public float getSpeedX() {
    return speedX;
  }

  public int getCoinDimensions() {
    return coinDimensions;
  }
  public float getCoinColor() {
    return coinColor;
  }

  public char currency() {
    return currency;
  }

  //------Setters/Mutators--------//  
  public void setxCoord(float xCoord) {
    this.xCoord=xCoord;
  }

  public void setyCoord(float yCoord) {
    this.yCoord=yCoord;
  }

  public void setSpeedX(float speedX) {
    this.speedX=speedX;
  }

  public void setCoinDimensions(int coinDimensions) {
    this.coinDimensions=coinDimensions;
  }  

  public void setCoinColor(float coinColor) {
    this.coinColor=coinColor;
  } 

  public void setCurrency(char currency) {
    this.currency=currency;
  } 

  //------Private Helper Method-------//
  //Only called wihin this class
  //Is called to set initial coordinates and reset coin coordinates
  private void resetCoin() {
    this.yCoord = random(200, 350);
    this.xCoord = width+coinDimensions/2;
  }
}
