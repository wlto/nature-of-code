class Mover {
  PVector location;
  PVector velocity;
  
  Mover() {
    location = new PVector(0, 0);
    velocity = new PVector(5, 5);
  }
  
  void move() {
    location.add(velocity);
    //velocity.limit(20);
  }
  
  void detectEdges() {
    if (location.x >= width || location.x <= 0) velocity.x *= -1;
    if (location.y >= height || location.y <= 0) velocity.y *= -1;
  }
  
  void display() {
    noStroke();
    fill(100, 50);
    ellipse(location.x, location.y, 50, 50);
  }
}

Mover m;
void setup() {
  size(640, 420);
  m = new Mover();
}

void draw() {
  //background(255);
  m.move();
  m.detectEdges();
  m.display();
}
