public class DifficultyButton extends Button {
  private final byte difficulty;
  public DifficultyButton(int x, int y, int width, int height, byte difficulty) {
    super(x, y, width, height);
    this.difficulty = difficulty;
  }


  public void drawButton() {
    super.drawButton();
    String text = getText();
    pushMatrix();
    fill(0);
    textSize(this.width/ 5);
    text(text, x, y + this.height - 20);
    popMatrix();
  }

  public String getDifficulty() {
    switch(difficulty) {
    case 0: 
      return "PEACEFUL";
    case 1: 
      return  "EASY";
    case 2:  
      return "NORMAL";
    case 3: 
      return "HARD";
    case 4: 
      return "HARDER_THAN_HARD";
    default: 
      return "EASY";
    }
  }
  public String getText() {
    switch(difficulty) {
    case 0: 
      return "peacefuL";
    case 1: 
      return  "easy";
    case 2:  
      return "normal";
    case 3: 
      return "hard";
    case 4: 
      return "harder";
    default: 
      return "EASY";
    }
  }
}