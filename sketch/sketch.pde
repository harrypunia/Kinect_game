Game game;
int blockSize = 50; //size of each box
int playerStart = 1; //starting index of player
float playerSize = 40; //size of the player

void setup () {
  size(1200, 800);
  smooth(4);
  game = new Game(blockSize, playerStart, playerSize);
}

void draw() {
  background(255);
  game.show();
}
