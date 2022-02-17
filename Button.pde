public class Button {
  protected int x, y;
  protected int width, height;

  protected int r, g, b;
  
  protected boolean clickOn;

 

  public Button(int x, int y, int width, int height) {
    this.x = x;
    this.y = y;
    clickOn = false;
    this.width = width;
    this.height = height;


    r = 200;
    g = 200;
    b = 200;
  }


  public void drawButton() {
    if(isClicked()) clickOn = true;
    if(!isMouseOn()) clickOn = false;
    pushMatrix();
    fill(r, b, g);
    stroke(0);
    rectMode(CENTER);
    rect(x, y, width, height);
    popMatrix();
    
  }

  public boolean isClicked() {
    return mousePressed && isMouseOn();
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
