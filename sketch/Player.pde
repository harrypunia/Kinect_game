class Player {
  
   PVector pos, vel, acc, gravity; 
   float size, jumpSpeed;
   boolean startJump, jumping = false, die = false, once = true;
   PImage activeImage = assets.playerRight;
   
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
    imageMode(CENTER);
    image(activeImage, pos.x, pos.y, size, size);
    imageMode(CORNER);
   }
   
   void update() {
     vel.add(acc);
     pos.add(vel);
     acc.mult(0);
   }
   
   void updateImage (PImage which) {activeImage = which;}
   
   void applyForce(PVector force) {acc.add(force);}
   
   void jump() {
     if(!jumping) {
       if(this.startJump) {
         applyForce(new PVector(0, -playerJumpSpeed)); 
         jumping = true;
       }
     } else {
       if(lastDirMove == "left") updateImage(assets.playerLeftJump); else updateImage(assets.playerRightJump);
       vel.add(gravity);
     }
   }
   
   void fall() {jumping = true;}
   
   void death() {
     if(this.die) {
       playerSpeed = 0;
       if(once) {player.vel.y = -5; once = false;};
       startJump = true;
     }
   }
   
}
