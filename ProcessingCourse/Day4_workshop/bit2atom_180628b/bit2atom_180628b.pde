import controlP5.*;
ControlP5 cp;

PImage img;
int rectNum = 50000;

void setup() {
    img = loadImage("bear.jpg");
    cp = new ControlP5(this);
    cp.addSlider("xDiv", 16, 512, 100, 50, 50, 200, 30);
    cp.addSlider("yDiv", 9, 288, 50, 50, 90, 200, 30);
    size(1024, 576);
}

void draw() {
    background(0);
    //image(img, 0, 0);
    //drawRect();
    drawGrid();
}

void drawRect() {
    for (int i = 0; i < rectNum; i ++) {
        int x = int(random(width));
        int y = int(random(height));
        color c = img.get(x, y);
        rectMode(CENTER);
        fill(c, 100);
        noStroke();
        rect(x, y, 30, 30);
    }
}

int xDiv = 64;
int yDiv = 36;

void drawGrid() {
    for (int i = 0; i < xDiv; i ++) {
        for (int j = 0; j < yDiv; j ++) {
            color c = img.get(width/xDiv*2*(i+1/2), height/yDiv*2*(j+1/2));
            rectMode(CENTER);
            fill(c);
            noStroke();
            rect(width/xDiv*2*i, height/yDiv*2*j, width/xDiv*2, height/yDiv*2);
        }
    }
}
