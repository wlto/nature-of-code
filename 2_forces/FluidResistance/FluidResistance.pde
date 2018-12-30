Water w;
Mover[] movers;
void setup() {
  size(800, 550);
  background(255);
  w = new Water(0, height/1.4, width, height/1.4, 0.12);
  movers = new Mover[10];
  
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(width), 0, random(2, 5));
  }
}

void draw() {
  background(255);
  
  w.display(); // Draw water
  
  for (Mover m : movers) {
    if (mousePressed && !m.isInside(w)) {
      PVector wind = new PVector(0.5, 0);
      m.applyForce(wind);
    }
    
    PVector gravity = new PVector(0, 0.1);
    gravity.mult(m.mass);
    m.applyForce(gravity); // Apply gravity
    
    m.drag(w); // Apply drag force
    
    m.checkEdges();
    
    m.update();  // Update mover
    m.display(); // Draw mover
  }
}
