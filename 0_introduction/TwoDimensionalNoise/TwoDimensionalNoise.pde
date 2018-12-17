void setup() {
  size(480, 480);
}

float xoff;
float yoff;

void draw() {
  loadPixels();
  
  xoff = 0.0;
  for (int x = 0; x < width; x++) {
    
    //
    // Since we are going from top to bottom (for every x change every y),
    // we reset the y offset for each x location
    yoff = 0.0;
    
    for (int y = 0; y < height; y++) {
      pixels[x + y * width] = color(map(noise(xoff, yoff), 0, 1, 0, 255));
      yoff += 0.01;
    }
    
    xoff += 0.01;
  }
  
  updatePixels();
  noLoop();
}
