float degrees;
float lineLength;
void setup() {
  size(800, 500);
  background(255);
  degrees = 0;
  lineLength = 0;
}

void draw() {
  background(255);
  degrees += 1;
  lineLength += 0.05;
  
  translate(width/2, height/2);
  rotate(radians(degrees));
  
  stroke(50);
  noFill();
  line(-50 * sin(lineLength), 0, 50 * sin(lineLength), 0);
  
  stroke(0);
  fill(120);
  ellipse(-50, 0, 20, 20);
  ellipse(50, 0, 20, 20);
}
