class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  
  Mover(float mass_p, float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = mass_p;
  }
  
  void update() {
    if (mousePressed) {
      applyForce(new PVector(0.5, 0));
    }
    
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display() {
    noStroke();
    fill(100, 80);
    ellipse(location.x, location.y, mass*10, mass*10);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void checkEdges() {
    if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    } else if (location.x > width) {
      velocity.x *= -1;
      location.x = width;
    }
    
    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
  }
}

int MAX_MOVERS = 20;
Mover[] movers;
void setup() {
  size(640, 480);
  background(255);
  movers = new Mover[MAX_MOVERS];
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(10), random(width), random(height));
  }
}

void draw() {
  background(255);
  float normal = 1;
  float c = 0.1; // "mew" - coefficient value
  float frictionMag = normal * c;
  
  for (int i = 0; i < movers.length; i++) {
    // Width gravity
    PVector gravity = new PVector(0, 0.2 * movers[i].mass);
    movers[i].applyForce(gravity);
    
    // With friction
    PVector friction = movers[i].velocity.get();
    friction.normalize();
    friction.mult(-1);
    friction.mult(frictionMag);
    movers[i].applyForce(friction);
    
    movers[i].checkEdges();
    movers[i].update();
    movers[i].display();
  }
}
