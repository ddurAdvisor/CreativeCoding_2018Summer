float bx = 100;
float by = 100;
float br = 50;
PVector elli = new PVector(bx, by);

void setup(){
  size(600, 600);
}

void draw(){
  background(0);
  ellipse(elli.x, elli.y, br*2, br*2);
}
