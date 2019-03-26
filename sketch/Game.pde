Floor [] floors = new Floor[40];
Roof [] roofs = new Roof[40];
Player player;

class Game {
   Game(int size, int playerStart, float playerSize) {
     for(int i = 0; i < floors.length; i++) {
      roofs[i] = new Roof(i * size, int(random(size, height/4)), size);
      floors[i] = new Floor(i * size, int(random(height/1.5, height - size)), size);
     }
     player = new Player((playerStart * size) + size/2, int(floors[playerStart].y - playerSize/2), playerSize);
   }
   void show() {
     showEnvironment();
     showPlayer();
   }
   void showEnvironment() {
     for(int i = 0; i < floors.length; i++) {
      roofs[i].show();
      floors[i].show();
     }
   }
   void showPlayer() {
     player.show();
   }
}
