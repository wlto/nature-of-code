ArrayList<Mover> movers;
void setup() {
  size(800, 600);
  background(255);
  movers = new ArrayList<Mover>();
}

void draw() {
  background(255);
  
  if (mousePressed) {
    movers.add(new Mover(mouseX, mouseY));
  }
  
  if (movers.size() > 30) {
    movers.subList(0, 1).clear();
  }
  
  for (Mover m : movers) {
    m.update();
    m.display();
  }
}
