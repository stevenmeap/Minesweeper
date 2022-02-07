public class Button {
  protected int x, y;
  protected int width, height;

  protected int r, g, b;

 

  public Button(int x, int y, int width, int height) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;


    r = 200;
    g = 200;
    b = 200;
  }


  public void drawButton() {
    pushMatrix();
    fill(r, b, g);

    stroke(0);
    rectMode(CENTER);
    rect(x, y, width, height);
    popMatrix();
    
  }

  public boolean isClicked() {
    double mx = mouseX;
    double my = mouseY;
    return mousePressed && (mx > x - (width/2) && mx < x + (width/2) && my > y - (height/2) && my < y + (height/2));
  }

  public boolean isMouseOn() {
    double mx = mouseX;
    double my = mouseY;
    return (mx > x - (width/2) && mx < x + (width/2) && my > y - (height/2) && my < y + (height/2));
  }
  
  public void setColor(int r, int g, int b){
    this.r = r;
    this.g = g;
    this.b = b;
  }
  





  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }

}
