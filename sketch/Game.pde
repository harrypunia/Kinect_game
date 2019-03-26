Floor [] floors = new Floor[40];
Roof [] roofs = new Roof[40];
Player player = new Player();

class Game {
   Game(int size) {
     for(int i = 0; i < floors.length; i++) {
      roofs[i] = new Roof(i * size, int(random(size, height/4)), size);
      floors[i] = new Floor(i * size, int(random(height/1.5, height - size)), size);
     }
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
