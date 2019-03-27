class Roof {
   float x, initX, s;
   float y;
   UpperGround up;
   Roof(float inX, int inY, float inS) {
     x = inX; initX = inX; y = inY; s = inS;
     up = new UpperGround(inX, inY, inS);
   }
   void show() {
     fill(200, 10, 10);
     rect(this.x, this.y, this.s + 1, this.s + 1);
     up.show(this.x);
     updatePan();
   }
   void updatePan() {
     this.x -= playerSpeed;
   }
}

class UnderGround {
   float x, s;
   float y;
   float [] arr;
   UnderGround(float inX, int inY, float inS) {
     x = inX; y = inY; s = inS;
     arr = new float[int((height - inY) / inS) + 1];
     for(int i = 0; i < arr.length; i++) {
       arr[i] = inY + ((i + 1) * inS);
     }
   }
   void show(float newX) {
    fill(50);
    for(int i = 0; i < arr.length; i++){ 
       rect(newX, arr[i], s + 1, s + 1);
     } 
   }
}
