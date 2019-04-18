class Feed {
  
 float x, y, initY;
 int counter = 0;
 String t = "";
 
 Feed(float inX, float inY) {
   x = inX; y = inY + 50; initY = inY;
 }
 
 void display() {
   textSize(32);
   fill(255);
   noStroke();
   textAlign(CENTER);
   if(t != "") {
     if(y >= initY) y-= 1;
     counter++;
     text(t, x, y);
     if(counter >= 200) {
        t = "";
        counter = 0;
        y = initY + 50;  
     }
   }
 }
 
 void add (String inT) {
   t = inT;
 }
 
}
