class Walker {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  Walker() {
    location = new PVector(width/2, height/2);
    velocity = PVector.random2D();
    acceleration = new PVector(0, 0);
  }
  
  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    mouse.sub(location);
    mouse.normalize();
    mouse.mult(0.1);
    
    acceleration = mouse;
    
    velocity.add(acceleration);
    velocity.limit(5);
    location.add(velocity);
  }
  
  void display() {
    noStroke();
    fill(50, 50);
    ellipse(location.x, location.y, 50, 50);
  }
}

int MAX = 8;
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
    walkers[i].update();
    walkers[i].display();
  }
}
