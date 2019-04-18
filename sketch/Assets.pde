class Assets {
  PImage ground;
  PImage underGround;
  PImage impurity;
  PImage roof;
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
  PImage doorUpside;
  Assets() {
    ground = loadImage("data/ground.jpg");
    roof = loadImage("data/roof.jpg");
    underGround = loadImage("data/underGround.jpg");
    background = loadImage("data/background.jpg");
    impurity = loadImage("data/impurity.jpg");
    clouds = loadImage("data/clouds.png");
    playerRight = loadImage("data/player_right.png");
    playerLeft = loadImage("data/player_left.png");
    playerRightMove = loadImage("data/player_right_move.png");
    playerLeftMove = loadImage("data/player_left_move.png");
    playerRightJump = loadImage("data/player_right_jump.png");
    playerLeftJump = loadImage("data/player_left_jump.png");
    spike = loadImage("data/spike.png");
    door = loadImage("data/door.png");
    doorUpside = loadImage("data/door_upside.png");
  }
}
