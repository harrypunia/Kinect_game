class Spike {
  
  Floor [] floors;
  int i;
  float x, y, size;
  
  Spike(Floor [] inFloors, int index, float s) {
    floors = inFloors; i = index; size = s;
  }
  
  void show() {
    x = floors[i].x + size/2;
    y = floors[i].y - size;
    if (floors[i].x > 0 && floors[i].x < width + size) {
     image(assets.spike, x, y, size, size);
     detect();
    }
  }
  
  void detect() {
    float gap = dist(x + size/2, y, player.pos.x, player.pos.y);
    if(gap < (playerSize + size)/2 && !player.die) {
       player.die = true; 
    }
  }
}
