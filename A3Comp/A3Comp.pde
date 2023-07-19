int numPoints = 6;
PVector[] pts = new PVector[numPoints];
int[] p = {5, 0, 1, 2, 3, 4, 5, 0, 1}; // loop
Object[] objects =  new Object[1];
int indexOfPoint;
boolean pressed = false;
int step = 80;
int count = 1;

Object t1;
Object t2;
Pointer point;


void setup() {
  size(500, 500);
  frameRate(25);
  pts[0] = new PVector(100, 50); // setting up curves
  pts[1] = new PVector(250, 400);
  pts[2] = new PVector(150, 450);
  pts[3] = new PVector(350, 150);
  pts[4] = new PVector(50, 100);
  pts[5] = new PVector(200, 450);
  objects[0] = new Object(0);
  //objects[1] = new Object(350, 150, 3);

  point = new Pointer(0);
}



void draw() {
  background(255);
  strokeWeight(8);
  stroke(0, 0, 102);
  noFill();


  // drawing the track
  beginShape();
  curveVertex(pts[numPoints - 2].x, pts[numPoints - 2].y);
  curveVertex(pts[numPoints - 1].x, pts[numPoints - 1].y);
  for (int i=0; i<numPoints; i++) {
    curveVertex(pts[i].x, pts[i].y);
  }
  curveVertex(pts[0].x, pts[0].y);
  endShape(CLOSE);


  // drawing straight line from point to point
  strokeWeight(1); 
  stroke(0, 130, 50);
  beginShape();
  for (int i=0; i<numPoints; i++) {
    vertex(pts[i].x, pts[i].y);
  }
  endShape(CLOSE);


  //draw boxes at the points
  rectMode(CENTER);
  fill(0, 130, 50);
  for (int i=0; i<numPoints; i++) {
    rect(pts[i].x, pts[i].y, 10, 10);
  }

  point.changeAngle();
  point.drawPointer();


  // draws the objects
  for (Object o : objects) {
    int pointCount = o.getPointCount();
    PVector newPosition = findPos(pointCount);
    float newAngle = findDirection(pointCount);
    o.update(newPosition, newAngle);
    
    
    if (point.objectIntersect(o) == true){
      stroke(250, 100, 20);
      fill(250, 100, 20);
    }
    else{
      stroke(250, 250, 20);
      fill(250, 250, 20);
    }
    o.drawT(newPosition);
    
  }
  count++;
  if (count >= step) {
    count = 1;
    for (Object o : objects) {
      o.increasePointCount();
    }
  }
}








void mouseDragged() {
  for (int i=0; i<numPoints; i++) {
    if (!pressed) {
      if (dist(mouseX, mouseY, pts[i].x, pts[i].y) < 15 && mousePressed) {
        pressed = true;
        indexOfPoint = i;
      }
    } else {
      pts[indexOfPoint].x = mouseX;
      pts[indexOfPoint].y = mouseY;
    }
  }
}


void mouseReleased() {
  pressed = false;
}






// methods for finding position of the object on the curve
PVector findPos(int pointCount) {
  float t = count/float(step);
  float x = curvePoint(pts[p[pointCount]].x, pts[p[pointCount + 1]].x, pts[p[pointCount + 2]].x, pts[p[pointCount + 3]].x, t);
  float y = curvePoint(pts[p[pointCount]].y, pts[p[pointCount + 1]].y, pts[p[pointCount + 2]].y, pts[p[pointCount + 3]].y, t);
  return new PVector(x, y);
}

float findDirection(int pointCount) {
  float t = count/float(step);
  float tx = curveTangent(pts[p[pointCount]].x, pts[p[pointCount + 1]].x, pts[p[pointCount + 2]].x, pts[p[pointCount + 3]].x, t);
  float ty = curveTangent(pts[p[pointCount]].y, pts[p[pointCount + 1]].y, pts[p[pointCount + 2]].y, pts[p[pointCount + 3]].y, t);
  float a = atan2(ty, tx);
  return a;
}

float findPointerDirection() {
  float tx = mouseX;
  float ty = mouseY;
  float a = atan2(tx, ty);
  return a;
}
