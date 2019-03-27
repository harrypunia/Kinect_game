class Physics {
   int activeBlock, leftBlock, rightBlock;
   float size;
   Physics(int playerStart, float inSize) {
     size = inSize;
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
      if(floors[leftBlock].x + size > player.pos.x) {
        activeBlock = leftBlock;
      } else if(floors[rightBlock].x < player.pos.x) {
        activeBlock = rightBlock;
      }
   }
   void groundCollision() {
      if(player.pos.y >= floors[activeBlock].y) {
       //player.pos.y = floors[activeBlock].y - playerSize/2; 
      }
   }
}
