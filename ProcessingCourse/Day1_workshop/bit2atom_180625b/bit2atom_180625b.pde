void setup(){
  size(800, 800);
  background(0);
}

void draw(){
  float ellipseX = random(800);
  float ellipseY = random(800);
  fill(random(255), random(255), random(255), random(50, 200));
  noStroke();
  float ellipseD = random(50, 200);
  ellipse(ellipseX, ellipseY, ellipseD, ellipseD);
}
