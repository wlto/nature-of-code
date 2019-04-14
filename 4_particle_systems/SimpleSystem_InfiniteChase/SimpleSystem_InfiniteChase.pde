import java.util.*;

ArrayList<Particle> particles;
int SIZE = 400;


void setup() {
  size(640, 480);
  background(255);
  
  particles = new ArrayList<Particle>();
}

void draw() {
  background(255);
  
  PVector mouse = new PVector(
    -mouseX + width/2,
    -mouseY + height/2
  );
  mouse.normalize();
  
  particles.add(new Particle(new PVector(width/2, height/2)));
  
  Iterator<Particle> it = particles.iterator();
  while (it.hasNext()) {
    Particle p = it.next();
    p.applyForce(
      new PVector(
        random(0, 0.05),
        random(0, 0.05)
      )
    );
    p.applyForce(mouse);
    p.run();
    if (p.isDead()) {
      it.remove();
    }
  }
}
