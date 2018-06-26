Ball[] myBall = new Ball[10];

void setup() {
  size(800, 800);
  for (int i = 0; i < 10; i ++) {
    myBall[i] = new Ball(50*i, 60*i, 10+5*i, random(5));
  }
  //myBall = new Ball();
}

void draw() {
  background(0);
  for (int i = 0; i < 10; i ++) {
    myBall[i].move();
    myBall[i].collision();
    myBall[i].display();
  }
}
