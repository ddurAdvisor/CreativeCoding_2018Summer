float[][] pointList;

boolean drawPointStatus = true;
boolean drawCurveStatus = true;
boolean drawLinesStatus = true;

void setup() {
  size(800, 600);
  pointList = new float[10][2];
  initiateData();
}

void initiateData() {
  for (int i = 0; i < 10; i ++) {
    pointList[i][0] = 50 + i*50;
    pointList[i][1] = random(100, 500);
  }
}

void mousePressed() {
  initiateData();
}

void draw() {
  background(255);
  drawReference();
  if (drawLinesStatus) {
    drawLines();
  }
  if (drawCurveStatus) {
    drawCurve();
  }
  if (drawPointStatus) {
    drawPoints();
  }
}

void drawLines() {
  for (int i = 0; i < 9; i ++) {
    strokeWeight(1);
    stroke(0);
    line(pointList[i][0], pointList[i][1], pointList[i+1][0], pointList[i+1][1]);
  }
}

void drawPoints() {
  for (int i = 0; i < 10; i ++) {
    stroke(0);
    strokeWeight(20);
    point(pointList[i][0], pointList[i][1]);
  }
}

void drawCurve() {
  strokeWeight(2);
  stroke(#8767E3);
  noFill();
  beginShape();
  curveVertex(pointList[0][0], pointList[0][1]);
  for (int i = 0; i < 10; i ++) {
    curveVertex(pointList[i][0], pointList[i][1]);
  }
  curveVertex(pointList[9][0], pointList[9][1]);
  endShape();
}

void drawReference() {
  strokeWeight(1);
  stroke(200);
  //line(50, 50, width-50, height-50);
  //strokeWeight(20);
  for (int i = 0; i < 20; i ++) {
    line(50+i*50, 50, 50+i*50, height-50);
  }
  for (int i = 0; i < 20; i ++) {
    line(50, height-50-i*50, width-50, height-50-i*50);
  }
}

void keyPressed() {
  if (key == 'p') {
    if(drawPointStatus){
      drawPointStatus = false;
    }else {
      drawPointStatus = true;
    }
  }
  
  if (key == 'c') {
    if(drawCurveStatus){
      drawCurveStatus = false;
    }else {
      drawCurveStatus = true;
    }
  }
  
  if (key == 'l') {
    if(drawLinesStatus){
      drawLinesStatus = false;
    }else {
      drawLinesStatus = true;
    }
  }
}
