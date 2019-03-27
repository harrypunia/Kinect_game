class Player {
   PVector pos, vel, acc, gravity; 
   float s, jumpSpeed;
   boolean moveLeft, moveRight, startJump = false, jumping = false;
   int y;
   Player(float x, int y, float inS) {
     pos = new PVector(x, y);
     vel = new PVector(0, 0);
     acc = new PVector(0, 0);
     gravity = new PVector(0, 2);
     s = inS;
   }
   void show() {
    update();
    fill(200, 10, 200);
    rectMode(CENTER);
    rect(pos.x, pos.y, s, s);
   }
   void update() {
     vel.add(acc);
     pos.add(vel);
     acc.mult(0);
   }
   void applyForce(PVector force) {
    acc.add(force);
   }
   void move() {
     pan();
     jump();
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
   void jump() {
     if(!jumping) {
       if(startJump) applyForce(new PVector(0, -5)); jumping = true;
     } else {
      vel.add(gravity); 
      println('working');
     }
   }
}

void keyPressed() {
  //39 = rightArrow, 37 = leftArrow; 38 == upArrow;
  if(keyCode == 39) {player.moveRight = true;} else {player.moveRight = false;}
  if(keyCode == 37) {player.moveLeft = true;} else {player.moveLeft = false;}
  if(keyCode == 38) {player.startJump = true;} else {player.startJump = false;}
}

void keyReleased() {
  player.moveLeft = false;
  player.moveRight = false;
  player.startJump = false;
}
