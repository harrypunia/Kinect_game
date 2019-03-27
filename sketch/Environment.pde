Floor [] floors = new Floor[100];
Roof [] roofs = new Roof[100];

class Environment {
  
 float localSize, groundSmoothness = .6;
 int groundIndex = 0;
 float [] groundPositions = {600, 610, 620, 630, 640, 650, 660, 670, 680, 690, 700};
 boolean moveLeft, moveRight;
 
 Environment(float size) {
   localSize = size;
   for(int i = 0; i < floors.length; i++) {
      if(random(1) > groundSmoothness) {
       groundIndex = int(random(groundPositions.length)); 
      }
      roofs[i] = new Roof(i * size, int(random(size, height/4)), size);
      floors[i] = new Floor(i * size, groundPositions[groundIndex], size);
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
