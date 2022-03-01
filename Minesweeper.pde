private GameBoard gameBoard;
private Reset button;
private DifficultyButton[] buttons;
public void setup() {
  size(700, 700);
  gameBoard = new GameBoard("NORMAL");
  gameBoard.initButtons();
  init();
}
private void init() {
  buttons = new DifficultyButton[5];
  button = new Reset(width/2, height - 50, 50, 25);
  buttons[0] = new DifficultyButton(50, 100, 50, 25, (byte) 0);
  buttons[1] = new DifficultyButton(50, 200, 50, 25, (byte) 1);
  buttons[2] = new DifficultyButton(50, 300, 50, 25, (byte) 2);
  buttons[3] = new DifficultyButton(50, 400, 50, 25, (byte) 3);
  buttons[4] = new DifficultyButton(50, 500, 50, 25, (byte) 4);
}

public void draw() {
  background(255);
  gameBoard.showButtons();
  button.drawButton();
  for (DifficultyButton b : buttons) {
    b.drawButton();
    if (b.isClicked()) {
      gameBoard = new GameBoard(b.getDifficulty());
      gameBoard.initButtons();
    }
  }
  pushMatrix();
  fill(0);
  textSize(30);
  textAlign(CENTER);
  text("MINESWEEPER", width/ 2, 50);
  String subtitle = getSubtitle();

  if (gameBoard.hasWon() && !gameBoard.hasLost())
    fill(0, 255, 0);
  textSize(15);
  text(subtitle, width/2, 75);
  popMatrix();
  if (button.isClicked()){
    gameBoard = new GameBoard(gameBoard.getDifficulty());
    gameBoard.initButtons();
  }
}
private String getSubtitle() {
  if (gameBoard.hasWon() && !gameBoard.hasLost()) {
    switch(gameBoard.getDifficulty()) {
    case "HARDER_THAN_HARD": 
      return "You did the impossible";
    case "HARD":
      return "You sure know how to sweep";
    case "NORMAL":
      return "average victory";
    case "EASY":
      return "try normal mode!";
    case "PEACEFUL":
      return "no congratulations for you!!";
    }
  } else if (!gameBoard.hasLost()) {
    switch(gameBoard.getDifficulty()) {
    case "HARDER_THAN_HARD": 
      return "do you enjoy pain?";
    case "HARD":
      return "good luck, you need it";
    case "NORMAL":
      return "normie mode";
    case "EASY":
      return "baby mode";
    case "PEACEFUL":
      return "Somehow lower than baby mode...";
    }
  } else {
    switch(gameBoard.getDifficulty()) {
    case "HARDER_THAN_HARD": 
      return "wasn't lying, it's harder than hard";
    case "HARD":
      return "you had a good run";
    case "NORMAL":
      return "you lost in an unexciting way";
    case "EASY":
      return "try peaceful mode";
    case "PEACEFUL":
      return "not as peaceful as you thought...";
    }
  }
  return "null error";
}
