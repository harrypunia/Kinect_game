Floor [] floors = new Floor[40];
Roof [] roofs = new Roof[40];
float localSize;

class Environment {
 Environment(float size) {
   localSize = size;
   for(int i = 0; i < floors.length; i++) {
      roofs[i] = new Roof(i * size, int(random(size, height/4)), size);
      floors[i] = new Floor(i * size, int(random(height/1.5, height - size)), size);
     }
 }
 void show() {
   for(int i = 0; i < floors.length; i++) {
      roofs[i].show();
      floors[i].show();
    }
    checkCorners();
 }
 void checkCorners() {
   if(floors[0].x > 0) {
     for(int i = 0; i < floors.length; i++) {
       floors[i].x = floors[i].initX;
       roofs[i].x = roofs[i].initX;
     }
   } else if (floors[floors.length-1].x < (width - localSize)) {
      for(int i = 0; i < floors.length; i++) {
       float boxInDisplay = floors.length - (width/localSize);
       floors[i].x = floors[i].initX - boxInDisplay * localSize;
       roofs[i].x = roofs[i].initX - boxInDisplay * localSize;
      }
   }
 }
}
