class Assets {
  PImage ground;
  PImage underGround;
  PImage background;
  PImage clouds;
  Assets() {
    ground = loadImage("data/ground.jpg");
    underGround = loadImage("data/underGround.jpg");
    background = loadImage("data/background.jpg");
    //clouds = loadImage("data/clouds.jpg");
  }
}
