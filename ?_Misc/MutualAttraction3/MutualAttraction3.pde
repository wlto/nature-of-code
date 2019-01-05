Attractor a;
Mover[] movers;
void setup() {
  //frameRate(24);
  size(800, 800);
  background(255);
  a = new Attractor(width/2, height/2, 10);
  movers = new Mover[200];
  
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(width), random(height));
  }
}

void draw() {
  background(0);
  
  for (int i = 0; i < movers.length; i++) {
    for (int j = 0; j < movers.length; j++) {
      if (i != j) {
        PVector force = movers[j].attract(movers[i]);
        movers[i].applyForce(force);
      }
    }
    
    movers[i].applyForce(a.attract(movers[i]));
    
    movers[i].update();
    movers[i].display();
  }
}
