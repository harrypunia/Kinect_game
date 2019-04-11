class Spike {
  
  Floor [] floors;
  int i;
  float size;
  
  Spike(Floor [] inFloors, int index, float s) {
    floors = inFloors; i = index; size = s;
  }
  
  void show() {
    println(floors[i].x > 0 && floors[i].x < size);
    if (floors[i].x > 0 && floors[i].x < size) {
     fill(255, 10, 10);
     rect(floors[i].x + size/2, floors[i].y - size, size, size);
    }
  }
  
}
