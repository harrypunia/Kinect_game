class Physics {
  
   int activeBlock, leftBlock, rightBlock;
   float blockSize;
   
   Physics(int playerStart, float inBlockSize, float inPlayerSize) {
     blockSize = inBlockSize;
     playerSize = inPlayerSize;
     activeBlock = playerStart;
   }
   
   void init() {
     updateBlocks();
     setActiveBlock();
     groundCollision();
   }
   
   void updateBlocks() {
     leftBlock = activeBlock - 1;
     rightBlock = activeBlock + 1; 
   }
   
   void setActiveBlock() {
     float leftBlockEdge = floors[leftBlock].x + blockSize;
     
     if(blockIsHigher(leftBlock)) {
       if(leftBlockEdge > player.pos.x - playerSize/2) {
         if(playerIsHigher(leftBlock)) activeBlock = leftBlock; else wallCollision();
        }
     } else {if(leftBlockEdge > player.pos.x + playerSize/2) activeBlock = leftBlock;}
      
     if(blockIsHigher(rightBlock)) {
       if(floors[rightBlock].x < player.pos.x + playerSize/2) {
         if(playerIsHigher(rightBlock)) activeBlock = rightBlock; else wallCollision();
       }
     } else {if(floors[rightBlock].x < player.pos.x - playerSize/2) activeBlock = rightBlock;}
   }
   
   void wallCollision() {playerSpeed *= -1;}
   
   boolean blockIsHigher(int index) {if(floors[index].y < floors[activeBlock].y) return true; else return false;}
   
   boolean playerIsHigher(int index) {if(player.pos.y < floors[index].y) return true; else return false;}
   
   void groundCollision() {
      if(player.pos.y > floors[activeBlock].y - playerSize/2) {
         player.pos.y = floors[activeBlock].y - playerSize/2;
         player.vel.y = 0;
         player.jumping = false;
      } else if (player.pos.y < floors[activeBlock].y - playerSize/2) {
          player.fall();
      }
   }
   
}
