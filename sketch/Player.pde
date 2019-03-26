class Player {
   float x, s;
   int y;
   Player(float inX, int inY, float inS) {
     x = inX; y = inY; s = inS;
   }
   void show() {
     fill(200, 10, 200);
    ellipse(x, y, s, s); 
   }
}
