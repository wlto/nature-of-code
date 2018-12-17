class Walker {
  int x;
  int y;
  float xoff = 0;
  float yoff = 5000;

  Walker() {
    x = width / 2;
    y = height / 2;
  }

  Walker(int x_p, int y_p) {
    x = x_p;
    y = y_p;
  }

  void step() {
    xoff += 0.005;
    yoff += 0.005;

    x = (int) map(noise(xoff), 0, 1, 0, width);
    y = (int) map(noise(yoff), 0, 1, 0, height);
  }

  void display() {
    stroke(0, 25);
    point(x, y);
  }
}

Walker[] w = new Walker[50];
void setup() {
  size(640, 640);
  // w = new Walker();
  for (int i = 0; i < w.length; i++) {
    randomSeed(i);
    w[i] = new Walker(
      (int) random(width),
      (int) random(height)
    );
  }
}

void draw() {
  for (int i = 0; i < w.length; i++) {
    w[i].step();
    w[i].display();
  }
}
