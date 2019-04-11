import processing.sound.*;
Sound jump;

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

boolean useKeys = true;

import KinectPV2.*;
KinectPV2 kinect;

void setup () {
  kinect = new KinectPV2(this);
  kinect.enableSkeletonColorMap(true);
  kinect.enableColorImg(true);
  kinect.init();
  noStroke();
  size(1400, 900);
  smooth(4);
  loadData();
  game = new Game(blockSize, playerStart, playerSize);
}

void draw() {
  game.show();
}

void loadData() {
  json = loadJSONObject("data/data.json");
  groundPositions = json.getJSONObject("groundPositions");
  spikePositions = json.getJSONObject("spikePositions");
  doorPositions = json.getJSONObject("doorPositions");
  roofPositions = json.getJSONObject("roofPositions");
}
