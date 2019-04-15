class Door {
  
  float topX, botX, topY, botY, speed, wide, tall, moveGate = 0;
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
   if(floors[i].x > 0 && floors[i].x < width + wide) {
     fill(10, 10, 255);
     rect(topX, topY, wide, tall); //TOP
     rect(botX, botY, wide, -tall); //BOT
   }
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
   if(topY > roofs[i].y + blockSize - 5) this.close = false; else if (topY < roofs[i].y - tall + blockSize) this.close =  true;
 }
 
 void collision() {
   boolean touchingDoor = player.pos.y - playerSize/2 < topY + tall || player.pos.y + playerSize/2 > botY - tall;
   boolean touchingTip = player.pos.y - playerSize/2 < topY + tall && player.pos.y + playerSize/2 > topY + tall || player.pos.y + playerSize/2 > botY && player.pos.y - playerSize/2 < botY;
   boolean touchingLeft = player.pos.x + playerSize / 2 > botX && player.pos.x + playerSize / 2 < botX + wide/2;
   boolean touchingRight = player.pos.x - playerSize / 2 < botX + wide && player.pos.x - playerSize / 2 > botX + wide/2;
   float offsetLeft = (blockSize-wide)/2;
   float offsetRight = (blockSize-wide)/2-playerSize;
   
   if(touchingDoor) {
     if(touchingLeft) {
        env.setPosition(i, -offsetLeft);
        playerSpeed *= -1;
     } else if (touchingRight) {
        env.setPosition(i, offsetRight);
        playerSpeed *= -1;
     }
   }
 }
 
}
