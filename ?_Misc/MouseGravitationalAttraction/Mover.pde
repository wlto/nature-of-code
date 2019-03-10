class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float G;
  
  float colours[][] = {
    {255, 116, 119},
    {0, 116, 162},
    {95, 130, 137}
  };
  
  ArrayList<PVector> history;
  
  Mover(float x_, float y_) {
    location = new PVector(x_, y_);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = 2;
    G = 0.5;
    history = new ArrayList<PVector>();
  }
  
  Mover(float x_, float y_, float mass_) {
    location = new PVector(x_, y_);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = mass_;
    G = 0.5;
    history = new ArrayList<PVector>();
  }
  
  void update() {
    history.add(new PVector(location.x, location.y));
    
    if (history.size() > 20) {
      history.subList(0, 1).clear();
    }
    
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(10);
    acceleration.mult(0);
  }
  
  void display() {
    int randomColourIndex = ceil(int(random(2)));
    
    for (int i = 0, n = history.size(); i < n; i++) {
      if (i < n - 1) {
        stroke(
          colours[randomColourIndex][0],
          colours[randomColourIndex][1],
          colours[randomColourIndex][2], 50);
        noFill();
        line(
          history.get(i).x,
          history.get(i).y,
          history.get(i + 1).x,
          history.get(i + 1).y
        );
      }
    }
    
    noStroke();
    fill(colours[randomColourIndex][0],
          colours[randomColourIndex][1],
          colours[randomColourIndex][2], 100);
    ellipse(location.x, location.y, 2, 2);
  }
  
  void applyForce(PVector force) {
    PVector f = force.copy();
    f.mult(1);
    acceleration.add(f);
  }
  
  PVector attract(Mover other) {
    PVector force = PVector.sub(location, other.location);
    float distance = force.mag();
    distance = constrain(distance, 5, 20);
    force.normalize();
    
    float strength = (G * mass * other.mass) / (distance * distance);
    force.mult(strength);
    
    return force;
  }
}
