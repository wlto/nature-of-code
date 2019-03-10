class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
  Particle(PVector l) {
    this.location = l.copy();
    this.velocity = new PVector(random(-1, 1), random(-2, 0));
    this.acceleration = new PVector(0, 0.05);
    lifespan = 255;
  }
  
  void run() {
    this.update();
    this.display();
  }
  
  void update() {
    this.location.add(this.velocity);
    this.velocity.add(this.acceleration);
    this.acceleration.mult(0);
    lifespan -= 2.0;
  }
  
  void applyForce(PVector p) {
    this.acceleration.add(p);
  }
  
  void display() {
    stroke(230, 10, 40, lifespan);
    fill(230, 10, 40, lifespan);
    ellipse(this.location.x, this.location.y, 20, 20);
  }
  
  boolean isDead() {
    if (this.lifespan <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
