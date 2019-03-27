Physics physics;
Player player;
Environment env;

class Game {
  
   Game(int inBlockSize, int playerStart, float inPlayerSize) {
     env = new Environment(inBlockSize);
     physics = new Physics(playerStart, inBlockSize);
     player = new Player((playerStart * inBlockSize), int(floors[playerStart].y - inPlayerSize), inPlayerSize);
   }
   
   void show() {
     player.show();
     env.show();
     physics.init();
   }
   
}

void keyPressed() {
  //39 = rightArrow, 37 = leftArrow; 38 == upArrow;
  if(keyCode == 39) {env.moveRight = true;} else {env.moveRight = false;}
  if(keyCode == 37) {env.moveLeft = true;} else {env.moveLeft = false;}
  if(keyCode == 38) {player.startJump = true;} else {player.startJump = false;}
}

void keyReleased() {
  env.moveLeft = false;
  env.moveRight = false;
  player.startJump = false;
}
