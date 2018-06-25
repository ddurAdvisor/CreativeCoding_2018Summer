//initiate the system
int ellipseX = 400; //x value for ellipse
int ellipseY = 300; //y value for ellipse
float sinAng = 0;

void setup(){
  size(800, 600);
}

void draw(){
  background(120);
  stroke(255, 0, 0);
  strokeWeight(5);
  //fill(50,120);
  noFill();
  ellipse(ellipseX, ellipseY, 120, 120);
  //ellipseX = ellipseX +1;
  //ellipseY ++;
  ellipseX += 10*sin(sinAng);
  sinAng += 0.2;
}
