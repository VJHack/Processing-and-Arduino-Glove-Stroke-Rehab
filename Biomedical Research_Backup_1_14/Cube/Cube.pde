import processing.vr.*;

void setup() {
  fullScreen(STEREO);
}

int cubex;

void draw() {
  background(157);
  lights();
  translate(width/0.75, height/0.75, 0);
  rotateX(frameCount * 0.05f);
  rotateY(frameCount * 0.005f);  
  noFill();
  box(100);
}