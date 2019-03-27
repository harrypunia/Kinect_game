Game game;
int blockSize = 50; //size of each box
int playerStart = 1; //starting index of player
float playerSize = 20; //size of the player
float playerSpeed = 0; //speed at which player moves
float playerMaxSpeed = 8;
float playerAcceleration = 0.5;
float playerJumpSpeed = 12;
float gravity = 0.09;

void setup () {
  size(1200, 800);
  smooth(4);
  game = new Game(blockSize, playerStart, playerSize);
}

void draw() {
  background(255);
  game.show();
}
