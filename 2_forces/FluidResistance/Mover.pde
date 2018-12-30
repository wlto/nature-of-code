class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  
  Mover(float x_, float y_, float m_) {
    location = new PVector(x_, y_);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = m_;
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display() {
    noStroke();
    fill(255, 155, 155);
    ellipse(location.x, location.y, mass*10, mass*10);
  }
  
  void checkEdges() {
    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
    
    if (location.x > width) {
      velocity.x *= -1;
    }
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void drag(Water w) {
    if (isInside(w)) {
      PVector dragForce = velocity.get();
      dragForce.normalize();
      dragForce.mult(-1);
      
      float speed = velocity.mag();
      float dragMag = speed * speed * w.c;
      dragForce.mult(dragMag);
      applyForce(dragForce);
    }
  }
  
  boolean isInside(Water w) {
    if (location.y >= w.y && location.y <= w.y + w.h) {
      return true;
    } else {
      return false;
    }
  }
}
