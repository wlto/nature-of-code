class Walker {
  int x;
  int y;
  int[] prob;

  Walker() {
    x = width / 2;
    y = height / 2;
    prob = new int[] {0, 0, 1, 1, 2, 2, 2, 3, 3, 3};
  }

  void display() {
    stroke(0);
    point(x, y);
  }

  void step() {
    int choice = prob[int(random(10))];

    if (choice == 0) {
      x--;
    } else if (choice == 1) {
      y--;
    } else if (choice == 2) {
      x++;
    } else {
      y++;
    }
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