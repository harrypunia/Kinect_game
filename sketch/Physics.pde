class Physics {
   int activeBlock, leftBlock, rightBlock;
   float blockSize;
   Physics(int playerStart, float inBlockSize) {
     blockSize = inBlockSize;
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
      if(floors[leftBlock].x + blockSize > player.pos.x) {
        activeBlock = leftBlock;
      } else if(floors[rightBlock].x < player.pos.x) {
        activeBlock = rightBlock;
      }
   }
   void groundCollision() {
      if(player.pos.y > floors[activeBlock].y - playerSize) {
         player.pos.y = floors[activeBlock].y - playerSize;
         player.vel.y = 0;
         player.jumping = false;
      } else if (player.pos.y < floors[activeBlock].y - playerSize) {
          
      }
   }
}
