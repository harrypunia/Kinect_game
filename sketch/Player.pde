class Player {
   PVector pos, vel, acc, gravity; 
   float size, jumpSpeed;
   boolean startJump, jumping = false;
   int y;
   Player(float x, int y, float inPlayerSize) {
     pos = new PVector(x, y);
     vel = new PVector(0, 0);
     acc = new PVector(0, 0);
     gravity = new PVector(0, 1);
     size = inPlayerSize;
   }
   void show() {
    update();
    jump();
    fill(200, 10, 200);
    rectMode(CENTER);
    rect(pos.x, pos.y, size, size);
   }
   void update() {
     vel.add(acc);
     pos.add(vel);
     acc.mult(0);
   }
   void applyForce(PVector force) {
    acc.add(force);
   }
   void jump() {
     if(!jumping) {
       if(this.startJump) {
         applyForce(new PVector(0, -5)); 
         jumping = true;
       }
     } else vel.add(gravity);
   }
}
