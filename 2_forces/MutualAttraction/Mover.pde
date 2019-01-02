class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  ArrayList<PVector> history;
  
  Mover(float x_, float y_, float mass_) {
    location = new PVector(x_, y_);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = mass_;
    history = new ArrayList<PVector>();
  }
  
  void update() {
    history.add(new PVector(location.x, location.y));
    
    if (history.size() > 15) {
      history.subList(0, 1).clear();
    }
    
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display() {
    for (int i = 0; i < history.size(); i++) {
      noStroke();
      fill(100, 20);
      ellipse(history.get(i).x, history.get(i).y, mass*16, mass*16);
    }
    
    //stroke(100);
    noStroke();
    fill(50, 90);
    ellipse(location.x, location.y, mass*16, mass*16);
  }
  
  void applyForce(PVector force) {
    PVector f = force.copy();
    f.mult(mass);
    acceleration.add(f);
  }
  
  PVector attract(Mover m) {
    float G = 0.4;
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();
    distance = constrain(distance, 5, 25);
    force.normalize();
    
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);
    
    return force;
  }
}
