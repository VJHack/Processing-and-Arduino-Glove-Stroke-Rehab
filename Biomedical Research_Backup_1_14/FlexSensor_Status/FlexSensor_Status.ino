/*
  AnalogReadSerial
  Reads an analog input on pin 0, prints the result to the serial monitor.
  Attach the center pin of a potentiometer to pin A0, and the outside pins to +5V and ground.

 This example code is in the public domain.
 */

// the setup routine runs once when you press reset:




void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
}

// the loop routine runs over and over again forever:
void loop() {
  // read the input on analog pin 0:

 // sensorValue = sensorValue - 40;
  
/*  if(sensorValue < 45){
  // print out the value you read:
  Serial.println("Really Bent");}
  
    if(sensorValue > 85){  
  // print out the value you read:
  Serial.println("Straight");}
  
 
  
  
    if(sensorValue > 45&& sensorValue < 65){
  // print out the status of the sensor(bent or not):
  Serial.println("Bent");}
      if(sensorValue > 65&& sensorValue < 85){
  // print out the status of the sensor(bent or not):
  Serial.println("Almost Straight");}*/
Serial.write( analogRead(A0) / 5);
  delay(10);        // delay in between reads for stability
}

