class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float angle;
  float aVelocity;
  float aAcceleration;
  float lifespan;
  
  Particle(PVector l) {
    this.location = l.copy();
    this.velocity = new PVector(random(-1, 1), random(-1, 1));
    this.acceleration = new PVector(random(-0.1, 0.1), 0);
    
    this.angle = 0;
    this.aVelocity = 0;
    this.aAcceleration = 0;
    
    this.lifespan = 255;
  }
  
  void run() {
    this.update();
    this.display();
  }
  
  void update() {
    this.location.add(this.velocity);
    this.velocity.add(this.acceleration);
    
    println(this.angle);
    this.aAcceleration = this.acceleration.x / 10.0;
    this.aVelocity += this.aAcceleration;
    this.aVelocity = constrain(this.aVelocity, -0.1, 0.1);
    this.angle += this.aVelocity;
    
    this.lifespan -= 2.0;
    this.acceleration.mult(0);
  }
  
  void display() {
    noStroke();
    fill(240, 128, 128, this.lifespan);
    pushMatrix();
    rotate(this.angle);
    rect(this.location.x, this.location.y, 25, 25);
    popMatrix();
  }
  
  boolean isDead() {
    return this.lifespan <= 0.0 ? true : false;
  }
}
