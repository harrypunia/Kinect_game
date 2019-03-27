Physics physics;
Player player;
Environment env;

class Game {
   Game(int size, int playerStart, float playerSize) {
     env = new Environment(size);
     physics = new Physics(playerStart, size);
     player = new Player((playerStart * size) + size/2, int(floors[playerStart].y - playerSize/2), playerSize);
   }
   void show() {
     physics.init();
     player.show();
     player.move();
     env.show();
   }
}
