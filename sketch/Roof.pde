class Roof {
   float x;
   float y;
   float s;
   UpperGround up;
   Roof(float inX, int inY, float inS) {
     x = inX;
     y = inY;
     s = inS;
     up = new UpperGround(inX, inY, inS);
   }
   void show() {
     fill(200, 10, 10);
     rect(x, y, s, s);
     up.show();
   }
}
