PImage myImg;
int spotX;
int spotY;
float spotR;

void setup() {
  size(1024, 576);
  background(255);
  myImg = loadImage("bear.jpg");
}

void draw() {
  //background(0);
  for (int i = 0; i < 100; i++) {
    drawSpots();
  }
  //image(myImg, mouseX-myImg.width/2, mouseY-myImg.height/2);
  println(spotR);
}

void drawSpots() {
  spotX = (int)random(width);
  spotY = (int)random(height);
  noStroke();
  color spotColor = myImg.get(spotX, spotY);
  fill(spotColor, 100);
  spotR = map(brightness(spotColor), 0, 255, 1, 20);
  ellipse(spotX, spotY, spotR, spotR);
}

void keyPressed(){
  if(key == 'a'){
    spotR ++;
  }
  if(key == 'z'){
    spotR --;
    if(spotR < 1){
      spotR = 1;
    }
  }
}
