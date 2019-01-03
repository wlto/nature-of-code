Mover[] movers;
void setup() {
  //frameRate(24);
  size(800, 500);
  background(255);
  movers = new Mover[200];
  
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(width), random(height));
  }
}

void draw() {
  background(255);
  
  for (int i = 0; i < movers.length; i++) {
    for (int j = 0; j < movers.length; j++) {
      if (i != j) {
        PVector force = movers[j].attract(movers[i]);
        movers[i].applyForce(force);
      }
    }
    
    //Mover mouse = new Mover(mouseX, mouseY, 250);
    //PVector mouseAttraction = mouse.attract(movers[i]);
    //movers[i].applyForce(mouseAttraction);
    
    movers[i].update();
    movers[i].display();
  }
}
