class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
  Particle(PVector location_p) {
    location = location_p.copy();
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector(0, 0.2);
    lifespan = 255;
  }
  
  void run() {
    update();
    //display();
  } 
  
  void update() {
    location.add(velocity);
    velocity.add(acceleration);
    lifespan -= 15.0;
    
    acceleration.mult(0);
  }
  
  void display() {
    noStroke();
    fill(125, lifespan);
    ellipse(location.x, location.y, 10, 10);
  }
  
  boolean isDead() {
    return lifespan <= 0.0 ? true : false;
  }
  
  void applyForce(PVector f) {
    acceleration.add(f);
  }
}
