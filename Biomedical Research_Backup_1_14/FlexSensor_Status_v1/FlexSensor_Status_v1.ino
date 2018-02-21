/*
  AnalogReadSerial
  Reads an analog input on pin 0, prints the result to the serial monitor.
  Attach the center pin of a potentiometer to pin A0, and the outside pins to +5V and ground.

 This example code is in the public domain.
 */

// the setup routine runs once when you press reset:
  int sensorValue = 0;
  int flexSensorPin = A0; //analog pin 0


void setup() {

  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
}

// the loop routine runs over and over again forever:
void loop() {
  // read the input on analog pin 0:
  int flexSensorReading = analogRead(flexSensorPin);  
  //Serial.write( analogRead(A0) / 5);
  //sensorValue = sensorValue - 40;
  //sensorValue = Serial.write(analogRead(A0)/4);
  //Serial.println(sensorValue);
  Serial.println(flexSensorReading);
  int flex0to100 = map(flexSensorReading, 512, 614, 0, 100);
  Serial.println(flex0to100);
  
  
  /*
  if(sensorValue < 45)
  {
    // print out the value you read:
    Serial.println(sensorValue);
    //Serial.println("Really Bent " + sensorValue);
    }
  
  if(sensorValue > 85)
  {  
    // print out the value you read:
    Serial.println(sensorValue);
    //Serial.println("Straight " + sensorValue);
  }
  if(sensorValue > 45&& sensorValue < 65)
  {
    // print out the status of the sensor(bent or not):
    Serial.println(sensorValue);    
    //Serial.println("Bent " + sensorValue);
  }
  if(sensorValue > 65&& sensorValue < 85)
  {
    // print out the status of the sensor(bent or not):
    Serial.println(sensorValue);    
    //Serial.println("Almost Straight " + sensorValue);
  }
  //Serial.write(analogRead(A0)/5);  */
  delay(1000);        // delay in between reads for stability
}

