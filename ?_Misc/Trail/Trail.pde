class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  ArrayList<PVector> history;
  
  Mover(float x_, float y_) {
    location = new PVector(x_, y_);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    history = new ArrayList<PVector>();
  }
  
  void update() {
    acceleration = new PVector(random(-1, 1), random(-1, 1));
    
    history.add(new PVector(location.x, location.y));
    if (history.size() > 25) {
      history.subList(0, 1).clear();
    }
    
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(10);
  }
  
  void edges() {
    if (location.x <= 0 || location.x >= width) {
      velocity.x *= -1;
    }
    
    if (location.y <= 0 || location.y >= height) {
      velocity.y *= -1;
    }
  }
  
  void display() {
    for (PVector l : history) {
      noStroke();
      fill(220, 50);
      ellipse(l.x, l.y, 25, 25);
    }
    noStroke();
    fill(150, 100);
    ellipse(location.x, location.y, 25, 25);
  }
}

ArrayList<Mover> movers;
void setup() {
  size(800, 550);
  background(255);
  movers = new ArrayList<Mover>();
}

void draw() {
  background(255);
  
  if (mousePressed) {
    Mover newMover = new Mover(mouseX, mouseY);
    movers.add(newMover);
  }
  
  for (Mover m : movers) {
    m.edges();
    m.update();
    m.display();
  }
}
