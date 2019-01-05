class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  
  float angle;
  float aVelocity;
  float aAcceleration;
  
  Mover(float x_, float y_, float mass_) {
    location = new PVector(x_, y_);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = mass_;
    angle = 0;
    aVelocity = 0;
    aAcceleration = 0;
  }
  
  void update() {
    
    aAcceleration = acceleration.x / 5.0;
    aVelocity += aAcceleration;
    aVelocity = constrain(aVelocity, -0.1, 0.1);
    angle += aVelocity;
    
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    
    stroke(50);
    fill(220, 50);
    rect(0, 0, mass*8, mass*8);
    popMatrix();
  }
  
  void applyForce(PVector force) {
    PVector f = force.copy();
    f.mult(mass);
    acceleration.add(f);
  }
}
