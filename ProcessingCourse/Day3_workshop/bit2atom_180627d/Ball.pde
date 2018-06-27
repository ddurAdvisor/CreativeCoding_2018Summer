class Ball{
  //Global variables 
  PVector loc;
  PVector speed = new PVector(3, 5);
  float r =25;
  int colorBall;
  
  //class Constructor
  Ball(PVector loc_, float _r, int _colorBall){
    loc = loc_;
    r = _r;
    colorBall = _colorBall;
  }
  
  //Functions
  void run(){
    move();
    display();
    collision();
    gravity();
  }
  
  void move(){
    loc.add(speed);
  }
  
  void gravity(){
    speed.y += 0.2;
  }
  
  void collision(){
    if(loc.x > width-r){
      speed.x = speed.x * -1;
      loc.x = width-r;
    }
    if(loc.x < r){
      speed.x = speed.x * -1;
      loc.x = r;
    }
    if(loc.y > height-r){
      speed.y = speed.y * -1;
      loc.y = height-r;
    }
    if(loc.y < r){
      speed.y = speed.y * -1;
      loc.y = r;
    }
  }
  
  void display(){
     fill(colorBall);
     ellipse(loc.x, loc.y, r*2, r*2);
  }
}
