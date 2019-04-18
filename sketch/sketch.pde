import processing.sound.*;

Game game;
int blockSize = 100; //size of each box
int playerStart = 5; //starting index of player
float playerSize = 50; //size of the player (max = blockSize)
float playerSpeed = 0; //speed at which player moves
float playerMaxSpeed = 8;
float playerAcceleration = 0.5;
float playerJumpSpeed = 12;
float gravity = 0.09;
//------OBSTALCES-------
float spikeSize = 20;
float doorSpeed;
float doorWidth = 20;
//-----JSON--------
JSONObject json;
JSONObject groundPositions;
JSONObject roofPositions;
JSONObject spikePositions;
JSONObject doorPositions;
//----Controls-----
boolean useKeys = true;
boolean godMode = true;
String lastDirMove = "right";
//-----SoundFiles-----
SoundFile SBack;
SoundFile SDeath;
SoundFile SDeathMusic;
SoundFile SJump;

import KinectPV2.*;
KinectPV2 kinect;


void setup () {
  loadSound();
  if(!useKeys) {
    kinect = new KinectPV2(this);
    kinect.enableSkeletonColorMap(true);
    kinect.enableColorImg(true);
    kinect.init();
  }
  noStroke();
  size(1920, 1200);
  smooth(4);
  loadData();
  game = new Game(blockSize, playerStart, playerSize);
  SBack.amp(0.5);
  SBack.play();
  SBack.loop();
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

void loadSound() {
  SBack = new SoundFile(this, "background.mp3");
  SJump = new SoundFile(this, "jump.mp3");
  SDeath = new SoundFile(this, "death.mp3");
  SDeathMusic = new SoundFile(this, "deathMusic.mp3");
}
