class Balloon {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector floating = new PVector(0, -0.02);
  
  Balloon() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  void move() {
    applyForce(floating);
    
    if (mousePressed) {
      PVector wind = new PVector(0.1, 0);
      applyForce(wind);
    }
    
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(3);
    acceleration.mult(0);
  }
  
  void checkEdges() {
    if (location.y < 0) {
      location.y = 0;
      applyForce(new PVector(0, 0.5));
    }
    if (location.x > width) {
      location.x = width;
      applyForce(new PVector(-0.5, 0));
    } else if (location.x < 0) {
      location.x = 0;
      applyForce(new PVector(0.5, 0));
    }
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void display() {
    noStroke();
    fill(200, 20, 50, 90);
    ellipse(location.x, location.y, 50, 50);
  }
}

Balloon b;
void setup() {
  size(640, 480);
  background(255);
  b = new Balloon();
}

void draw() {
  background(255);
  b.checkEdges();
  b.move();
  b.display();
}
