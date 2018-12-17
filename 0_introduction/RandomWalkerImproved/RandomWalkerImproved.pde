class Walker {
  int x;
  int y;

  Walker() {
    x = width / 2;
    y = height / 2;
  }

  void display() {
    stroke(0);
    point(x, y);
  }

  void step() {
    int randomX = int(random(3)) - 1;
    int randomY = int(random(3)) - 1;

    x += randomX;
    y += randomY;
  }
}

Walker w;
void setup() {
  size(640, 360);
  w = new Walker();
}

void draw() {
  w.display();
  w.step();
}