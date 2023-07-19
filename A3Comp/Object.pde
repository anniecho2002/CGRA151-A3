class Object {
  float x;
  float y;
  float angle;
  
  
  float colour;
  int pointCount;
  int count = 1;

  public Object(int pc) {
    pointCount = pc;
  }

  void drawT(PVector position) {
    pushMatrix();
    translate(position.x, position.y);
    rotate(angle);
    triangle(-10, 30, 0, 0, 10, 30);
    popMatrix();
  }

  void increasePointCount() {
    pointCount++;
    if (pointCount > numPoints - 1) {
      pointCount = 0;
    }
  }

  int getPointCount() {
    return pointCount;
  }
  
  
  float getX(){
    return this.x;
  }
  
  float getY(){
    return this.y;
  }
  
  float getAngle(){
    return angle;
  }
  
  void update(PVector direction, float a){
    this.x = direction.x;
    this.y = direction.y;
    this.angle = a + PI/2;
  }
}
