class Floor {
   float x, s;
   int y;
   UnderGround ug;
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
