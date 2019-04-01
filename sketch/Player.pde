class Player {
  
   PVector pos, vel, acc, gravity; 
   float size, jumpSpeed;
   boolean startJump, jumping = false, die = false;
   
   Player(float x, float y, float inPlayerSize) {
     pos = new PVector(x, y);
     vel = new PVector(0, 0);
     acc = new PVector(0, 0);
     gravity = new PVector(0, 1);
     size = inPlayerSize;
   }
   
   void show() {
    death();
    update();
    jump();
    rectMode(CENTER);
    fill(200, 10, 200);
    rect(pos.x, pos.y, size, size);
    rectMode(CORNER); //reset
   }
   
   void update() {
     vel.add(acc);
     pos.add(vel);
     acc.mult(0);
   }
   
   void applyForce(PVector force) {acc.add(force);}
   
   void jump() {
     if(!jumping) {
       if(this.startJump) {
         applyForce(new PVector(0, -playerJumpSpeed)); 
         jumping = true;
       }
     } else vel.add(gravity);
   }
   
   void fall() {jumping = true;}
   
   void death() {
     if(this.die) {
       playerSpeed = 0;
       startJump = true;
     }
   }
   
}
