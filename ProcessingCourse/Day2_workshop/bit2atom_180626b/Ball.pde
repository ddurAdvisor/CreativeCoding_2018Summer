class Ball{
  float ellipseX = 0;
  float ellipseY = 0;
  float ellipseR = 25;
  float vX = 0;
  float vY = 0;
  float elliR, elliG, elliB;
  
  Ball(float elliX, float elliY, float elliR, float vX_, float vY_, float elliR_, float elliG_, float elliB_){
    ellipseX = elliX;
    ellipseY = elliY;
    ellipseR = elliR;
    vX = vX_;
    vY = vY_;
    elliR = elliR_;
    elliG = elliG_;
    elliB = elliB_;
  }
  
  void update(){
    move();
    collision();
    display();
  }
  
  void move(){
    ellipseX += vX;
    ellipseY += vY;
  }
  
  void display(){
    fill(elliR, elliG, elliB);
    noStroke();
    ellipse(ellipseX, ellipseY, ellipseR*2, ellipseR*2);
  }
  
  void collision(){
    if(ellipseX + ellipseR > width){
      ellipseX = width - ellipseR;
      vX = vX*-1;
    }
    if(ellipseX - ellipseR < 0){
      ellipseX = ellipseR;
      vX = vX*-1;
    }
    if(ellipseY + ellipseR > height){
      ellipseY = height - ellipseR;
      vY = vY*-1;
    }
    if(ellipseY - ellipseR < 0){
      ellipseY = ellipseR;
      vY = vY*-1;
    }
  }
}
