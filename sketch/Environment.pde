Floor [] floors = new Floor[40];
Roof [] roofs = new Roof[40];

class Environment {
  
 float localSize;
 boolean moveLeft, moveRight;
 
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
    pan();
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
 
 void pan () {
     if(moveRight) {
      if(playerSpeed < playerMaxSpeed) {
         playerSpeed += playerAcceleration;
       } else {
         playerSpeed = playerMaxSpeed;
       }
     } else if (moveLeft) {
        if(playerSpeed > -playerMaxSpeed) {
           playerSpeed -= playerAcceleration;
         } else {
         playerSpeed = -playerMaxSpeed;
       }
     } else {
       playerSpeed = 0; //Work on deceleration
     }
  }
   
}
