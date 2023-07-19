class Object{
  PVector position;
  PVector direction;
  int pointCount;
  int count = 1;
  
  public Object(int pc){
    pointCount = pc;
  }
  
  void drawT(PVector position, float angle){
    stroke(250, 100, 20);
    fill(250, 100, 20);
    //ellipse(0, 0, 35, 35);
    pushMatrix();
    translate(position.x, position.y);
    rotate(angle + PI/2);
    triangle(-10, 30, 0,0, 10, 30);
    popMatrix();
  }
  
  void increasePointCount(){
    pointCount++;
    if(pointCount > numPoints - 1){pointCount = 0;}
  }
  
  int getPointCount(){return pointCount;}
}
