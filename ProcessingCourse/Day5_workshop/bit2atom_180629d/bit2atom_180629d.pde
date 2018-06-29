String[] lines;

void setup() {
  size(800, 600);
  lines = loadStrings("points.csv");
}

void draw() {
  background(255);
  for (int i = 0; i < lines.length; i ++) {
    String[] values = split(lines[i], ",");
    float[] loc = float(values);
    ellipse(loc[0], loc[1], 30, 30);
  }
}
