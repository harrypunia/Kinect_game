Physics physics;
Player player;
Environment env;
Assets assets;

class Game {
  
   Game(int inBlockSize, int playerStart, float inPlayerSize) {
     assets = new Assets();
     env = new Environment(inBlockSize);
     physics = new Physics(playerStart, inBlockSize, inPlayerSize);
     player = new Player((playerStart * inBlockSize) + inBlockSize/2, floors[playerStart].y - inPlayerSize/2, inPlayerSize);
   }
   
   void show() {
     player.show();
     env.show();
     physics.init();
   }
   
}

void keyPressed() {
  //39 = rightArrow, 37 = leftArrow; 38 == upArrow;
  if(keyCode == 39) env.moveRight = true;
  if(keyCode == 37) env.moveLeft = true;
  if(keyCode == 38) player.startJump = true;
}

void keyReleased() {
  if(keyCode == 39) env.moveRight = false;
  if(keyCode == 37) env.moveLeft = false;
  if(keyCode == 38) player.startJump = false;
}
