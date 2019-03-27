class Floor {
   float x, size, initX;
   int y;
   UnderGround ug;
   
   Floor(float inX, int inY, float inBlockSize) {
      x = inX; initX = inX; y = inY; size = inBlockSize;
      ug = new UnderGround(inX, inY, inBlockSize);
   }
   
   void show() {
     fill(0);
     noStroke();
     rect(this.x, this.y, this.size + 1, this.size + 1);
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
   UpperGround(float inX, int inY, float inBlockSize) {
     x = inX; y = inY; s = inBlockSize;
     arr = new float[int(inY / inBlockSize) + 1];
     for(int i = 0; i < arr.length; i++) {
       arr[i] = inY - ((i + 1) * inBlockSize);
     }
   }
   void show(float newX) {
    fill(255, 50, 50);
    for(int i = 0; i < arr.length; i++){ 
       rect(newX, arr[i], s + 1, s + 1);
     } 
   }
}
