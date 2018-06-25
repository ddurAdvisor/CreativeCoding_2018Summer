void setup(){
  size(800, 800);
  background(0);
}

void draw(){
  float ellipseX = random(800);
  float ellipseY = random(800);
  float ellipseR = map(ellipseX, 0, 800, 0, 255);
  float ellipseB = map(ellipseX, 0, 800, 255, 0);
  fill(ellipseR, 0, ellipseB);
  noStroke();
  float ellipseD = random(50, 200);
  ellipse(ellipseX, ellipseY, ellipseD, ellipseD);
}
