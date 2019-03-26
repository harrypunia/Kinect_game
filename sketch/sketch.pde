Game game;
int blockSize = 50; //size of each box

void setup () {
  size(1200, 800);
  game = new Game(blockSize);
}

void draw() {
  background(255);
  game.show();
}
