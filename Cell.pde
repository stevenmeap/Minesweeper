public class Cell extends Button {
  private int row, collumn;
  private String difficulty;
  private boolean hasMine;
  private boolean flagged;
  private int nearMines;
  private float modifier;
  public Cell(int x, int y, int width, int height, int row, int collumn, String difficulty) {
    super(x, y, width, height);
    this.difficulty = difficulty;
    setModifier();
    this.row = row;
    this.collumn = collumn;

    hasMine = Math.random() < modifier;
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
    if (flagged && hasMine) {
      r = 255;
      g = 0;
      b = 0;
    } else if (!flagged && isClicked() || flagged) {
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
    if (flagged) return;
    flagged = true;
    checkWin();
    if (hasMine) {
      r = 255;
      g = 0;
      b = 0;
      showAll();
      lost = true;
      return;
    }
    r = 80;
    g = 80;
    b = 80;
    if (nearMines == 0)
      for (int i = row - 1; i <= row + 1; i++) {
        if (i < 0 || i >= cells.length) continue;
        for (int a = collumn - 1; a <= collumn + 1; a++) {
          if (a < 0 || a >= cells[i].length || (a == collumn && i == row)) continue;
          Cell cell = cells[i][a];
          if (cell != null && !cell.isFlagged() && !cell.hasMine()) {
            cell.flag();
          }
        }
      }
  }

  public void setNearMines() {
    int nearMines = 0;
    for (int i = row - 1; i <= row + 1; i++) {
      if (i < 0 || i >= cells.length) continue;
      for (int a = collumn - 1; a <= collumn + 1; a++) {
        if (a < 0 || a >= cells[i].length || (a == collumn && i == row)) continue;
        Cell cell = cells[i][a];
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
    if (!flagged || hasMine) return;
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
    return hasMine;
  }

  public int getNearbyMines() {
    return nearMines;
  }
}
