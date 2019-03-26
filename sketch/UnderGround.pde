class UnderGround {
   float x;
   float y;
   float s;
   float [] arr;
   UnderGround(float inX, int inY, float inS) {
     x = inX;
     y = inY;
     s = inS;
     arr = new float[int((height - inY) / inS)];
     for(int i = 0; i < arr.length; i++) {
       arr[i] = inY + ((i + 1) * inS);
     }
   }
   void show() {
    fill(50);
    for(int i = 0; i < arr.length; i++){ 
       rect(x, arr[i], s, s);
     } 
   }
}
