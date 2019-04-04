Game game;
int blockSize = 50; //size of each box
int playerStart = 5; //starting index of player
float playerSize = 50; //size of the player (max = blockSize)
float playerSpeed = 0; //speed at which player moves
float playerMaxSpeed = 6;
float playerAcceleration = 0.5;
float playerJumpSpeed = 12;
float gravity = 0.09;
//------OBSTALCES-------
float spikeSize = 20;
float doorSpeed = 2;
float doorWidth = 20;

JSONObject json;
JSONObject groundPositions;
JSONObject roofPositions;
JSONObject spikePositions;
JSONObject doorPositions;

void setup () {
  noStroke();
  size(1400, 900);
  smooth(4);
  loadData();
  game = new Game(blockSize, playerStart, playerSize);
}

void draw() {
  float relBackPosX = floors[0].x/(100 * blockSize) * assets.background.width;
  float relBackPosY = -(assets.background.height - height)/2;
  image(assets.background, relBackPosX, relBackPosY, assets.background.width, assets.background.height);
  game.show();
}

void loadData() {
  json = loadJSONObject("data/data.json");
  groundPositions = json.getJSONObject("groundPositions");
  spikePositions = json.getJSONObject("spikePositions");
  doorPositions = json.getJSONObject("doorPositions");
  roofPositions = json.getJSONObject("roofPositions");
}
