class Walker {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  Walker() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = PVector.random2D();
  }
  
  void move() {
    acceleration = PVector.random2D();
    
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(5);
  }
  
  void display() {
    noStroke();
    fill(50, 50);
    ellipse(location.x, location.y, 50, 50);
  }
  
  void checkEdges() {
    if (location.x <= 0) location.x = width;
    else if (location.x >= width) location.x = 0;
    
    if (location.y <= 0) location.y = height;
    else if (location.y >= height) location.y = 0;
  }
}

int MAX = 15;
Walker[] walkers = new Walker[MAX];
void setup() {
  size(640, 480);
  background(255);
  for (int i = 0; i < MAX; i++) {
    walkers[i] = new Walker();
  }
}

void draw() {
  background(255);
  for (int i = 0; i < MAX; i++) {
    walkers[i].move();
    walkers[i].checkEdges();
    walkers[i].display();
  }
}
