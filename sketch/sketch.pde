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

import KinectPV2.*;
kinect = new Kinect();
KinectPV2 kinect;

void setup ()' {
  kinect.init();
  noStroke();
  size(1400, 900);
  smooth(4);
  loadData();
  game = new Game(blockSize, playerStart, playerSize);
}

void draw() {
  ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonColorMap();
  game.show();
  
  for (int i = 0; i < skeletonArray.size(); i++) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
    if (skeleton.isTracked()) {
      KJoint[] joints = skeleton.getJoints();
      if(joints[KinectPV2.JointType_HandRight].getState() == 3) {
        env.moveRight = true;
      } else env.moveRight = false;
      if(joints[KinectPV2.JointType_HandLeft].getState() == 3) env.moveLeft = true; else env.moveLeft = false;
    }
  }
}

void loadData() {
  json = loadJSONObject("data/data.json");
  groundPositions = json.getJSONObject("groundPositions");
  spikePositions = json.getJSONObject("spikePositions");
  doorPositions = json.getJSONObject("doorPositions");
  roofPositions = json.getJSONObject("roofPositions");
}

//  if(keyCode == 39) env.moveRight = true;
//  if(keyCode == 37) env.moveLeft = true;

void navigate(int handState) {
  switch(handState) {
  case KinectPV2.HandState_Open:
  env.moveRight = false;
    break;
  case KinectPV2.HandState_Closed:
  env.moveRight = false;
    break;
  }
}
