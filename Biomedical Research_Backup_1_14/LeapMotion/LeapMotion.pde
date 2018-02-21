import de.voidplus.leapmotion.*;
LeapMotion leap;
void setup(){
   size(800,600,P3D);
   leap = new LeapMotion(this);
}

void draw(){
 background(255);
 
  for (Hand hand : leap.getHands ()) {
    
  
 
 
 
 
   PVector hPos       = hand.getPosition(); 
   PVector hDir       = hand.getDirection();
    
// int     fingerId         = finger.getId();      
 
 println(hDir.y);
 // pos.y is vertical motion ranging from 500 to 0
 // pos.x is (left and right) hoizontal motion ranging from -100 to 800
 // pos.z is forward and back motion rangin from 80 to -20
 
 
 
 
   hand.draw();

  
 
  }
  
  
}