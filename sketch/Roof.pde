class Roof {
   float x, initX, size;
   float y;
   UpperGround up;
   Roof(float inX, int inY, float inBlockSize) {
     x = inX; initX = inX; y = inY; size = inBlockSize;
     up = new UpperGround(inX, inY, inBlockSize);
   }
   void show() {
     fill(200, 10, 10);
     rect(this.x, this.y, this.size + 1, this.size + 1);
     up.show(this.x);
     updatePan();
   }
   void updatePan() {
     this.x -= playerSpeed;
   }
}

class UnderGround {
   float x, size;
   float y;
   float [] arr;
   UnderGround(float inX, int inY, float inBlockSize) {
     x = inX; y = inY; size = inBlockSize;
     arr = new float[int((height - inY) / inBlockSize) + 1];
     for(int i = 0; i < arr.length; i++) {
       arr[i] = inY + ((i + 1) * inBlockSize);
     }
   }
   void show(float newX) {
    fill(50);
    for(int i = 0; i < arr.length; i++){ 
       rect(newX, arr[i], size + 1, size + 1);
     } 
   }
}
