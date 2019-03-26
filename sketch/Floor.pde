UnderGround ug;

class Floor {
   float x;
   int y;
   float s;
   Floor(float inX, int inY, float inS) {
      x = inX;
      y = inY;
      s = inS;
      ug = new UnderGround(inX, inY, inS);
   }
   void show() {
     fill(0);
     noStroke();
     rect(x, y, s, s);
     ug.show();
   }
}
