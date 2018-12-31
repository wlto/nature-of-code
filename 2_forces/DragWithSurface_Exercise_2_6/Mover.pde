class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float w;
  float h;
  
  Mover(float x_, float y_, float m_, float w_, float h_) {
    location = new PVector(x_, y_);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = m_;
    w = w_;
    h = h_;
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display() {
    noStroke();
    fill(100, 90);
    rect(location.x, location.y, w, h);
  }
  
  void edges() {
    if (location.y > height-h) {
      velocity.y *= -1;
      location.y = height-h;
    }
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void dragInside(Liquid l) {
    if (isInside(l)) {
      PVector dragForce = velocity.get();
      dragForce.normalize();
      dragForce.mult(-1);
      
      float speed = velocity.mag();
      dragForce.mult(l.c * speed * speed);
      
      // Surface
      dragForce.mult(map(w, 0, width/2, 0, 4));
      
      applyForce(dragForce);
    }
  }
  
  boolean isInside(Liquid l) {
    boolean verticallyInside = location.y >= l.y && location.y <= l.y + l.h;
    boolean horizontallyInside = location.x >= l.x && location.x <= l.x + l.w;
    if (verticallyInside && horizontallyInside) {
      return true;
    } else {
      return false;
    }
  }
}
