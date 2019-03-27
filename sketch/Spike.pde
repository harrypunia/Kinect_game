class Spike {
  
  Floor [] floors;
  int i;
  float size;
  
  Spike(Floor [] inFloors, int index, float s) {
    floors = inFloors; i = index; size = s;
  }
  
  void show() {
   fill(255, 10, 10);
   rect(floors[i].x + size/2, floors[i].y - size, size, size);
  }
  
}
