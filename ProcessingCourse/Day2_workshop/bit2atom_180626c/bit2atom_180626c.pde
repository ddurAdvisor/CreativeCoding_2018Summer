Ball[] myBall = new Ball[10];

PFont myFont;

void setup() {
  size(800, 800);
  background(0);
  myFont = createFont("微软雅黑", 24);
  for (int i = 0; i < 10; i ++) {
    myBall[i] = new Ball(50*i, 60*i, 10+5*i, random(5), random(5), random(255), random(255), random(255), i);
  }
  //myBall = new Ball();
}

void draw() {
  background(0);
  //fill(0, 20);
  //rect(0, 0, width, height);
  
  for (int i = 0; i < 10; i ++) {
    myBall[i].update();
  }
}
