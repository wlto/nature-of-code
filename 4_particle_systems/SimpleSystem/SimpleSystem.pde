import java.util.*;

ArrayList<Particle> particles;
int SIZE = 500;


void setup() {
  size(640, 480);
  background(255);
  
  particles = new ArrayList<Particle>();
}

void draw() {
  background(255);
  
  particles.add(new Particle(new PVector(width/2, height/2)));
  
  Iterator<Particle> it = particles.iterator();
  while (it.hasNext()) {
    Particle p = it.next();
    p.applyForce(
      new PVector(
        random(-0.05, 0.05),
        random(-0.05, 0.05)
      )
    );
    p.run();
    if (p.isDead()) {
      it.remove();
    }
  }
}
