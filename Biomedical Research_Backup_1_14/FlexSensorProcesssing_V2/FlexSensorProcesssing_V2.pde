import processing.serial.*;
Serial myPort;

String sensorValue;

void setup(){
  
          println("Available Serial Ports:");
          println(Serial.list());
          String portName = Serial.list()[0];
          myPort = new Serial(this, portName, 9600);

}

void draw(){
  
   if(myPort.available() > 0)
   {
    sensorValue = myPort.readStringUntil('\n');
  }
  println(sensorValue);
  //delay(1000);
  
}