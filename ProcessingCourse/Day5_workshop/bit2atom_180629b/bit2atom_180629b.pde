String elliRadius = "30,50,25,60,40";
float[] radValues;

void setup() {
  size(800, 600);
  dataProcess();
}

void dataProcess() {
  String[] rad = split(elliRadius, ",");
  //printArray(rad);
  radValues = float(rad);
  printArray(radValues);
}

void draw() {
  for (int i = 0; i <radValues.length; i ++) {
    ellipse(50 + i*100, height/2, radValues[i], radValues[i]);
  }
}
