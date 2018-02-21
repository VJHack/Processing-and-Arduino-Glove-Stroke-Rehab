/*
  AnalogReadSerial
  Reads an analog input on pin 0, prints the result to the serial monitor.
  Attach the center pin of a potentiometer to pin A0, and the outside pins to +5V and ground.

 This example code is in the public domain.
 */

// the setup routine runs once when you press reset:
  int sensorValue = 0;
  int flexSensorPin = A0; //analog pin 0
  int flexSensorPin1 = A1; //analog pin 0

void setup() {

  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
}

// the loop routine runs over and over again forever:
void loop() {
  
  //Serial.println("Hello Vinesh");
          // delay in between reads for stability
  int flexSensorReading = analogRead(flexSensorPin);
   int flexSensorReading1 = analogRead(flexSensorPin1);
 // int flexSensorReading1 = analogRead(flexSensorPin1);
  Serial.print("fP");
  Serial.println(flexSensorReading);
  Serial.print("fI");
  Serial.println(flexSensorReading1);
  
//  Serial.println(flexSensorReading1);
delay(2000);
}


