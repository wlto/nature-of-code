import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class NoiseWalker extends PApplet {

class Walker {
  int x;
  int y;
  float xoff = 0;
  float yoff = 5000;

  Walker() {
    x = width / 2;
    y = height / 2;
  }

  Walker(int x_p, int y_p) {
    x = x_p;
    y = y_p;
  }

  public void step() {
    xoff += 0.005f;
    yoff += 0.005f;

    x = (int) map(noise(xoff), 0, 1, 0, width);
    y = (int) map(noise(yoff), 0, 1, 0, height);
  }

  public void display() {
    stroke(0, 25);
    point(x, y);
  }
}

Walker[] w = new Walker[50];
public void setup() {
  
  // w = new Walker();
  for (int i = 0; i < w.length; i++) {
    randomSeed(i);
    w[i] = new Walker(
      (int) random(width),
      (int) random(height)
    );
  }
}

public void draw() {
  for (int i = 0; i < w.length; i++) {
    w[i].step();
    w[i].display();
  }
}
  public void settings() {  size(640, 640); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "NoiseWalker" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
