Physics physics;
Player player;
Environment env;
Assets assets;
Feed feed;
boolean instruction1 = true, instruction2 = true;

class Game {

  Game(int inBlockSize, int playerStart, float inPlayerSize) {
    assets = new Assets();
    env = new Environment(inBlockSize);
    physics = new Physics(playerStart, inBlockSize, inPlayerSize);
    player = new Player((playerStart * inBlockSize) + inBlockSize/2, floors[playerStart].y - inPlayerSize/2, inPlayerSize);
    feed = new Feed(width/2, height/10);
    feed.add("Close either of your fists, to move");
  }

  void show() {
    drawBackground();
    player.show();
    env.show();
    physics.init();
    if(!useKeys) detectPose();
    feed.display();
    instructions();
  }

  void drawBackground() {
    float relBackPosX = floors[0].x/(100 * blockSize) * assets.background.width;
    float relBackPosY = -(assets.background.height - height)/2;
    image(assets.background, relBackPosX, relBackPosY, assets.background.width, assets.background.height);

    float relCloudPosX = floors[0].x/(100 * blockSize) * assets.clouds.width * 1.2;
    float relCloudPosY = -(assets.clouds.height - height)/2;
    image(assets.clouds, relCloudPosX, relCloudPosY, assets.clouds.width, assets.clouds.height);
  }
  
  void instructions() {
    if(instruction1 && physics.activeBlock == 7) {
      feed.add("Close both of your fists to jump");
      instruction1 = false;
    }
    if(instruction2 && physics.activeBlock == 12) {
      feed.add("Good Luck!");
      instruction2 = false;
    }
 }
  
}

void detectPose() {
  ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonColorMap();
  for (int i = 0; i < skeletonArray.size(); i++) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
    if (skeleton.isTracked()) {
      KJoint[] joints = skeleton.getJoints();
      if(joints[KinectPV2.JointType_HandRight].getState() == 3 && joints[KinectPV2.JointType_HandLeft].getState() == 3) {
        player.startJump = true;
      } else {
        player.startJump = false;
        if(joints[KinectPV2.JointType_HandRight].getState() == 3) {
          env.moveRight = true;
          player.updateImage(assets.playerRightMove);
          lastDirMove = "right";
        } else env.moveRight = false;
        if(joints[KinectPV2.JointType_HandLeft].getState() == 3) {
          env.moveLeft = true;
          player.updateImage(assets.playerLeftMove);
          lastDirMove = "left";
        } else env.moveLeft = false;
      }
    }
  } 
}

void keyPressed() {
  if(useKeys) {
  //39 = rightArrow, 37 = leftArrow; 38 == upArrow;
    if(keyCode == 39) env.moveRight = true;
    if(keyCode == 37) env.moveLeft = true;
    if(keyCode == 38) player.startJump = true;
  }
}

void keyReleased() {
  if(useKeys) {
    if(keyCode == 39) env.moveRight = false;
    if(keyCode == 37) env.moveLeft = false;
    if(keyCode == 38) player.startJump = false;
  }
}
