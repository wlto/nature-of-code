Mover[] movers;
void setup() {
  size(800, 550);
  background(255);
  movers = new Mover[30];
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(width), random(height), random(1, 2));
  }
}

void draw() {
  background(255);
  
  for (int i = 0; i < movers.length; i++) {
    for (int j = 0; j < movers.length; j++) {
      if (i != j) {
        movers[i].applyForce(movers[j].attract(movers[i]));
      }
    }
    
    movers[i].update();
    movers[i].display();
  }
}
