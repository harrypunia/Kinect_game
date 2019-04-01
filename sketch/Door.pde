class Door {
  
  float topX, botX, topY, botY, floorX, floorY, speed, wide, tall, moveGate = 0;
  int i;
  boolean close = false;
  Floor [] floors;
  Roof [] roofs;
  
  Door (Floor [] inFloor, Roof [] inRoof, float s, float w, int index) {
   floors = inFloor;
   roofs = inRoof;
   i = index;
   speed = s;
   wide = w;
   tall = (floors[i].y- roofs[i].y) / 2 - blockSize/ 2;
 }
 
 void show() {
   update();
   fill(10, 10, 255);
   rect(topX, topY, wide, tall); //TOP
   rect(botX, botY, wide, -tall); //BOT
 }
 
 void update() {
   topY = roofs[i].y + blockSize + moveGate;
   botY = floors[i].y - moveGate;
   topX = roofs[i].x + wide/2;
   botX = floors[i].x + wide/2;
   animate(i);
   collision();
 }
 
 void animate(int i) {
   if(this.close) moveGate += this.speed; else moveGate -= this.speed;
   if(topY > roofs[i].y + blockSize) this.close = false; else if (topY < roofs[i].y - tall + blockSize) this.close =  true;
 }
 
 void collision() {
   boolean touchingDoor = player.pos.y - playerSize/2 < topY + tall || player.pos.y + playerSize/2 > botY - tall;
   boolean touchingTopLeft = player.pos.x + playerSize / 2 > topX && player.pos.x + playerSize / 2 < topX + wide/2;
   boolean touchingBotLeft = player.pos.x + playerSize / 2 > botX && player.pos.x + playerSize / 2 < botX + wide/2;
   boolean touchingTopRight = player.pos.x - playerSize / 2 < topX + wide && player.pos.x - playerSize / 2 > topX + wide/2;
   boolean touchingBotRight = player.pos.x - playerSize / 2 < botX + wide && player.pos.x - playerSize / 2 > botX + wide/2;
   
   if(touchingDoor) {
     if(touchingTopLeft && touchingBotLeft) {
       playerSpeed *= -1;
       for(int j = 0; j < floors.length; j++) {
        floors[j].x = floors[j].initX - ((i-1-playerStart)*blockSize) - (blockSize-wide)/2; 
       }
     } else if (touchingTopRight || touchingBotRight) {
      playerSpeed *= -1; 
     }
   }
 }
 
}
