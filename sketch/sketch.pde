Game game;

void setup () {
  size(500, 500);
  game = new Game();
}

void draw() {
  background(255);
  game.show();
}
