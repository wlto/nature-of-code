Attractor a;
ArrayList<Mover> movers;
void setup() {
  size(800, 550);
  background(255);
  a = new Attractor(width/2, height/2, 10);
  movers = new ArrayList<Mover>();
}

void draw() {
  background(255);
  a.display();
  
  if (movers.size() > 80) {
    movers.subList(0, 1).clear();
  }
  
  if (mousePressed) {
    Mover m = new Mover(mouseX, mouseY, random(2, 6));
    movers.add(m);
  }
  
  for (Mover m : movers) {
    m.applyForce(a.attract(m));
    m.update();
    m.display();
  }
}
