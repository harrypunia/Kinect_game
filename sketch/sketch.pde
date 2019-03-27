Game game;
int blockSize = 50; //size of each box
int playerStart = 5; //starting index of player
float playerSize = 20; //size of the player (max = blockSize)
float playerSpeed = 0; //speed at which player moves
float playerMaxSpeed = 6;
float playerAcceleration = 0.5;
float playerJumpSpeed = 12;
float gravity = 0.09;

void setup () {
  size(1400, 900);
  smooth(4);
  game = new Game(blockSize, playerStart, playerSize);
}

void draw() {
  background(255);
  game.show();
}
