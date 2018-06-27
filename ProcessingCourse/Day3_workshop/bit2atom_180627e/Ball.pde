class Ball{
  //Global variables 
  PVector loc;
  PVector speed = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  PVector gravity = new PVector(0, 0.01);
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
    pong();
    display();
    collision();
  }
  
  void move(){
    acc.add(gravity);
    speed.add(acc);
    //speed.mult(0.995);
    speed.limit(5);
    loc.add(speed);
    acc = new PVector(0, 0);
  }
  
  void pong(){
    for(int i = 0; i < myBall.size(); i ++){
      Ball other = (Ball)myBall.get(i);
      PVector diff = PVector.sub(loc, other.loc);
      float distance = diff.mag();
      
      if(distance > 0 && distance < r + other.r){
        diff.normalize();
        diff.mult(20/r);
        acc.add(diff);
      }
    }
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
