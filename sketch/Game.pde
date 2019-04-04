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
     drawBackground();
     player.show();
     env.show();
     physics.init();
   }
   
   void drawBackground() {
     float relBackPosX = floors[0].x/(100 * blockSize) * assets.background.width;
     float relBackPosY = -(assets.background.height - height)/2;
     image(assets.background, relBackPosX, relBackPosY, assets.background.width, assets.background.height);
     
     //float relCloudPosX = floors[0].x/(100 * blockSize) * assets.clouds.width;
     //float relCloudPosY = -(assets.clouds.height - height)/2;
     //image(assets.clouds, relCloudPosX, relCloudPosY, assets.clouds.width, assets.clouds.height);
   }
   
}

//void keyPressed() {
//  //39 = rightArrow, 37 = leftArrow; 38 == upArrow;
//  if(keyCode == 39) env.moveRight = true;
//  if(keyCode == 37) env.moveLeft = true;
//  if(keyCode == 38) player.startJump = true;
//}

//void keyReleased() {
//  if(keyCode == 39) env.moveRight = false;
//  if(keyCode == 37) env.moveLeft = false;
//  if(keyCode == 38) player.startJump = false;
//}
