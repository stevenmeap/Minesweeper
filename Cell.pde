public class Cell extends Button {
  private int row, collumn;
  private String difficulty;
  private boolean mine;
  private boolean flagged;
  private int nearMines;
  private float modifier;
  public Cell(int x, int y, int width, int height, int row, int collumn, String difficulty) {
    super(x, y, width, height);
    this.difficulty = difficulty;
    setModifier();
    this.row = row;
    this.collumn = collumn;

    mine = Math.random() < modifier;
  }



  private void setModifier() {
    switch(difficulty) {
    case "PEACEFUL":
      modifier = 0.04;
      break;
    case "EASY":
      modifier = 0.1;
      break;
    case "NORMAL":
      modifier = 0.2;
      break;
    case "HARD":
      modifier = 0.3;
      break;
    case "HARDER_THAN_HARD":
      modifier = 0.5;
      break;
    default: 
      modifier = 0.2;
      break;
    }
  }

  public void drawButton() {
    if(isMouseOn() && clickOn && !mousePressed && !flagged) flag();
    if (flagged && mine) {
      r = 255;
      g = 0;
      b = 0;
    } else if (!flagged && clickOn || flagged) {
      r = 80;
      g = 80;
      b = 80;
    } else {
      r = 240;
      g = 240;
      b = 240;
    }
    super.drawButton();
    showNearbyMines(nearMines);
  }


  public void flag() {
    if (flagged || gameBoard.hasWon() || gameBoard.hasLost()) return;
    flagged = true;
    gameBoard.checkWin();
    if (mine) {
      r = 255;
      g = 0;
      b = 0;
      gameBoard.showAll();
      gameBoard.setLost(true);
      return;
    }
    r = 80;
    g = 80;
    b = 80;
    if (nearMines == 0)
      for (int i = row - 1; i <= row + 1; i++) {
        if (i < 0 || i >= gameBoard.cells.length) continue;
        for (int a = collumn - 1; a <= collumn + 1; a++) {
          if (a < 0 || a >= gameBoard.cells[i].length || (a == collumn && i == row)) continue;
          Cell cell = gameBoard.cells[i][a];
          if (cell != null && !cell.isFlagged() && !cell.hasMine()) {
            cell.flag();
          }
        }
      }
  }

  public void setNearMines() {
    int nearMines = 0;
    for (int i = row - 1; i <= row + 1; i++) {
      if (i < 0 || i >= gameBoard.cells.length) continue;
      for (int a = collumn - 1; a <= collumn + 1; a++) {
        if (a < 0 || a >= gameBoard.cells[i].length || (a == collumn && i == row)) continue;
        Cell cell = gameBoard.cells[i][a];
        if (cell != null && !cell.isFlagged()) {
          if (cell.hasMine()) {
            nearMines++;
          }
        }
      }
    }
    this.nearMines = nearMines;
  }

  public void showNearbyMines(int mines) {
    if (!flagged || mine) return;
    pushMatrix();
    fill(255);
    textSize(this.width);
    text("" + mines, x, y + this.height / 2);
    popMatrix();
  }



  public boolean isFlagged() {
    return flagged;
  }
  public boolean hasMine() {
    return mine;
  }

  public int getNearbyMines() {
    return nearMines;
  }
}
