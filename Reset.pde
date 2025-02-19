public class Reset extends Button {

  public Reset(int x, int y, int width, int height) {
    super(x, y, width, height);
    r = 255;
    g = 0; 
    b= 0;
  }

  public void drawButton() {
    
    if (isClicked()) {
      r = r/2;
      g = 0;
      b = 0;
    } else {
      r = 255;
      g = 0;
      b = 0;
    }
    super.drawButton();
    pushMatrix();
    fill(255);
    textSize(this.width / 4);
    text("Reset?", x, y + this.height / 4);
    popMatrix();
  }
}
