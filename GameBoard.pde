public class GameBoard {
  private String difficulty;
  public Cell[][] cells;
  private boolean lost;
  private boolean win;

  public GameBoard(String difficulty) {
    this.difficulty = difficulty;
    cells = new Cell[55][55];
    win = false;
  }


  private void setVals() {
    for (int i = 0; i < cells.length; i++) {
      for (int o = 0; o < cells[i].length; o++) {
        Cell cell = cells[i][o];
        if(cell != null)
          cell.setNearMines();
      }
    }
  }

  public void initButtons() {
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

  public void showAll() {
    for (int i = 0; i < cells.length; i++) {
      for (int o = 0; o < cells[i].length; o++) {
        Cell cell = cells[i][o];
        if (cell != null && cell.hasMine()) cell.flag();
      }
    }
  }
  public void checkWin() {
    int nomines = 0;
    for (int i = 0; i < cells.length; i++) {
      for (int o = 0; o < cells[i].length; o++) {
        Cell cell = cells[i][o];
        if (!cell.hasMine() && !cell.isFlagged()) nomines++;
      }
    }
    win = nomines == 0;
  }

  private void showButtons() {
    for (int i = 0; i < cells.length; i++) {
      for (int a = 0; a < cells[i].length; a++) {
        Cell cell = cells[i][a];
        cell.drawButton();
      }
    }
  }



  public String getDifficulty() {
    return this.difficulty;
  }
  
  public boolean hasWon(){
    return win;
  }
  public boolean hasLost(){
    return lost;
  }
  public void setWin(boolean win){
    this.win = win;
  }
  public void setLost(boolean lose){
    this.lost = lose;
  }
  public void setDifficulty(String difficulty){
    this.difficulty = difficulty;
  }
  
}
