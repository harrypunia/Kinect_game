class UpperGround {
   float x, s;
   float y;
   float [] arr;
   UpperGround(float inX, int inY, float inS) {
     x = inX;
     y = inY;
     s = inS;
     arr = new float[int(inY / inS) + 1];
     for(int i = 0; i < arr.length; i++) {
       arr[i] = inY - ((i + 1) * inS);
     }
   }
   void show() {
    fill(255, 50, 50);
    for(int i = 0; i < arr.length; i++){ 
       rect(x, arr[i], s, s);
     } 
   }
}
