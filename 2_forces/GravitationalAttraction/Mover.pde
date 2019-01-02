class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float r, g, b;
  
  Mover(float x_, float y_, float mass_) {
    location = new PVector(x_, y_);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    r = random(255);
    g = random(255);
    b = random(255);
    mass = mass_;
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display() {
    noStroke();
    fill(r, g, b, 80);
    ellipse(location.x, location.y, mass*16, mass*16);
  }
  
  void applyForce(PVector force) {
    PVector f = force.copy();
    f.mult(mass);
    acceleration.add(f);
  }
}
