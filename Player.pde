/*Player class - Used for storage of user data and round data using arrays
 **end of game statistics presented to the user highlighting various achievements
 */
public class Player
{
  private String playerName;
  private int count;      
  //Declaration of primitive arrays used to store individual round data
  private int scores [], enemyKills [];

  //Default Constructor,not used
  public Player() {
  }
  //Player constructor which is called during setup and passed in using jOptionPane to set playerName and numberofRounds variables
  //Validation in place to limit String length to the first 6 characters entered   
  public Player(String playerName, int numberOfRounds) {
    if (playerName.length() == 0) {
      this.playerName= "Buzz";
    } else if (playerName.length() < 6) {
      this.playerName= playerName;
    } else {
      this.playerName = playerName.trim().substring(0, 6);
    }
    //Initialising new arrays and count variable for statistics calculations. Size numberOfRounds
    scores = new int[numberOfRounds];
    enemyKills = new int[numberOfRounds];
    count = 0;
  }

  //-------statistics-----------//
  /*Validation completed when the game is reset. 
   **If round score is greater than current value stored in scores array, scores[] is updated to store highest score  
   **called in gameOver method*/
  public int highestScore() {
    int highestScore = scores[0];
    for (int i = 1; i< scores.length; i++) {//length property implemented after video created
      if (scores[i] > highestScore) {
        highestScore = scores[i];
      }
    }
    return highestScore;
  }

  /*Validation completed when the game is reset. 
   **If round score is less than current value stored in scores array, scores[] is updated to store lowest score   
   **called in gameOver method*/
  public int lowestScore() {
    int lowestScore = scores[0];
    for (int i = 1; i < scores.length; i++) {//length property implemented after video created
      if (scores[i] < lowestScore) {
        lowestScore = scores[i];
      }
    }
    return lowestScore;
  }

  /*totals all scores (coins colelcted) and divides by number of scores stored to give the average score
   **called in gameOver method*/
  public int averageScore() {
    int total = 0;
    for (int i = 0; i < scores.length; i++) {//length property implemented after video created
      total = total + scores[i];
    }
    //validation input to fix AritsmeticException:/ by zero
    //error encontered when no points have been accumulated during the game
    if (total > 0) {
      return total/scores.length;//length property implemented after video created
    } else {
      return total;
    }
  }

  /*totals the amount of ships killed in the game
   **called in gameOver method*/
  public int totalKills() {
    int total = 0;
    int killCounter = 0;
    while ( killCounter < enemyKills.length) {//length property implemented after video created
      total = total + enemyKills[killCounter];
      killCounter++;
    }
    {
      return total;
    }
  }
  
  /*Adds score to current array of scores
  **Adds score to current array of scores
  **at current LCV (count) at end of round*/
  public void addScore(int score, int kills) {
    if ((kills >= 0)||(score >= 0)) {
      enemyKills[count] = kills;
      scores[count] = score;
      count++;
    }  
  }

  //------Getters/Accessors--------//
  //Allows other classes access to private variables within this class
  //Accessor for get player name
  public String getPlayerName() {
    return playerName;
  }
  //Accessor for get score array
  public int[] getScores() {
    return scores;
  }
  //Accessor for get get enemy kills array
  public int[] getEnemyKills() {
    return enemyKills;
  }
  
  //------Setters/Mutators--------//  
  //Mutator for player name
  public void setPlayerName(String playerName) {
    this.playerName = playerName.substring(0, 6);
  }

  //Mutator for set score array
  public void setScores(int[] scores) {
    this.scores = scores;
  }  

  //Mutator for set enemy kills array
  public void setEnemyKills(int[] enemyKills) {
    this.enemyKills = enemyKills;
  }   

  //------toString method--------//
  //output at end of program to display game statistics
  public String toString() {
    String str = "Scores for " + playerName + "\n";
    for (int i = 0; i<scores.length; i++) { //length property implemented after video created
      str = str + "Round "+ (i+1) + ":" 
        //Tab escape characted doesn't appear to be working in output
        //Space manually interted
        + "\n\t    Coins collected: " + scores[i]       
        + "\n\t    Space Ships killed: " + enemyKills[i]  + "\n";
    }
    return str;
  }
}
