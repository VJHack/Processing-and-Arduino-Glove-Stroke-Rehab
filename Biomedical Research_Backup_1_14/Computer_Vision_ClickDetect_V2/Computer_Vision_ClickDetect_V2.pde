import processing.serial.*;
import processing.video.*;

Serial gloveData;
// Variable for capture device
Capture video;

String sensorValue;
int sensorValueInt;

// A variable for the color we are searching for.
color trackColor; 
int mousePressed = 0;

float threshold = 20;
int ballX = 5;
int ballY = 5;
int ballSpeedX = 20;
int ballSpeedY = 10;
int sensorMove;


void setup() {
  size(640, 480);
  video = new Capture(this, width, height);
  video.start();
  // Start off tracking for red
  trackColor = color(255, 0, 0);
  smooth(80);
  
  println("Available Serial Ports:");
  println(Serial.list());
  String portName = Serial.list()[0];
  gloveData = new Serial(this, portName, 9600);
 // gloveData = new Serial(this, Serial.list()[0], 9600);
 

}




void captureEvent(Capture video) {
  // Read image from the camera
  video.read();
}
/*void keyPressed(){
fill(0);
rect(0,0,width,height);
}*/
void draw() {

  
  if(gloveData.available() > 0)
   {
    sensorValue = gloveData.readStringUntil('\n');
    sensorValueInt = int(sensorValue.trim());
    println(sensorValue);
  }
  //delay (10);
  
  
  video.loadPixels();
  image(video, 0, 0);
  

//if(keyPressed){
  if(mousePressed == 1){
    video.loadPixels();
    image(video, 0, 0);
    fill(0);
    rect(0,0,width,height);

  // Before we begin searching, the "world record" for closest color is set to a high number that is easy for the first pixel to beat.
  float worldRecord = 500; 

  // XY coordinate of closest color
  float avgX = 0;
  float avgY = 0;

  int count = 0;

        
         

  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x++ ) {
    for (int y = 0; y < video.height; y++ ) {
      int loc = x + y*video.width;
      // What is current color
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);

      // Using euclidean distance to compare colors
      float d = dist(r1, g1, b1, r2, g2, b2); // We are using the dist( ) function to compare the current color with the color we are tracking.

      // If current color is more similar to tracked color than
      // closest color, save current location and current difference
      if (d < threshold) {   
        avgX += x;
        avgY += y;
        
        count++;
      
         
   /*         
    fill(255,255,255);  //white
    rect(width-avgX, avgY + 100 , 100, 20);
    */

    
            
    if(sensorValueInt > 50){
      fill(255,255,255); //white
      rect(width-avgX, avgY + 100, 100, 20);
    }
        
    if((sensorValueInt) < 50){
      fill(255,2,25);
      rect(width-avgX, avgY + 100, 100, 20);
    } 
       /*    if(sensorMove > 45){
                     
    fill(255,255,255);
    rect(width-avgX, avgY + 100  /*video.width  height - 50*///, 100, 20);
        //}
      }
    }
  }

  // We only consider the color found if its color distance is less than 10. 
  // This threshold of 10 is arbitrary and you can adjust this number depending on how accurate you require the tracking to be.
  
  
  if (count > 10) { 
    avgX = avgX / count;
    avgY = avgY / count;
    
    // Draw a circle at the tracked pixel
    fill(255,255,255);
   strokeWeight(4.0);
   //stroke(0);
    //rect(width-avgX, avgY + 100  /*video.width  height - 50*/, 100, 20);    
 delay(10);
 
 
 ballX += ballSpeedX;
 ballY +=ballSpeedY;
 
  if(ballY < 0 || ballY > height) ballSpeedY = -ballSpeedY;
//  if(ballX > width - 10) ballSpeedX = -ballSpeedX;
  //if( ballY < paddleMove + 75) ballSpeedY = -ballSpeedY;
  if(ballX < 0 || ballX > width){
     ballSpeedX = -ballSpeedX;
  }
  if(ballY > height-50){//if(ballX > avgX){
    // ballSpeedX = -ballSpeedX;
     ballSpeedY = -ballSpeedY;
       if(ballX > avgX && ballX < 100){
    ballSpeedX = -ballSpeedX;
  }
  }

  
 /*  if(ballX > width-25){
  if(ballY > mouseY && 
    ballY < mouseY + 75){
     ballSpeedX = -ballSpeedX;}
  }
  if(ballX < 5){
   y = y + 1;
   delay(500);
   ballX = width/2;
   ballY = height/2;
  paddleMove = height/2 + 50;
  paddleMove1 = height/2 + 50;
  }
   if(ballX > 795){
   x = x + 1;
   delay(500);
   ballX = width/2 - 50 ;
   ballY = height/2 - 50;
  paddleMove = height/2 + 50;
  mouseY = height/2 - 50;
  }*/
  ellipse(ballX,ballY, 16, 16);
  }
  }
}


void mousePressed() {
  // Save color where the mouse is clicked in trackColor variable
  int loc = mouseX + mouseY*video.width;
  trackColor = video.pixels[loc];
  
  mousePressed = 1;
}