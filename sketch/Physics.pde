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
     if(floors[leftBlock].y < floors[activeBlock].y) {
       if(floors[leftBlock].x + blockSize > player.pos.x - playerSize/2) {
         if(player.pos.y < floors[rightBlock].y) {
           activeBlock = leftBlock;
         } else {
           wallCollision();
         }
       }
     } else {
       if(floors[leftBlock].x + blockSize > player.pos.x + playerSize/2) activeBlock = leftBlock;
     }
     if(floors[rightBlock].y < floors[activeBlock].y) {
       if(floors[rightBlock].x < player.pos.x + playerSize/2) {
         if(player.pos.y < floors[rightBlock].y) {
           activeBlock = rightBlock;
         } else { 
           wallCollision();
         }
       }
     } else {
       if(floors[rightBlock].x < player.pos.x - playerSize/2) activeBlock = rightBlock;
     }
   }
   
   void wallCollision() {playerSpeed *= -1;}
   
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
