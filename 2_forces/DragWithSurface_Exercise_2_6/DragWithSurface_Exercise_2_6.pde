Mover m;
Liquid water;

void setup() {
  size(800, 550);
  background(255);
  m = new Mover(width/2, 0, 3, 50, 15);
  water = new Liquid(0, height/2, width, height/2, 0.15);
}

void draw() {
  background(255);
  
  water.display();
  
  PVector gravity = new PVector(0, 0.2);
  gravity.mult(m.mass);
  m.edges();
  
  m.applyForce(gravity);
  m.dragInside(water);
  
  m.update();
  m.display();
}
