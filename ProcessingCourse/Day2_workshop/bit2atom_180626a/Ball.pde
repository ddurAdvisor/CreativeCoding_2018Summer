class Ball{
  int ellipseX = 0;
  int ellipseY = 0;
  float ellipseR = 25;
  float v = 0;
  
  Ball(int elliX, int elliY, float elliR, float v_){
    ellipseX = elliX;
    ellipseY = elliY;
    ellipseR = elliR;
    v = v_;
  }
  
  void move(){
    ellipseX += v;
  }
  
  void display(){
    ellipse(ellipseX, ellipseY, ellipseR*2, ellipseR*2);
  }
  
  void collision(){
    if(ellipseX > width){
      ellipseX = width;
      v = v*-1;
    }
    if(ellipseX < 0){
      ellipseX = 0;
      v = v*-1;
    }
  }
}
