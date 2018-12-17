import java.util.Random;

Random gen = new Random();
class Walker {
  float x;
  float y;

  Walker() {
    x = width / 2;
    y = height / 2;
  }

  void display() {
    noStroke();
    fill(
      getGaussian(100, 50),
      getGaussian(140, 30),
      getGaussian(200, 10),
      30
    );
    ellipse(x, y, 15, 15);
  }

  void step() {
    x = getGaussian(100, mouseX);
    y = getGaussian(40, mouseY);
  }
}

float getGaussian(int dev, int mean) {
  float randomStep = (float) gen.nextGaussian();
  return dev * randomStep + mean;
}

Walker w;
void setup() {
  size(640, 420);
  w = new Walker();
}

void draw() {
  w.display();
  w.step();
}