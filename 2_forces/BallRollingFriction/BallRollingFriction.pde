class Blocker {
  float x;
  float y;
  float w;
  float h;
  
  Blocker(float x_p, float y_p, float w_p, float h_p) {
    x = x_p;
    y = y_p;
    w = w_p;
    h = h_p;
  }
  
  void display() {
    fill(219, 127, 81);
    rect(x, y, w, h);
  }
}

class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  
  Mover() {
    location = new PVector(0, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = 1;
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display() {
    //noStroke();
    fill(0, 80);
    ellipse(location.x, location.y, 30, 30);
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void checkCollision(Blocker b) {
    if (location.x >= b.x && location.x <= b.x + b.w) {
      PVector friction = velocity.get();
      friction.normalize();
      friction.mult(-1);
      
      float c = 0.2;
      float normal = 1;
      friction.mult(c);
      friction.mult(normal);
      
      applyForce(friction);
    }
  }
}

Mover m;
Blocker b;

void setup() {
  size(800, 550);
  background(255);
  m = new Mover();
  b = new Blocker(width/2, m.location.y+8, 30, 7);
}

void draw() {
  background(255);
  line(0, m.location.y+15, width, m.location.y+15);
  
  b.display();
  
  PVector roll = new PVector(0.02, 0);
  m.applyForce(roll);
  
  m.checkCollision(b);
  m.update();
  m.display();
}
