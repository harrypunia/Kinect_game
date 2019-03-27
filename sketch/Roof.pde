class Roof {
  
   float x, y, initX, size;
   UpperGround up;
   
   Roof(float inX, float inY, float inBlockSize) {
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

class UpperGround {
  
   float x, y, s;
   float [] arr;
   
   UpperGround(float inX, float inY, float inBlockSize) {
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
