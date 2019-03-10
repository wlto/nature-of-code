Particle p;

void setup() {
  //frameRate(60);
  size(640, 480);
  background(255);
  p = new Particle(new PVector(width/2, height/2));
}

void draw() {
  background(255);
  p.run();
  p.applyForce(new PVector(0.04, 0.01));
  if (p.isDead()) {
    println("shit. i'm dead x_x");
    p = new Particle(new PVector(width/2, height/2));
  }
}
