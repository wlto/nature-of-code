class Wing {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  
  Wing() {
    location = new PVector(0, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = 1;
  }
  
  void update() {
    if (location.x >= width) {
      location.x = 0;
    }
    
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display() {
    stroke(200);
    fill(120, 100);
    rect(location.x, location.y, 120, 40);
  }
  
  void applyForce(PVector force) {
    PVector f = force.copy();
    f.mult(mass);
    acceleration.add(f);
  }
}
