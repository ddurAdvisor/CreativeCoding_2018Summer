String[] lines = loadStrings("points.csv");
float[][] elliLoc;

void setup() {
  size(800, 600);
}

void dataProcess() {
  for (int i = 0; i < lines.length; i ++) {
    String[] values = split(lines[i], ",");
    elliLoc[i][0] = float(values[0]);
    elliLoc[i][1] = float(values[1]);
  }
}

void draw() {
  background(255);
  for (int i = 0; i < lines.length; i ++) {
    ellipse(elliLoc[i][0], elliLoc[i][1], 30, 30);
  }
}
