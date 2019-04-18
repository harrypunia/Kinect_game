class Floor {
  
   float x, y, size, initX;
   boolean inScreen;
   UnderGround ug;
   
   Floor(float inX, float inY, float inBlockSize) {
      x = inX; initX = inX; y = inY; size = inBlockSize;
      ug = new UnderGround(inX, inY, inBlockSize);
   }
   
   void show() {
     inScreen = x > -size && x < width + size && this.y < height;
     if(inScreen) { 
       noFill();
       image(assets.ground, this.x, this.y, this.size + 1, this.size + 1);
       rect(this.x, this.y, this.size + 1, this.size + 1);
       ug.show(x);
     }
   }
   
   void updatePan() {this.x -= playerSpeed;}
   
}

class UnderGround {
  
   float x, y, size;
   float [] arr;
   
   UnderGround(float inX, float inY, float inBlockSize) {
     x = inX; y = inY; size = inBlockSize;
     int arrLength = int(int((height - inY) / inBlockSize) + 1);
     arr = new float[arrLength];
     for(int i = 0; i < arr.length; i++) {
       arr[i] = inY + ((i + 1) * inBlockSize);
     }
   }
   
   void show(float newX) {
    fill(50);
    for(int i = 0; i < arr.length; i++){
      image(assets.underGround, newX, arr[i], size + 1, size + 1);
     } 
   }
   
}
