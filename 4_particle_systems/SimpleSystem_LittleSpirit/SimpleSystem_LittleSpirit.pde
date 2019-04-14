import java.util.*;

ArrayList<Particle> particles;
int SIZE = 1000;
PImage img;

void setup() {
  size(640, 480);
  background(255);
  img = loadImage("texture.png");
  
  particles = new ArrayList<Particle>();
}

void draw() {
  background(255);
  
  PVector mouse = new PVector(
    (-mouseX + width/2) / 5,
    (-mouseY + height/2) / 5
  );
  mouse.normalize();
  
  particles.add(new Particle(new PVector(mouseX, mouseY)));
  
  Iterator<Particle> it = particles.iterator();
  while (it.hasNext()) {
    Particle p = it.next();
    p.applyForce(
      new PVector(
        random(-0.1, 0.1),
        random(-0.1, 0.1)
      )
    );
    p.applyForce(new PVector(0, -0.8));
    p.run();
    imageMode(CENTER);
    tint(255, p.lifespan);
    image(img, p.location.x, p.location.y);
    if (p.isDead()) {
      it.remove();
    }
  }
}
