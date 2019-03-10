Particle p;

void setup() {
  size(640, 480);
  background(255);
  rectMode(CENTER);
  p = new Particle(new PVector(width/2, height/2));
}

void draw() {
  background(255);
  p.run();
  if (p.isDead()) {
    println("(x_x)");
    p = new Particle(new PVector(width/2, height/2));
  }
}
