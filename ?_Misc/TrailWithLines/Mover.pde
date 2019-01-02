class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  ArrayList<PVector> history;
  float xoff = 10;
  float yoff = 1000;
  
  Mover(float x_, float y_) {
    location = new PVector(x_, y_);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    history = new ArrayList<PVector>();
  }
  
  void update() {
    xoff += 0.01;
    yoff += 0.05;
    
    // Noise
    //acceleration = new PVector(
    //  map(noise(xoff), 0, 1, -10, 10),
    //  map(noise(yoff), 0, 1, -10, 10)
    //);
    
    // Random
    acceleration = new PVector(
      random(-10, 10),
      random(-10, 10)
    );
    
    // Make the history locations jiggle a bit
    for (int i = 0; i < history.size(); i++) {
      history.get(i).x += random(-2, 2);
      history.get(i).y += random(-2, 2);
    }
    
    // Add current location to history
    history.add(new PVector(location.x, location.y));
    
    // Clear one history at a time if size is greater than 25
    if (history.size() > 25) {
      history.subList(0, 1).clear();
    }
    
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(5);
  }
  
  void display() {
    for (int i = 0; i < history.size(); i++) {
      //noStroke();
      //fill(180, 50);
      //ellipse(history.get(i).x, history.get(i).y, 12, 12);
      if (i < history.size() - 1) {
        stroke(0);
        noFill();
        line(
          history.get(i).x,
          history.get(i).y,
          history.get(i+1).x,
          history.get(i+1).y
        );
      }
    }
    stroke(50);
    fill(50);
    ellipse(location.x, location.y, 30, 30);
  }
}
