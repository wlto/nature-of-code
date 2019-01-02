Wing w;

void setup() {
  size(800, 500);
  background(255);
  w = new Wing();
}

void draw() {
  background(255);
  
  PVector gravity = new PVector(0, 0.1);
  gravity.mult(w.mass);
  w.applyForce(gravity);
  
  PVector forward = new PVector(0.2, 0);
  w.applyForce(forward);
  
  PVector drag = w.velocity.copy();
  drag.normalize();
  drag.mult(-1);
  float speed = w.velocity.mag();
  drag.mult(0.01 * speed * speed);
  w.applyForce(drag);
  
  if (mousePressed) {
    PVector lift = forward.copy();
    lift.normalize();
    lift.mult(-1);
    lift.rotate(QUARTER_PI);
    lift.mult(forward.mag());
    w.applyForce(lift);
  }
  
  w.update();
  w.display();
}
