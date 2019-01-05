Attractor a;
Mover[] movers;
void setup() {
  size(800, 500);
  background(255);
  rectMode(CENTER);
  a = new Attractor(width/2, height/2, 10);
  movers = new Mover[15];
  
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(width), random(height), random(1, 5));
  }
}

void draw() {
  background(255);
  
  a.display();
  
  for (Mover m : movers) {
    m.applyForce(a.attract(m));
    
    m.update();
    m.display();
  }
}
