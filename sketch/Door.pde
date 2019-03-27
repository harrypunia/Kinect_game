class Door {
 
  float speed, size, moveGate = 0, topY, botY, gap;
  boolean close = false;
  Floor [] floors;
  Roof [] roofs;
  
  Door (Floor [] inFloor, Roof [] inRoof, float s, float w) {
   floors = inFloor;
   roofs = inRoof;
   speed = s;
   size = w;
 }
 
 void show(int i) {
   update(i);
   fill(10, 10, 255);
   rect(roofs[i].x + size/2, topY, size, gap); //TOP
   rect(floors[i].x + size/2, botY, size, -gap); //BOT
 }
 
 void update(int i) {
   topY = roofs[i].y + blockSize + moveGate;
   botY = floors[i].y - moveGate;
   gap = (floors[i].y- roofs[i].y) / 2 - blockSize/ 2;
   animate(i);
 }
 
 void animate(int i) {
   if(this.close) moveGate += this.speed; else moveGate -= this.speed;
   if(topY > roofs[i].y + blockSize) this.close = false; else if (topY < roofs[i].y - gap + blockSize) this.close =  true;
 }
}
