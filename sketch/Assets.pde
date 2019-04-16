class Assets {
  PImage ground;
  PImage underGround;
  PImage background;
  PImage clouds;
  PImage playerRight;
  PImage playerLeft;
  PImage playerRightMove;
  PImage playerLeftMove;
  PImage playerRightJump;
  PImage playerLeftJump;
  PImage spike;
  PImage door;
  Assets() {
    ground = loadImage("data/ground.jpg");
    underGround = loadImage("data/underGround.jpg");
    background = loadImage("data/background.jpg");
    clouds = loadImage("data/clouds.png");
    playerRight = loadImage("data/player_right.png");
    playerLeft = loadImage("data/player_left.png");
    playerRightMove = loadImage("data/player_right_move.png");
    playerLeftMove = loadImage("data/player_left_move.png");
    playerRightJump = loadImage("data/player_right_jump.png");
    playerLeftJump = loadImage("data/player_left_jump.png");
    spike = loadImage("data/spike.png");
    door = loadImage("data/door.png");
  }
}
