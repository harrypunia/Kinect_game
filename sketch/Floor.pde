class Floor {
  
   float x, y, size, initX;
   UnderGround ug;
   
   Floor(float inX, float inY, float inBlockSize) {
      x = inX; initX = inX; y = inY; size = inBlockSize;
      ug = new UnderGround(inX, inY, inBlockSize);
   }
   
   void show() {
     updatePan();
     if(x > -size || this.x < width + size) { 
       fill(0);
       noStroke();
       rect(this.x, this.y, this.size + 1, this.size + 1);
       ug.show(this.x);
     }
   }
   
   void updatePan() {this.x -= playerSpeed;}
   
}

class UnderGround {
  
   float x, y, size;
   float [] arr;
   
   UnderGround(float inX, float inY, float inBlockSize) {
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
