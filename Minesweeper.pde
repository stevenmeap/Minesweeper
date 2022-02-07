import de.bezier.guido.*;


private Cell[][] cells;
private Reset button;
private String difficulty;
private DifficultyButton[] buttons;
public boolean lost;
public boolean win;
public void setup() {
  size(700, 700);
  difficulty = "NORMAL";
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

  cells = new Cell[55][55];
  initButtons();
  win = false;
}

public void draw() {
  background(255);
  showButtons();
  button.drawButton();
  for (DifficultyButton b : buttons) {
    b.drawButton();
    if (b.isClicked()) {
      difficulty = b.getDifficulty();
      init();
    }
  }
  pushMatrix();
  fill(0);
  textSize(30);
  textAlign(CENTER);
  text("MINESWEEPER", width/ 2, 50);
  String subtitle = getSubtitle();
  
  if(win && !lost)
    fill(0,255,0);
  textSize(15);
  text(subtitle, width/2, 75);
  popMatrix();
  if (button.isClicked()) init();
}





private void initButtons() {
  int x = 0;
  int y = 0;
  for (int i = 80; i <= width - 80; i+=10) {
    for (int a = 80; a <= height - 80; a+=10) {
      cells[x][y] = new Cell(i+5, a + 5, 10, 10, x, y, difficulty);
      y++;
    }
    x++;
    y = 0;
  }
  setVals();
  lost = false;
}

private void showButtons() {
  for (int i = 0; i < cells.length; i++) {
    for (int a = 0; a < cells[i].length; a++) {
      Button button = cells[i][a];
      if (button != null)
        button.drawButton();
    }
  }
}


public void mouseReleased() {
  for (int i = 0; i < cells.length; i++) {
    for (int a = 0; a < cells[i].length; a++) {
      Cell cell = cells[i][a];
      if (cell != null)
        if (cell.isMouseOn())
          cell.flag();
    }
  }
}

public void setVals() {
  for (int i = 0; i < cells.length; i++) {
    for (int o = 0; o < cells[i].length; o++) {
      Cell cell = cells[i][o];
      if (cell != null) cell.setNearMines();
    }
  }
}

public void showAll() {
  for (int i = 0; i < cells.length; i++) {
    for (int o = 0; o < cells[i].length; o++) {
      Cell cell = cells[i][o];
      if (cell != null) cell.flag();
    }
  }
}

private String getSubtitle() {
  if (win && !lost) {
    switch(difficulty) {
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
  } else if (!lost) {
    switch(difficulty) {
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
    switch(difficulty) {
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

public void win() {
  int nomines = 0;
  for (int i = 0; i < cells.length; i++) {
    for (int o = 0; o < cells[i].length; o++) {
      Cell cell = cells[i][o];
      if (cell != null && !cell.hasMine() && !cell.isFlagged()) nomines++;
    }
  }
  win = nomines == 0;
}
