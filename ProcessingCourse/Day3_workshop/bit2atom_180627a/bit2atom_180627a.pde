ArrayList myBall;

void setup() {
  size(600, 600);
  myBall = new ArrayList();
}

void mousePressed() {
  Ball thisBall = new Ball(mouseX, mouseY, 30, 175);
  myBall.add(thisBall);
}

void draw() {
  background(0);
  for (int i = 0; i < myBall.size(); i ++) {
    Ball oneBall = (Ball)myBall.get(i);
    oneBall.run();
  }
  println(myBall.size());
}
