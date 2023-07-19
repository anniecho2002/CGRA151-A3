class Pointer {
  float x = width/2;
  float y = height/2;
  float angle;

  public Pointer(float a) {
    angle = a;
  }

  void drawPointer() {
    stroke(250, 100, 20);
    fill(250, 100, 20);

    pushMatrix();
    translate(x, y);
    rotate(angle);
    rectMode(CENTER);
    ellipse(0, 0, 30, 30);
    rect(0+15, 0, 20, 10);
    popMatrix();
    
    pushMatrix();
    translate(x, y);
    rotate(angle);
    line(0, 0, 600, 0); // draws the straight line
    popMatrix();
  }

  void changeAngle() {
    angle = atan2(mouseY - y, mouseX - x);
  }
  
  boolean objectIntersect(Object obj){
    float x1 = obj.getX();
    float y1 = obj.getY();
    float objAngle = obj.getAngle();
    float x2 = 20 * cos(objAngle); // width of object
    float y2 = 20 * sin(objAngle); // height of object
    float x3 = x;
    float y3 = y;
    float x4 = 600 * cos(angle); // 600 being length of the line
    float y4 = 600 * sin(angle);
    
    float uA = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
    float uB = ((x2-x1)*(y1-y3) - (y2-y1)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
    
    if(uA >= 0 && uA <= 1 && uB >= 0 && uB <= 1){
      return true; // then it is intersecting the object
    } else{
    return false;
    }
  }
  
  
}
