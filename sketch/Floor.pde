class Floor {
   float x, s, initX;
   int y;
   UnderGround ug;
   Floor(float inX, int inY, float inS) {
      x = inX; initX = inX; y = inY; s = inS;
      ug = new UnderGround(inX, inY, inS);
   }
   void show() {
     fill(0);
     noStroke();
     rect(this.x, this.y, this.s + 1, this.s + 1);
     ug.show(this.x);
     updatePan();
   }
   void updatePan() {
     this.x -= playerSpeed;
   }
}

class UpperGround {
   float x, s;
   float y;
   float [] arr;
   UpperGround(float inX, int inY, float inS) {
     x = inX; y = inY; s = inS;
     arr = new float[int(inY / inS) + 1];
     for(int i = 0; i < arr.length; i++) {
       arr[i] = inY - ((i + 1) * inS);
     }
   }
   void show(float newX) {
    fill(255, 50, 50);
    for(int i = 0; i < arr.length; i++){ 
       rect(newX, arr[i], s + 1, s + 1);
     } 
   }
}
