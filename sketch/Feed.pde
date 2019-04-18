class Feed {
  
 float x, y;
 String t = "";
 
 Feed(float inX, float inY) {
   x = inX; y = inY;
 }
 
 void display() {
   textSize(32);
   fill(255);
   noStroke();
   textAlign(CENTER);
   text(t, x, y);
 }
 
 void add (String inT) {
   t = inT;
 }
 
}
