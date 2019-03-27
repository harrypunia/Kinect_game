class Obstacles {
  
  int [] spikePositions = {20, 21, 22, 27, 28, 29, 36, 40, 41, 42, 55, 56, 59, 62, 64, 67, 72, 73, 80, 81, 85};
  int [] doorPositions = {18, 30, 48};
  Spike [] spikes = new Spike[spikePositions.length];
  Door [] doors = new Door[doorPositions.length];
  
  Obstacles(float blockSize, Floor [] floors, Roof [] roofs) {
    for(int i = 0; i < spikes.length; i++){
      spikes[i] = new Spike(floors, spikePositions[i], spikeSize);
    }
    for(int i = 0; i < doors.length; i++) {
     doors[i] = new Door(floors, roofs, doorSpeed, doorWidth); 
    }
  }
  
  void show() {
     for(int i = 0; i < spikes.length; i++) {
       spikes[i].show();
     }
     for(int i = 0; i < doors.length; i++) {
       doors[i].show(doorPositions[i]); 
     }
  }
  
}
