import processing.serial.*;

Serial gloveData;

String sensorValue;

String sPinkyId = "fP";
String sIndexId = "fI";

int Pinky;
int Index;



int sensorValueInt;

int sensorMove;

void setup() {
  size(800, 500);
   println("Available Serial Ports:");
  println(Serial.list());
  String portName = Serial.list()[0];
  gloveData = new Serial(this, portName, 9600);

  noStroke();
 }
 

void draw() {
  

  
  background(255);
  /*if(
  {*/
    if(gloveData.available() > 0)
  {
    sensorValue = gloveData.readStringUntil('\n');
 
        if (sensorValue != null){
                String sensorValueIdent = sensorValue.substring(0,2);
                String sensorValueNum = sensorValue.substring(2);
               //  println(sensorValueIdent);
            if(sensorValueIdent.equals(sPinkyId) == true){
          Pinky = int(sensorValueNum.trim());
          println(sensorValueIdent + sensorValueNum);
            }
            if(sensorValueIdent.equals(sIndexId) == true){
          Index = int(sensorValueNum.trim());
          print(sensorValueIdent + sensorValueNum);
            }
          delay(50);
        }
  }

     if(Pinky < 40 && Index < 120){
        textSize(30);
       text("Hand Completly Closed", 10, 30); 
         if(mouseY<300){
      fill(0);
      rect(width/2 + 23,  mouseY - 25, 30, 30, 5);
      fill(0,0,255);
      rect(width/2, mouseY, 75, 200, 50);
    }
    if(mouseY>300){
      fill(0);
      rect(width/2 + 23,  300 - 25, 30, 30, 5);
      fill(0,0,255);
      rect(width/2, 300, 75, 200, 50);
      
   
  }
       
     }
     if(Pinky > 40 && Index > 120){
        textSize(30);
       text("Hand Completly Open", 10, 30); 
     }
     if(Pinky < 40 && Index > 120){
        textSize(30);
       text("Only Pinky Closed", 10, 30); 
     }
      if(Pinky > 40 && Index < 120){
        textSize(30);
       text("Only Index Closed", 10, 30); 
         
     }
     else{
     if(mouseY<300){
      fill(0);
      rect(width/2 + 23,  height/2 - 25, 30, 30, 5);
      fill(0,0,255);
      rect(width/2, height/2, 75, 200, 50);
    }
    if(mouseY>300){
      fill(0);
      rect(width/2 + 23,  300 - 25, 30, 30, 5);
      fill(0,0,255);
      rect(width/2, 300, 75, 200, 50);
}
     }}