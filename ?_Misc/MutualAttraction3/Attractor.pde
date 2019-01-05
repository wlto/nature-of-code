class Attractor {
  PVector location;
  float mass;
  float G;
  
  Attractor(float x_, float y_, float mass_) {
    location = new PVector(x_, y_);
    mass = mass_;
    G = 0.2;
  }
  
  PVector attract(Mover m) {
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();
    distance = constrain(distance, 1, 5);
    force.normalize();
    
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);
    
    return force;
  }
}
